package web.servlet;

import domain.Demand;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.DemandService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "DemandServlet")
public class DemandServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("findAll".equals(method)) {
            findAll(request, response);
        } else if ("makeChecked".equals(method)) {
            makeChecked(request, response);
        } else if ("create".equals(method)) {
            createDemand(request, response);
        } else if ("cancel".equals(method)) {
            cancel(request, response);
        } else if ("delete".equals(method)) {
            delete(request, response);
        } else if ("checkCompleted".equals(method)) {
            checkCompleted(request, response);
        } else if ("findMine".equals(method)) {
            findMine(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private void findMine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DemandService service = new DemandService();
        User user = (User) request.getSession().getAttribute("user");

        try {
            List<Demand> list = service.findMine(user);
            request.setAttribute("list", list);
            request.getRequestDispatcher("showDemandList.jsp").forward(request, response);
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("查询需求列表失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    private void checkCompleted(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        DemandService service = new DemandService();
        try {
            service.checkCompleted(id);
            response.sendRedirect("DemandServlet?method=findMine");
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("确认需求已解决失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        DemandService service = new DemandService();
        try {
            service.delete(id);
            response.sendRedirect("DemandServlet?method=findAll");
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("删除求租信息失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    private void cancel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        DemandService service = new DemandService();
        try {
            service.cancel(id);
            response.sendRedirect("DemandServlet?method=findAll");
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("取消求租信息失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    private void createDemand(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Demand demand = new Demand();
        User user = (User) request.getSession().getAttribute("user");

        demand.setId(UUID.randomUUID().toString());
        demand.setUser_id(user.getId());
        demand.setDescription(request.getParameter("description"));
        demand.setState("待审核");
        demand.setUpdate_time(new Date());

        DemandService service = new DemandService();
        try {
            service.createDemand(demand);
            response.sendRedirect("DemandServlet?method=findMine");
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("发布求租信息失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    private void makeChecked(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        DemandService service = new DemandService();
        try {
            service.makeChecked(id);
            response.sendRedirect("DemandServlet?method=findAll");
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("审核信息失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        DemandService service = new DemandService();
        User user = (User) request.getSession().getAttribute("user");

        try {
            List<Demand> list = service.findAll(user);
            request.setAttribute("list", list);
            request.getRequestDispatcher("showDemandList.jsp").forward(request, response);
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("查询需求列表失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

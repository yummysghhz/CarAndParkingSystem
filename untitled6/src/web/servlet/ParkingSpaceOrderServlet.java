package web.servlet;

import domain.ParkingSpaceOrder;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.ParkingSpaceOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "ParkingSpaceOrderServlet")
public class ParkingSpaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String method = request.getParameter("method");
        if ("findAll".equals(method)) {
            findAll(request, response);
        } else if ("delete".equals(method)) {
            delete(request, response);
        } else if ("requestCancel".equals(method)) {
            requestCancel(request, response);
        } else if ("enableCancel".equals(method)) {
            enableCancel(request, response);
        } else if ("checkCompleted".equals(method)) {
            checkCompleted(request, response);
        } else if ("create".equals(method)) {
            createOrder(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private void createOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ParkingSpaceOrder order = new ParkingSpaceOrder();
        User user = (User) request.getSession().getAttribute("user");

        order.setId(UUID.randomUUID().toString());
        order.setSpace_id(Integer.parseInt(request.getParameter("spaceId").trim()));
        order.setLicense_plate(request.getParameter("licensePlate"));
        order.setUser_id(user.getId());
        order.setState("待付款");
        order.setUpdate_time(new Date());
        order.setDuration(request.getParameter("duration"));
        order.setPrice_in_all(Integer.parseInt(request.getParameter("priceInAll")));

        ParkingSpaceOrderService service = new ParkingSpaceOrderService();
        try {
            service.createOrder(order);
            response.sendRedirect("ParkingSpaceOrderServlet?method=findAll");
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("创建车位订单失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    /**
     * todo 【管理员】确认用户已归还车位后，可以确认车位订单已完成
     *
     * @param request
     * @param response
     */
    private void checkCompleted(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String parkingSpaceId = request.getParameter("parkingSpaceId");
        ParkingSpaceOrderService service = new ParkingSpaceOrderService();
        try {
            service.checkCompleted(id, Integer.parseInt(parkingSpaceId));
            response.sendRedirect("ParkingSpaceOrderServlet?method=findAll");
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("确认车位订单失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    /**
     * todo 【管理员】同意用户取消车位订单
     *
     * @param request
     * @param response
     * @throws IOException
     */
    private void enableCancel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String parkingSpaceId = request.getParameter("parkingSpaceId");
        ParkingSpaceOrderService service = new ParkingSpaceOrderService();
        try {
            service.cancel(id, Integer.parseInt(parkingSpaceId));
            response.sendRedirect("ParkingSpaceOrderServlet?method=findAll");
        } catch (Exception e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("取消车位订单失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    /**
     * todo 【用户】申请取消车位订单
     *
     * @param request
     * @param response
     */
    private void requestCancel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        ParkingSpaceOrderService service = new ParkingSpaceOrderService();
        try {
            service.requestCancel(id);
            response.sendRedirect("ParkingSpaceOrderServlet?method=findAll");
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("取消订单失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    /**
     * todo 【管理员】删除订单
     *
     * @param request
     * @param response
     * @throws IOException
     */

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        ParkingSpaceOrderService service = new ParkingSpaceOrderService();
        try {
            service.delete(id);
            response.sendRedirect("ParkingSpaceOrderServlet?method=findAll");
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("删除信息失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    /**
     * todo 查询全部订单
     *
     * @param request
     * @param response
     * @throws IOException
     */
    private void findAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ParkingSpaceOrderService service = new ParkingSpaceOrderService();
        try {
            User user = (User)request.getSession().getAttribute("user");
            List<ParkingSpaceOrder> list = service.findAll(user);
            request.setAttribute("list", list);
            request.getRequestDispatcher("showParkingSpaceOrder.jsp").forward(request, response);
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("查询订单信息失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

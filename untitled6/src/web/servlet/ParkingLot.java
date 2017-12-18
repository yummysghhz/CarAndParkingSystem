package web.servlet;

import domain.ParkingSpace;
import domain.ParkingSpaceOrder;
import domain.User;
import service.ParkingSpaceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ParkingLot")
public class ParkingLot extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("findAll".equals(method)) {
            findAll(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ParkingSpaceService service = new ParkingSpaceService();
        try {
            User user = (User)request.getSession().getAttribute("user");
            List<ParkingSpace> list = service.findAll(user);
            request.setAttribute("list", list);
            request.getRequestDispatcher("showParkingSpace.jsp").forward(request, response);
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("查询车位信息失败，返回<a href='index.jsp'>首页</a>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

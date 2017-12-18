package web.servlet;

import domain.CarOrder;
import domain.User;
import service.CarOrderService;
import service.ParkingSpaceOrderService;
import utils.PayApplication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "PayServlet")
public class PayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String item = request.getParameter("item");
//        String id = request.getParameter("id");
//        String spaceId = request.getParameter("spaceId");

        if ("parkingSpace".equals(item)) {
            checkParkingSpaceOrderPaid(request, response);
        } else if ("car".equals(item)) {
            checkCarOrderPaid(request, response);
        } else {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("订单信息出错，返回<a href='main.jsp'>首页</a>");
        }
    }

    private void checkCarOrderPaid(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");

        CarOrderService service = new CarOrderService();
        try {
            if (PayApplication.getPaid()) {
                service.checkPaid(id);
                //todo 这里之后要转到findMine
//            response.sendRedirect("CarOrderServlet?method=findMine");
                response.sendRedirect("CarOrderServlet?method=findAll");
            }
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("支付失败，返回<a href='main.jsp'>首页</a>");
        }
    }

    private void checkParkingSpaceOrderPaid(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String spaceId = request.getParameter("spaceId");

        ParkingSpaceOrderService service = new ParkingSpaceOrderService();
        try {
            if (PayApplication.getPaid()) {
                service.checkPaid(id, Integer.parseInt(spaceId));
                response.sendRedirect("ParkingSpaceOrderServlet?method=findAll");
            }
        } catch (SQLException e) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().println("支付失败，返回<a href='main.jsp'>首页</a>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

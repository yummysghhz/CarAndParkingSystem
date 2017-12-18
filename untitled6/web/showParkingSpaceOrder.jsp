<%--
  Created by IntelliJ IDEA.
  User: yummysghhz
  Date: 2017/12/15
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>showParkingSpaceOrder.jsp</title>
</head>
<body>
<jsp:include page="main.jsp" flush="true"/>

<h1>车位订单</h1>

${requestScope.message}
<c:if test="${empty requestScope.list}">
    无订单
</c:if>

<c:if test="${not empty requestScope.list}">
    <table border="1">
        <tr>
                <%--<td>编号</td>--%>
            <td>车位编号</td>
            <td>车牌号</td>
            <td>租用人</td>
            <td>车位租用时间</td>
            <td>费用</td>
            <td>订单状态</td>
            <td>状态更新时间</td>
            <c:if test="${sessionScope.user.role=='user'}">
                <td>操作</td>
            </c:if>
            <c:if test="${sessionScope.user.role=='admin'}">
                <td>管理员权限操作</td>
            </c:if>
        </tr>

            <%--<% int i = 0; %>--%>
        <c:forEach items="${requestScope.list}" var="order">
            <tr>
                    <%--<td><%=++i%></td>--%>
                <td>${order.space_id}</td>
                <td>${order.license_plate}</td>
                <td>${order.name}</td>
                <td>${order.duration}</td>
                <td>${order.price_in_all}</td>
                <td>${order.state}</td>
                <td>${order.update_time}</td>
                <c:if test="${sessionScope.user.role=='user'}">
                    <td>
                        <c:if test="${order.state=='待付款'}">
                            <a href="PayServlet?item=parkingSpace&id=${order.id}&spaceId=${order.space_id}">付款</a>
                            <a href="ParkingSpaceOrderServlet?method=requestCancel&id=${order.id}">申请取消</a>
                        </c:if>
                    </td>
                </c:if>
                <c:if test="${sessionScope.user.role=='admin'}">
                    <td>
                        <c:if test="${order.state=='完成'}">
                            <a href="ParkingSpaceOrderServlet?method=delete&id=${order.id}">删除</a>
                        </c:if>
                        <c:if test="${order.state=='申请取消'}">
                            <a href="ParkingSpaceOrderServlet?method=enableCancel&id=${order.id}&parkingSpaceId=${order.space_id}">同意取消</a>
                            <%--
                            <a href="ParkingSpaceOrderServlet?method=refuseCancel&id=${order.id}">不同意取消</a>
                            --%>
                        </c:if>
                        <c:if test="${order.state=='待付款'}">
                            <a href="ParkingSpaceOrderServlet?method=enableCancel&id=${order.id}&parkingSpaceId=${order.space_id}">取消</a>
                        </c:if>
                        <c:if test="${order.state=='车位租用中'}">
                            <a href="ParkingSpaceOrderServlet?method=checkCompleted&id=${order.id}&parkingSpaceId=${order.space_id}">订单已完成</a>
                        </c:if>
                    </td>
                </c:if>
            </tr>
        </c:forEach>

    </table>
</c:if>

</body>
</html>

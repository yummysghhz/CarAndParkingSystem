<%--
  Created by IntelliJ IDEA.
  User: yummysghhz
  Date: 2017/12/16
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>showParkingSpace.jsp</title>
</head>
<body>
<jsp:include page="main.jsp" flush="true"/>

<h1>停车位</h1>

<table border="1">
    <tr>
        <td>停车位编号</td>
        <td>位置</td>
        <td>日租金价格</td>
        <td>月租金价格</td>
        <td>停车位状态</td>
        <td>状态更新时间</td>
        <c:if test="${sessionScope.user.role=='user'}">
            <td>操作</td>
        </c:if>
    </tr>
    <c:forEach items="${requestScope.list}" var="parkingSpace">
        <tr>
            <td>${parkingSpace.id}</td>
            <td>${parkingSpace.location}</td>
            <td>${parkingSpace.daily_price}</td>
            <td>${parkingSpace.monthly_price}</td>
            <td>${parkingSpace.state}</td>
            <td>${parkingSpace.update_time}</td>
            <c:if test="${sessionScope.user.role=='user'}">
                <td>
                    <c:if test="${parkingSpace.state=='空闲'}">
                        <a href="createParkingSpaceOrder.jsp?spaceId=${parkingSpace.id}
                    &dailyPrice=${parkingSpace.daily_price}&monthlyPrice=${parkingSpace.monthly_price}">预定</a>
                    </c:if>
                </td>
            </c:if>
        </tr>
    </c:forEach>
</table>
</body>
</html>

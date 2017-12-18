<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yummysghhz
  Date: 2017/12/15
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>showCarOrder.jsp</title>
</head>
<body>
<jsp:include page="main.jsp" flush="true"/>
<h1>车辆订单</h1>
<table border="1">
    <tr>
        <td>车辆信息（车牌号）</td>
        <td>出租人</td>
        <td>租借人</td>
        <td>定金</td>
        <td>计价标准：油费（单位：元/升）</td>
        <td>订单状态</td>
        <td>状态更新时间</td>
        <td>操作</td>
        <td>管理员权限操作</td>
    </tr>
    <c:forEach items="${requestScope.list}" var="carOrder">
        <tr>
            <td>${carOrder.license_plate}</td>
            <td>${carOrder.owner_name}</td>
            <td>${carOrder.tenant_name}</td>
            <td>${carOrder.subscription_price}</td>
            <td>${carOrder.oil_price}</td>
            <td>${carOrder.state}</td>
            <td>${carOrder.update_time}</td>
            <td>
                <c:if test="${carOrder.state=='审核通过'}">
                    <a href="CarOrderServlet?method=applyOrder&id=${carOrder.id}">申请租用</a>
                </c:if>
                <c:if test="${carOrder.state=='待付款'}">
                    <c:if test="${carOrder.tenant_id==sessionScope.user.id}">
                        <a href="PayServlet?item=car&id=${carOrder.id}">付款</a>
                    </c:if>
                    <%--<a href="CarOrderServlet?method=requestCancel&id=${carOrder.id}">申请取消</a>todo 申请取消待完成--%>
                </c:if>
                <c:if test="${carOrder.state=='待确认'}">
                    <a href="CarOrderServlet?method=checkCompleted&id=${carOrder.id}">订单已完成</a>
                </c:if>
            </td>
            <td>
                <c:if test="${carOrder.state=='待审核'}">
                    <a href="CarOrderServlet?method=makeChecked&id=${carOrder.id}">通过审核</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

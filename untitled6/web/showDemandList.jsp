<%@ page import="domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yummysghhz
  Date: 2017/12/16
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>showDemandList.jsp</title>
</head>
<body>
<jsp:include page="main.jsp" flush="true"/>

<h1>需求列表</h1>

<table border="1">

    <tr>
        <td>求租人</td>
        <td>详细要求</td>
        <td>订单状态</td>
        <td>状态更新时间</td>
        <td>操作</td>
        <td>管理员权限操作</td>
    </tr>
    <c:forEach items="${requestScope.list}" var="demand">
        <tr>
            <td>${demand.name}</td>
            <td>${demand.description}</td>
            <td>${demand.state}</td>
            <td>${demand.update_time}</td>
            <td>
                <c:if test="${demand.user_id==sessionScope.user.id}">
                    <c:if test="${demand.state=='待审核'||demand.state=='审核完成'}">
                        <a href="DemandServlet?method=cancel&id=${demand.id}">取消</a>
                    </c:if>

                    <c:if test="${demand.state=='审核通过'}">
                        <a href="DemandServlet?method=checkCompleted&id=${demand.id}">需求已解决</a>
                    </c:if>
                </c:if>
            </td>
            <td>
                <a href="DemandServlet?method=delete&id=${demand.id}">删除</a>
                <c:if test="${demand.state=='待审核'}">
                    <a href="DemandServlet?method=makeChecked&id=${demand.id}">通过审核</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>

</table>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: yummysghhz
  Date: 2017/12/17
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<html>
<head>
    <title>main.jsp</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
${sessionScope.user.name}，你好～
<ul class="nav nav-pills">
    <li class="active"><a href="main.jsp">Home</a></li>
    <li><a href="#">...</a></li>
    <li><a href="#">...</a></li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            车辆求租<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="createDemand.jsp">发布车辆求租信息</a></li>
            <li><a href="DemandServlet?method=findAll">查看需求列表</a></li>
            <li class="divider"></li>
            <li><a href="DemandServlet?method=findMine">查看我发布过的需求</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            车辆出租<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="createRentingMsg.jsp">发布车辆出租信息</a></li>
            <li><a href="CarOrderServlet?method=findAll">查看出租列表</a></li>
            <li class="divider"></li>
            <li><a href="#">查看我的车辆出租信息</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            车位租赁 <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="ParkingLot?method=findAll">查看车位信息</a></li>
            <li><a href="#">link</a></li>
            <li><a href="#">link</a></li>
            <li class="divider"></li>
            <li><a href="ParkingSpaceOrderServlet?method=findAll">查看车位订单</a></li>
        </ul>
    </li>
    <li><a href="#">...</a></li>
</ul>

</body>
</html>

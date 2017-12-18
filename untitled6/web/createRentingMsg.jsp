<%--
  Created by IntelliJ IDEA.
  User: yummysghhz
  Date: 2017/12/17
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="main.jsp" flush="true"/>

<h1>发布车辆出租信息</h1>
<form action="CarOrderServlet">
    <input type="hidden" name="method" value="createRentingMsg"/>
    <h4>您要出租的车辆的车牌号为：</h4>
    <input type="text" name="licensePlate" value=""/><br>
    <input type="submit" value="提交出租信息">
    返回<a href='main.jsp'>首页</a>
</form>
</body>
</html>

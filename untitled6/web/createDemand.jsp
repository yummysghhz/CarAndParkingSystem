<%--
  Created by IntelliJ IDEA.
  User: yummysghhz
  Date: 2017/12/17
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>createDemand.jsp</title>
</head>
<body>
<jsp:include page="main.jsp" flush="true"/>
<h1>发布车辆求租信息</h1>

<form action="DemandServlet">
    <input type="hidden" name="method" value="create">
    <h4>您对于所租车辆的要求：</h4>
    <p><textarea name="description" rows="10" cols="50"></textarea></p>
    <input type="submit" value="提交求租信息">
    返回<a href='main.jsp'>首页</a>
</form>
</body>
</html>

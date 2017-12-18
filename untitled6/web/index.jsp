<%--
  Created by IntelliJ IDEA.
  User: yummysghhz
  Date: 2017/12/15
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index.jsp</title>
</head>
<body>
<form method="post" action="UserServlet?method=login">
    <table>
        <tr>
            <td>用户</td>
            <td><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password"/></td>
        </tr>
    </table>
    <input type="submit" value="登陆"/>

    <a href="register.jsp">注册</a>
</form>
</body>
</html>

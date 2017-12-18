<%--
  Created by IntelliJ IDEA.
  User: yummysghhz
  Date: 2017/12/17
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>carOrder.jsp</title>
    <script>
        function calculate() {
            var monthCount = parseInt(document.getElementById("monthCount").value);
            var dayCount = parseInt(document.getElementById("dayCount").value);
            var monthlyPrice = parseInt(document.getElementById("monthlyPrice").value);
            var dailyPrice = parseInt(document.getElementById("dailyPrice").value);
            document.getElementById("priceInAll").value = monthCount * monthlyPrice + dayCount * dailyPrice;
            document.getElementById("duration").value = monthCount.toString() + "个月" + dayCount.toString() + "天";
        }
    </script>
</head>
<body>
<jsp:include page="main.jsp" flush="true"/>
<h1>生成车位订单</h1>
<form action="ParkingSpaceOrderServlet">
    <input type="hidden" name="method" value="create" readonly/>
    <table border="1">
        <tr>
            <td>车位编号</td>
            <td><input type="text" name="spaceId" value='<%=request.getParameter("spaceId")%>' readonly/></td>
        </tr>
        <tr>
            <td>月租金价格</td>
            <td><input id="monthlyPrice" type="text" name="monthlyPrice"
                       value='<%=request.getParameter("monthlyPrice")%>' readonly/></td>
        </tr>
        <tr>
            <td>日租金价格</td>
            <td><input id="dailyPrice" type="text" name="dailyPrice" value='<%=request.getParameter("dailyPrice")%>'
                       readonly/></td>
        </tr>
        <tr>
            <td colspan="2">
                <h5 style="color:red">以下内容需要填写完整</h5>
            </td>
        </tr>
        <tr>
            <td>租赁时间</td>
            <td>
                <input id="monthCount" type="text" name="monthCount" value="0"/>个月
                <input id="dayCount" type="text" name="dayCount" value="0"/>天
                <input type="button" onclick="calculate()" value="时间设定完成，点此计算金额"/>
                <input id="duration" type="hidden" name="duration" value="" readonly/>
            </td>
        </tr>
        <tr>
            <td>价格</td>
            <td><input id="priceInAll" type="text" name="priceInAll" value="" readonly></td>
        </tr>
        <tr>
            <td>车牌号</td>
            <td><input type="text" name="licensePlate" value=""/></td>
        </tr>
    </table>
    <input type="submit" value="提交订单">
    返回<a href='main.jsp'>首页</a>
</form>
</body>
</html>

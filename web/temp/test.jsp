<%--
  Created by IntelliJ IDEA.
  User: Yvon
  Date: 2021-10-14
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>

<%--jsp declaration--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="importHead.jsp" %>
<html>
<head>
    <%
        HotelDAO hdao = new HotelDaoImpl();
        THotel hotel = hdao.getHotelByid(1);// get first hotel info from thotel table

        //get one user from tuser table using UserDAoImpl and display
        //this user information in current webpage with table
    %>
    <title>Test page</title>
</head>
<body>
This is my first jsp web page
<%
    String s = "I am a java programmer";
    out.println("<br><center><h3 style='color:red'>" + s + "</h3></center>");
    String stuid = "20180800221";
    String studname = "marry";
    int age = 21;

%>
<center>
    <table border="=1">

        <tr>
            <td>student id</td>
            <td><%=stuid%>
            </td>
        </tr>
        <tr>
            <td>student name</td>
            <td><%=studname%>
            </td>
        </tr>
        <tr>
            <td>student age</td>
            <td><%=age%>
            </td>
        </tr>
        <tr>
            <td>student profession</td>
            <td><%="Computer Science and technology"%>
            </td>
        </tr>
    </table>
</center>
<br>
<center>
    <%@include file="hotelcontent.jsp" %>
</center>


</body>
</html>

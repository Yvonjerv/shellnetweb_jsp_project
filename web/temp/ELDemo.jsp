<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="business.dao.*, business.impl.*,model.*" %>
<%@page import="java.util.*" %>

<%
    int a = 10;
    request.setAttribute("b", 10);
    request.setAttribute("sx1", "China");
    session.setAttribute("sx2", "USA");
    application.setAttribute("sx3", "Japan");

    session.setAttribute("city", "Shanghai");
    application.setAttribute("city", "Beijing");
    request.setAttribute("city", "Kunming");

    //request -> session -> Application  EL order
    UserDAO udao = new UserDaoImpl();
    VUser user = udao.getVUserById("beike1");
    request.setAttribute("loginUser", user);

    //Array
    String city[] = {"Hangzhou", "Nanjing", "Shengyang", "Guangzhou", "Dali"};
    request.setAttribute("city", city);

    //list
    HotelDAO hdao = new HotelDaoImpl();
    List<THotel> list = hdao.getHotelListByCondition(null, null);
    request.setAttribute("hotelList", list);

    //Operation
    TUser user1 = null;
    TUser user2 = udao.getTUserById("Bill123");
    request.setAttribute("user1", user1);
    request.setAttribute("user2", user2);
%>
<html>
<head>
    <title>ELDemo</title>
</head>
<body>
user1==null:${user1==null}<br>
user2==null:${user2==null}<br>
user2.userid=="Bill123"&&user2.pwd=="666666":
${user2.userid=="Bill123" && user2.pwd=="666666"}<br>
<br>
<hr>
<br>
${hotelList[0].hotelname}------${hotelList[0].city}<br>
${hotelList[1].hotelname}------${hotelList[1].city}<br>
${hotelList[2].hotelname}------${hotelList[2].city}<br>
${hotelList[3].hotelname}------${hotelList[3].city}<br>
${hotelList[4].hotelname}------${hotelList[4].city}<br>

${city[0]}<br> ${city[1]}<br> ${city[2]}<br> ${city[3]}<br> ${city[4]}<br>${city[5]}<br>
user account: ${loginUser.userid}. username: ${loginUser.username} user type: ${loginUser.utname}

<table width="241" height="96" border="1">
    <tr>
        <td align="center" bgcolor="#FFFFFF"> 6-2=${6-2}</td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF"> 4*6=${4*6}</td>
    </tr>
</table>

<%=(5 * 2 + 8) / 3 %><br>
<%=a * 8%><br>
${(5*2+8)/3}<br>

b = ${b}<br>
a = ${a}<br>

<%= a * 8%><br>
${b*8}<br>
${b>10}<br>
${b>1 && b<=10}<br>
${sx1}- ${sx2}- ${sx3}<br>
${city}
</body>
</html>

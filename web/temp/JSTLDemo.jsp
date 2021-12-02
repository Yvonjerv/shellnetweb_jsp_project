<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="business.dao.*, business.impl.*,model.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--//declaration-- we will import specific library--%>
<%
    UserDAO udao = new UserDaoImpl();
    VUser user = udao.getVUserById("beike1");
    request.setAttribute("user", user);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<c:if test="${condition}">--%>
<%--    --%>
<%--</c:if>--%>

<%--<c:forEach items="${array}" var="refence">--%>
<%--    --%>
<%--</c:forEach>--%>
<c:out value="hello world"> </c:out><br>
${user.username}<br>
${user.userid} --${user.username} --${user.utname}<br>
<c:out value="${user.userid}"></c:out> ---
<c:out value="${user.username}"></c:out> ---
<c:out value="${user.utname}"></c:out> <br><br>
use JSTL tag to output constant<br>
<c:out value="output"></c:out>

<br>
<%
    VUser loginuser = udao.getVUserById("Bill123");
    request.setAttribute("loginuser", loginuser);
%>

<br>Conidtional control of HTML content user &lt;c:if<br>
<c:if test="${loginuser!=null && loginuser.utid==1}">
    Currently logged in is the hotel administrator, administrator name is ${loginuser.username}
</c:if>
<c:if test="${loginuser!=null && loginuser.utid==2}">
    Currently logged in is an Ordinary member, user name is ${loginuser.username}
</c:if>
<c:if test="${loginuser==null && loginuser.utid==null}">
    Your user name and password are incorrect. Login failed!
</c:if>


<br><br>
//C FOREACH
<%
    HotelDAO hdao = new HotelDaoImpl();
    List<THotel> list = hdao.getHotelListByCondition(null, null);
    request.setAttribute("hotelList", list);
%>
<br><br>
<br>
<table border="1">
    <thead>
    <tr>
        <td>Hotel</td>
        <td>province</td>
        <td>city</td>
        <td>address</td>
    </tr>
    </thead>
    <c:forEach items="${hotelList}" var="hotel">
        <tr>
            <td>${hotel.hotelname}</td>
            <td>${hotel.province}</td>
            <td>${hotel.city}</td>
            <td>${hotel.detailaddr}</td>
        </tr>
    </c:forEach>
</table>

<br>
<br>
Using c:forEach to generate ouptu 1 to 10<br>
<c:forEach begin="1" end="10" step="1" var="i">
    ${i} ,
</c:forEach>
<br><br>
<c:forEach begin="1" end="10" step="1" var="i">
    ${10-i+1} ,
</c:forEach>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Yvon
  Date: 2021-10-14
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="importHead.jsp" %>
<%
    UserDAO udao = new UserDaoImpl();
    TUser user = udao.getTUserById("beike1");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<center>
    <table border="=1" style="width: 500px; height: auto; background: yellow;">

        <tr>
            <td>user id</td>
            <td><%=user.getUserid()%>
            </td>
        </tr>
        <tr>
            <td>user name</td>
            <td><%=user.getUsername()%>
            </td>
        </tr>
        <tr>
            <td>user mobile</td>
            <td><%=user.getMobile()%>
            </td>
        </tr>
        <tr>
            <td>user mail</td>
            <td><%=user.getMail()%>
            </td>
        </tr>
        <tr>
            <td>company name</td>
            <td><%=user.getCompanyname()%>
            </td>
        </tr>
        <tr>
            <td>user created date</td>
            <td><%=user.getCreatetime()%>
            </td>
        </tr>
    </table>
</center>

</body>
</html>

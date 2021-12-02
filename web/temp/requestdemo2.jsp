<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");
    %>
</head>
<body>
USERNAME=<%=username%><br>
PASSWORD=<%=pwd%>
</body>
</html>

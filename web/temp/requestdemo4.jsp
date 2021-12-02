<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        request.setAttribute("QQid", "731992");
        request.setAttribute("personalID", "123456789");
    %>
</head>
<body>
<h2>
    <%=request.getAttribute("QQid")%>
    <%=request.getAttribute("personalID")%>
</h2>
</body>
</html>

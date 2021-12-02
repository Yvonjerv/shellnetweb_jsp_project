<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        session.setAttribute("QQid", "838383");
        session.setAttribute("personalID", "98765457689");
    %>
</head>
<body>
<h2>
    QQID  <%=session.getAttribute("QQid")%>
    PERSONAL ID  <%=session.getAttribute("personalID")%>
</h2>
<a href="sessiondemo2.jsp">JUMP TO SESSION DEMO2</a>

</body>
</html>

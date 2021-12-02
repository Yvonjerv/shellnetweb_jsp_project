<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        Integer online_counter = (Integer) application.getAttribute("online_counter");
        if (online_counter == null) {
            application.setAttribute("online_counter", 1);
        } else {
            online_counter = online_counter + 1;
            application.setAttribute("online_counter", online_counter);
        }
    %>
</head>
<body>
<h2>COUNTER OF ONLINE PERSON IS <%=application.getAttribute("online_counter")%>
</h2>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="../test1.do?userid=beike1&pwd=000000"> request testServLet</a>
<br>
<form action="../test1.do" method="post">
    <input type="text" name="userid">
    <input type="text" name="pwd">
    <input type="submit" value="request TestServlet">
</form>
</body>
</html>
<%--http://localhost:8080/shellnetweb/test1.do--%>
<%--http://localhost:8080/shellnetweb/temp/requestTestServlet.jsp--%>
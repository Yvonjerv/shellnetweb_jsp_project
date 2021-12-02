<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>for control demo</title>
    <%
        String titleOfBooks[] = {"The old man and the sea", "Harry Potter",
                "Alice in Wonderland", "The Shawshank Redemption",
                "Voyage au centre de la Terre",
                "Vingt mille lieues sous les mers"};
    %>
</head>
<body>
<center>
    <table border=1 width=400px bgColor="#80ffff">
        <%
            for (int i = 0; i < titleOfBooks.length; i++) {
        %>
        <tr>
            <td>
                <%=titleOfBooks[i] %>
            </td>
        </tr>
        <%
            }
        %>

    </table>
</center>
</body>
</html>
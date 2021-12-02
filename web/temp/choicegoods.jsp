<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="../settlement.do" method="post">
    <table border="1">
        <tr>
            <td>Commodities</td>
            <td>price</td>
            <td>Quantity</td>
        </tr>
        <tr>
            <td>Coca cola</td>
            <td><input type="text" name="colaprice" value="7"></td>
            <td><input type="text" name="colanumber" value=""></td>
        </tr>
        <tr>
            <td>hamburger</td>
            <td><input type="text" name="hamburgerprice" value="14" readonly="readonly"></td>
            <td><input type="text" name="hamburgernumber" value=""></td>
        </tr>
        <tr>
            <td>French fries</td>
            <td><input type="text" name="frenchFriesprice" value="8"></td>
            <td><input type="text" name="frenchFriesnumber" value=""></td>
        </tr>
    </table>
    <input type="submit" value="OK">
</form>

</body>
</html>

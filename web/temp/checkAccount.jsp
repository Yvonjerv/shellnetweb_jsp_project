<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>
    <table border="0">
        <tr>
            <td>Commodities</td>
            <td>price</td>
            <td>Quantity</td>
            <td>Sum of commodities</td>
        </tr>
        <tr>
            <td>Coca cola</td>
            <td>${colaprice}</td>
            <td>${colanumber}</td>
            <td>${colaAccount}</td>
        </tr>
        <tr>
            <td>hamburger</td>
            <td>${hamburgerprice}</td>
            <td>${hamburgernumber}</td>
            <td>${hamburgerAccount}</td>
        </tr>
        <tr>
            <td>French fries</td>
            <td>${frenchprice}</td>
            <td>${frenchnumber}</td>
            <td>${frenchAccount}</td>
        </tr>
        <tr>
            <td colspan="3">Bill Account</td>

            <td>${billAmount}</td>
        </tr>
    </table>
</h3>
</body>
</html>

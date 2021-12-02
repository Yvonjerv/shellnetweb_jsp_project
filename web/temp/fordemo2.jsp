<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="importHead.jsp" %>
<%
    RoomTypeDaoImpl rDao = new RoomTypeDaoImpl();
    List<TRoomType> list = rDao.getRoomTypeListByHotelid(1);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <table border=1 width=400px bgColor="#eeeeee">
        <%
            for (TRoomType room : list) {
        %>
        <tr>
            <td>
                <%=room.getRoomtype() %>
            </td>
            <td>
                <%=room.getBedtype()%>
            </td>
            <td>
                <%=room.getPrice()%>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</center>
</body>
</html>

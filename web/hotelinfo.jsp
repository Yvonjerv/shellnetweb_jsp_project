<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="jspresources.jsp" %>
<%
    String id = request.getParameter("hotelid");
    //get business logical class
    HotelDAO hdao = new HotelDaoImpl();
    RoomTypeDAO rdao = new RoomTypeDaoImpl();

    //get specified hotel
    THotel hotel = hdao.getHotelByid(Integer.parseInt(id));
    request.setAttribute("hotel", hotel);

    //get all roomtype of this hotel
    List<TRoomType> list = rdao.getRoomTypeListByHotelid(Integer.parseInt(id));
    request.setAttribute("roomList", list);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title><%=hotel.getHotelname()%>
    </title>
    <!--begin to css of page-->
    <style type="text/css">
        /* Border styles */
        .title {
            width: 100%;
            height: 40px;
        }

        .sysmenu {
            width: 100%;
            height: 40px;
            border-bottom: #0033FF 1px solid;
            background: #0033FF;
        }

        .sysmenu a {
            color: #fff;
        }

        .sysmenu span {
            color: #fff;
        }

        #table-1 {
            width: 75%;
            margin-top: 10px;
        }

        #table-2 {
            width: 75%;
            margin-top: 10px;
        }

        .s1 {
            width: 200px;
            padding: 10px;
        }

        .s2 {
            font-size: 24px;
            color: #3333CC;
            font-weight: 600;
            width: 400px;
        }

        .s3 {
            font-size: 14px;
            font-weight: 400;
            color: #575757;
            text-align: left;
        }

        .s4 {
            font-size: 14px;
            font-weight: 400;
            color: #009ACD;
            text-align: left;
        }

        .s5 {
            font-size: 14px;
            font-weight: 400;
            color: #575757;
            text-align: center;
            text-decoration: none;
        }

        .s6 {
            font-size: 20px;
            font-weight: 400;
            color: #ff0000;
            padding: 20px;
            text-align: center;
        }

        .s7 {
            font-size: 16px;
            font-weight: 400;
            color: #000000;
            padding: 10px;
            text-align: left;
        }

        .s8 {
            font-size: 16px;
            font-weight: 400;
            color: #FF8C00;
            padding: 10px;
            text-align: center;
            text-decoration: none;
        }

        .titletd {
            background: #33CCFF;
            border: #33CCFF 1px solid;
            font-size: 14px;
            color: #fff;
        }

        #table-2 td {
            border-bottom: #666666 1px dashed;
        }

        .button {
            margin-left: 3px;
            margin-top: 3px;
            background: #FF8000;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体";
            /*www.52css.com*/
            font-size: 10pt;
            padding: 5px 5px;
            text-decoration: none;
        }

        .button2 {
            width: 100px;
            height: 21px;
            margin-left: 15px;
            margin-top: 3px;
            background: #00CC99;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体";
            /*www.52css.com*/
            font-size: 11pt;
            padding: 4px 4px;
            text-decoration: none;
            float: right;
        }

        .button3 {
            width: 130px;
            height: 21px;
            margin-left: 3px;
            margin-top: 3px;
            background: #FFA500;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体";
            /*www.52css.com*/
            font-size: 11pt;
            padding: 4px 4px;
            text-decoration: none;
            float: right;
        }
    </style><!-- end of css of page -->
</head>

<body>
<center>
    <div class="title">
        <div style="float:left; margin-left:20px;line-height:30px;"><span
                style="font-size:28px; color:#FF7F00; font-style: italic;font-weight: 800;">SHELL NET</span></div>
    </div>
    <%--    SYS MENU --%>
    <%@ include file="sysmenu.jsp" %>

    <!--begin of menu of hotel operation-->
    <div style="clear:both"></div>
    <div style="width:75%;height:40px; margin-top:10px;"><a class="button2" style="display: block;" href="edithotel.jsp?hotelid=${hotel.hotelid}">Edit Hotel</a>
        <a class="button3" style="width:130px; display: block;" href="hotelbookinginfo.html">Order View</a></div>
    <!--end of  menu of hotel operation-->
    <div style="clear:both"></div>
    <div style="margin-top:5px;width:75%;border:0.5px solid #CCC"></div>
    <!--begin of hotel information-->

    <table id="table-1">
        <tbody class="body">
        <tr>
            <td><img style="width:450px; height:280px;border-radius:5px" src="../upload/${hotel.photourl}"></td>
            <td style="text-align: left">
                <table width="100%" height="100%">
                    <tr style="line-height: 60px;">
                        <td class="s2">${hotel.hotelname}</td>
                    </tr>
                    <tr style="line-height: 40px;">
                        <td class="s3">${hotel.province}, ${hotel.city}, ${hotel.detailaddr} </td>
                    </tr>
                    <tr style="line-height: 40px;">
                        <td class="s4">Features：${hotel.features} </td>
                    </tr>
                    <tr style="line-height: 40px;">
                        <td class="s4">Services：${hotel.server} </td>
                    </tr>
                </table>
            </td>
        </tr>
        </tbody>
    </table><!-- end of hotel information-->
    <div style="width:75%;border:0.5px solid #CCC"></div>
    <!--begin to information of room-->

    <table id="table-2" cellspacing=0 cellpadding=0>
        <thead class="head">
        <tr style="line-height: 40px; text-align: center;">
            <td style="width:15%;" class="titletd">ROOM TYPE</td>
            <td style="width:18%;" class="titletd"></td>
            <td style="width:8%;" class="titletd">AREA</td>
            <td style="width:8%;" class="titletd">BED TYPE</td>
            <td style="width:8%;" class="titletd">SERVER</td>
            <td style="width:8%;" class="titletd">WIFI</td>
            <td style="width:8%;" class="titletd">PERSON'NUM</td>
            <td style="width:8%;" class="titletd">PRICE</td>
            <td style="width:8%;" class="titletd"></td>
            <td style="width:11%;" class="titletd"><a class="button" href="editroom.jsp?hotelid=${hotel.hotelid}">Add Type</a></td>
        </tr>
        </thead>

        <tbody class="body">

        <c:forEach items="${roomList}" var="room">
            <tr>
                <td class="s1"><img height="120px" src="../upload/${room.photourl}"></td>
                <td class="s7">${room.roomtype}                </td>
                <td class="s5">${room.area}m<sup>2</sup></td>
                <td class="s5">${room.bedtype} </td>
                <td class="s5">${room.roomserver} </td>
                <td class="s5">${room.wifi} </td>
                <td class="s5">${room.personamount} Persons</td>
                <td class="s6">￥${room.price}</td>
                <td><a class="button" href="editbooking.html">Booking</a></td>
                <td><a class="s5" href="editroom.jsp?typeId=${room.typeid}&hotelid=${room.hotelid}">Edit</a> | <a class="s5" href="#">Remove</a></td>
            </tr>
        </c:forEach>
        <!--end of information of room-->
        </tbody>
    </table>
</center>
</body>

</html>
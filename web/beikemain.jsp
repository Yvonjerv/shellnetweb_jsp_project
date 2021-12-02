<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="jspresources.jsp"%>

<%
    //get business logical class
    HotelDAO tdao = new HotelDaoImpl();
    List<THotel> list = tdao.getHotelListByCondition(null,null);
    request.setAttribute("hotelList", list);


%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title></title>
    <!--begin to css of page -->
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

        .s1 {
            width: 200px;
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
        }

        .s4 {
            font-size: 14px;
            font-weight: 400;
            color: #009ACD;
        }

        .s5 {
            font-size: 24px;
            font-weight: 400;
            color: #EE7621;
            padding: 20px;
        }

        .editbox {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 300px;
            height: 24px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 3px;
            margin-bottom: 3px;
        }

        .greenbuttoncss {
            font-family: "tahoma", "宋体";
            /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #93bee2 solid;
            background-color: #009393;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
    <!--end of css of page -->
</head>

<body>
<center>
    <div class="title">
        <div style="float:left; margin-left:20px;line-height:30px;"><span
                style="font-size:28px; color:#FF7F00; font-style: italic;font-weight: 800;">SHELL NET</span></div>
    </div>

<%--    SYS MENU --%>
    <%@ include file="sysmenu.jsp" %>

    <!--Query Toolbar-->
    <div style="width:85%;height:30px;margin:10px auto">
        <form action="">Position：<input class="editbox" type="text" name="position"></input>&nbsp;
            Hotel Name：<input class="editbox" type="text" name="hotelname"></input>
            <button class="greenbuttoncss" type="submit">Query</button>
        </form>
    </div>
    <!--List of Hotel-->
    <div style="margin-top:5px;width:75%;border:0.5px solid #CCC"></div>
    <table id="table-1">
        <tbody class="body">
        <!-- Begin to an hotel information -->

        <c:forEach items="${hotelList}" var="hotel">
        <tr>
            <td class="s1"><a href="hotelinfo.jsp?hotelid=${hotel.hotelid}"><img style="width:280px;height:180px;border-radius:5px"
                                                                      src="../upload/${hotel.photourl}"></a></td>
            <td style="width:600px;">
                <table style="width:100%; height:180px; margin-left:10px">
                    <tr>
                        <td class="s2"><a href="hotelinfo.jsp?hotelid=${hotel.hotelid}" style="text-decoration:none">${hotel.hotelname}</a></td>
                    </tr>
                    <tr>
                        <td class="s3">${hotel.province}, ${hotel.city}, ${hotel.detailaddr}</td>
                    </tr>
                    <tr>
                        <td class="s4">features：${hotel.features}</td>
                    </tr>
                    <tr>
                        <td class="s4">server：${hotel.server}</td>
                    </tr>
                </table>
            </td>
            <td valign="top" align="right" class="s5"><span
                    style="font-size:12px;">￥</span><span>
               ${hotel.cheapestPrice}
            </span><span style="font-size:16px;">yuan
                            start</span></td>
        </tr>
        <tr>
            <td colspan="3">
                <div style="width:100%;border:0.5px solid #CCC"></div>
            </td>
        </tr><!-- end of  an hotel information -->
        </c:forEach>
        </tbody>
    </table>
</center>
</body>

</html>
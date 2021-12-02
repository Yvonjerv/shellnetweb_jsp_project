<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="jspresources.jsp" %>
<%
    String id = request.getParameter("typeId");
    String hotelid = request.getParameter("hotelid");
    if (id == null || id.equals("")) {
        //add new room type info
    } else {
        int typeId = Integer.parseInt(id);
        RoomTypeDAO rdao = new RoomTypeDaoImpl();
        TRoomType room = rdao.getRoomTypeById(typeId);
        request.setAttribute("room", room);
    }
    request.setAttribute("hotelid", hotelid);

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    <script type="text/javascript">
        $(function(){
            /*After the upload button is clicked, the
            file control is invoked to open the file selector.
            */
            $("#choicePhoto").click(function(){
                $("#fileToUpload").click();
            });
            /*When a file is selected, the change method of the
            file control is started
             */
            $("#fileToUpload").change(function(e){
                $.ajaxFileUpload({
                    url:'fileuploadservlet.do',
                    type: "post",
                    secureuri:false,
                    fileElementId:'fileToUpload',
                    dataType: 'text',//return data's type
                    data:null,
                    success: function (data) {
                        alert("file upload successfully"); //display messge
                        var dataNew = "../upload/"+data
                        $('#upload').attr("src", dataNew)
                        $("#photourl").val(data);
                    },
                    error: function (data, status, e) {
                        alert("file upload failed");//display messge
                    }
                });
            });
        });
    </script>
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
            width: 85%;
            margin-top: 10px;
        }

        .s1 {
            font-size: 16px;
            font-weight: 400;
            color: #575757;
        }

        .editbox {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 400px;
            height: 23px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 2px;
            margin-bottom: 2px;
        }

        .editbox2 {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 300px;
            height: 23px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
        }

        .editbox3 {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 400px;
            height: 30px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 3px;
            margin-bottom: 3px;
            padding: 3px;
        }

        .bluebuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #93bee2 solid;
            background-color: #66B3FF;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }

        .graybuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #999999;
            border: 0px #93bee2 solid;
            background-color: gainsboro;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }

        .greenbuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #93bee2 solid;
            background-color: #009393;
            cursor: hand;
            font-style: normal;
            width: 120px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }

        .topic {
            margin-left: 100px;
            margin-top: 30px;
            width: 180px;
            height: 40px;
            background: #FF8000;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 20pt;
            padding: 20px 20px;
        }
    </style>
</head>
<body>
<center>
    <div class="title">
        <div style="float:left; margin-left:20px;line-height:30px;">
            <span style="font-size:28px; color:#FF7F00; font-style: italic;font-weight: 800;">SHELLNET</span>
        </div>
    </div>

    <%--    SYS MENU --%>
    <%@ include file="sysmenu.jsp" %>

    <!--酒店信息-->
    <div style="float:left;" class="topic">
        Edit room type
    </div>
    <div style="clear:both"></div>
    <div style="margin-top:10px;width:85%;min-width: 800px;border:0.5px solid #CCC"></div>
    <form action="saveroom.do" method="post">
        <table id="table-1">
            <tbody class="body">
            <tr>
                <td style="width:45%">
                    <table style="width:100%">
                        <tr>
                            <td><img id="upload" width="450px" height="300px" src="../upload/${room.photourl}"></td>
                        </tr>
                        <tr>
                            <td>

                                <input id="photourl" class="editbox2" type="text" name="photourl" value="${room.photourl}"
                                       readonly="readonly">
                                <input class="greenbuttoncss" type="button" value="Choice Picture" id="choicePhoto">
                                <!-- Hide file tag -->
                                <input id="fileToUpload" style="display:none" type="file" name="upfile"/>
                            </td>
                        </tr>
                    </table>
                </td>

                <td>
                    <table width="100%" height="300px;">
                        <tr>
                        <td style="display: none" class="s1" style="width:120px">HOTEL ID</td>
                        <td style="display: none"><input class="editbox" type="text" name="hotelid" value="${hotelid}"  readonly="readonly"
                                   style="background-color:lightgray"></td>
                        </tr>
<tr>
                        <td class="s1" style="width:120px ;display: none">Room ID</td>
                        <td style="display: none"><input class="editbox" type="text" name="typeId" value="${room.typeid}"  readonly="readonly"
                                   style="background-color:lightgray"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">room type</td>
                            <td><input class="editbox" type="text" name="roomtype" value="${room.roomtype}"></td>
                        </tr>
                        <tr>
                            <td class="s1">area</td>
                            <td><input class="editbox" type="number" name="area" value="${room.area}"></td>
                        </tr>
                        <tr>
                            <td class="s1">bed type</td>
                            <td>
                                <input class="editbox" type="text" name="bedtype" value="${room.bedtype}">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1">service</td>
                            <td><input class="editbox" type="text" name="server" value="${room.roomserver}"></td>
                        </tr>
                        <tr>
                            <td class="s1">wifi</td>
                            <td><select class="editbox3" name="wifi" >
                                <c:if test="${room!= null && room.wifi=='yes'}">
                                    <option value="yes" selected>yes</option>
                                    <option value="no">no</option>
                                </c:if>
                                <c:if test="${room!= null && room.wifi=='no'}">
                                    <option value="yes" >yes</option>
                                    <option value="no" selected>no</option>
                                </c:if>
                                <c:if test="${room== null}">
                                    <option value="yes" >yes</option>
                                    <option value="no">no</option>
                                </c:if>

                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="s1">occupancy</td>
                            <td><input class="editbox" type="number" name="personamount" value="${room.personamount}"></td>
                        </tr>
                        <tr>
                            <td class="s1">room amount</td>
                            <td><input class="editbox" type="number" name="roomamount" value="${room.roomamount}"></td>
                        </tr>
                        <tr>
                            <td class="s1">check price</td>
                            <td><input class="editbox" type="number" name="price" value="${room.price}">Yuan</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <input class="bluebuttoncss" type="submit" value="Save" id="choicePhoto">
                                <input class="graybuttoncss" type="button" value="Cancel" id="choicePhoto">
                            </td>
                        </tr>
                    </table>

                </td>
            </tr>
            </tbody>
        </table>
    </form>
</center>
</body>
</html>

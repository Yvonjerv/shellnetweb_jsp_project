<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="jspresources.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <!--begin to css of page-->
    <style type="text/css">
        body {
            background-image: url(img/hotelback2.jpg);
            background-repeat: no-repeat;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-attachment: fixed;
            postion: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        table {
            background: #ffffff;
            padding: 10px;
            border: #cccccc solid 1px;
            border-radius: 10px;
        }

        tr {
            height: 45px;
        }

        .editbox {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 180px;
            height: 23px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 2px;
            margin-bottom: 2px;
            margin-left: 10px;
        }

        .orangebuttoncss {
            font-family: "tahoma", "宋体";
            /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #FF8000 solid;
            background-color: #FF8000;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
            margin-left: 30px;
        }

        .bluebuttoncss {
            font-family: "tahoma", "宋体";
            /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #81BEF7 solid;
            background-color: #81BEF7;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
            margin-left: 30px;
        }

        .uploaduttoncss {
            font-family: "tahoma", "宋体";
            /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #81BEF7 solid;
            background-color: #00CC99;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
    <!--end of page css-->
    <meta charset="utf-8">
    <title>Registered hotel administer</title>
</head>

<body>
    <!-- begin to edit form -->
    <div style="margin-top: 100px; ">
        <center>
            <form action="savehotelmember.do" method="post">
                <table >
                    <tr >
                        <td colspan="4" style="border-bottom: #666666 1px solid; text-align: center;">
                            REGISTERED HOTEL ADMINISTRATOR
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">USER ACCOUNT</td>
                        <c:if test="${loginuser!=null}">
                            <td><input type="text" class="editbox" name="userid" value="${loginuser.userid}"
                                       readonly="readonly"></td>
                        </c:if>
                        <c:if test="${loginuser==null}">
                            <td><input type="text" class="editbox" name="userid"></td>
                        </c:if>

                        <td style="padding-left: 20px;">USER NAME</td>
                        <td><input type="text" class="editbox" name="username"
                                   value="${loginuser.username}"></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">LOGIN PASSWORD</td>
                        <td><input type="password" class="editbox" name="pwd" value="${loginuser.pwd}"></td>
                        <td style="padding-left: 20px;">MOBILE</td>
                        <td><input type="text" class="editbox" name="mobile" value="${loginuser.mobile}"></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">PASSWORD AGAIN</td>
                        <td><input type="password" class="editbox" name="pwd2"></td>
                        <td style="padding-left: 20px;">MAIL</td>
                        <td><input type="text" class="editbox" name="mail" value="${loginuser.mail}"></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">ENTERPRISE</td>
                        <td><input type="text" class="editbox" name="companyname" value="${loginuser.companyname}"></td>
                        <td></td>
                        <td rowspan="2">
                            <img id="licencephotocontent" height="80" style="border: #A9A9A9 1px solid"
                                 src="upload/${loginuser.licencephoto}">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 20px;">UPLOAD LICENCE</td>
                        <td><input type="text" class="editbox" name="licencephoto" disabled="true" value="upload/${loginuser.licencephoto}"></td>
                        <td><input type="button" class="uploaduttoncss" name="uploadphoto" value="Upload"></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;">
                            <c:if test="${loginuser==null || loginuser.userid==null}">
                            <input type="submit" class="orangebuttoncss"   name="login" value="Register">
                            </c:if>
                            <input type="button" class="bluebuttoncss" name="reset"
                                value="Cancel"> </td>
                    </tr>
                </table>
            </form>
        </center>
    </div> <!-- end of edit form -->
</body>
</html>
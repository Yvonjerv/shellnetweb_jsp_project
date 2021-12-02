<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="jspresources.jsp"%>
<%
    session.getAttribute("loginuser");
%>

<!-- begin to system menu-->
<div class="sysmenu" style="clear:both">
    <!--system menu-->
    <div style="float:left; margin-left:20px;margin-top:5px"><a style="font-size:24px;text-decoration:none;"  href="beikemain.jsp">Home Page</a>
    </div>
    <div style="float:right; margin-right:20px; margin-top:10px">
        <span style="margin-left:20px;margin-right:20px; color:#FFFF00">online：10</span>
        <span>|</span>
        <span style="margin-left:20px;color:#FFFF00 ">Welcome，
            ${loginuser.username}</span>

        <c:if test="${loginuser!=null && loginuser.utid==1}">
            <a style="text-decoration:none; margin-left:20px;" href="hotelmanage.jsp?" title="">My
                Hotels</a>
            <a style="text-decoration:none; margin-left:20px;" href="addhotelmember.jsp" title="">My
                Info</a>
            <a style="text-decoration:none; margin-left:20px;" href="#" title="">Logout</a>
        </c:if>

        <c:if test="${loginuser!=null && loginuser.utid==2}">
            <a style="text-decoration:none; margin-left:20px;" href="addnormalmember.jsp" title="">My Info</a>
            <a style="text-decoration:none; margin-left:20px;" href="userbookinginfo.jsp" title="">My Order</a>
            <a style="text-decoration:none; margin-left:20px;" href="logout.do" title="">Logout</a>
        </c:if>


        <c:if test="${loginuser==null || loginuser.utid==null}">
            <a style="text-decoration:none; margin-left:20px;" href="addnormalmember.jsp" title="">Member
                Register</a>
            <a style="text-decoration:none; margin-left:20px;" href="addhotelmember.jsp" title="">HAdmin
                Register</a>
            <a style="text-decoration:none; margin-left:20px;" href="login.jsp" title="">Login</a>
        </c:if>

    </div>
</div>
<!-- end of system menu-->
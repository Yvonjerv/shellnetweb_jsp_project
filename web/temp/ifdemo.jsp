<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="importHead.jsp" %>
<%
    String type = "sports"; //sports

%>
<body>
<!-- 使用JSP 脚本动态控制菜单生成的案例 -->
<ul style="width:100%;height:50px;background: #FFFF00;padding-top:10px">
        <%
      if(type.equals("news"))
      {
   %>
    <li style="width:200px; float: left; padding-right: 5px;list-style-type: none; ">
        <a href="">China News</a>
    </li>
    <li style="width:200px; float: left; padding-right: 5px;list-style-type: none; ">
        <a href="">International News</a>
    </li>
    <li style="width:200px; float: left; padding-right: 5px;list-style-type: none; ">
        <a href="">Military News</a>
    </li>

        <%
      }else{
    %>
    <li style="width:200px; float: left; padding-right: 5px;list-style-type: none; ">
        <a href="">Chinese Football</a>
    </li>
    <li style="width:200px; float: left; padding-right: 5px;list-style-type: none; ">
        <a href="">International Football</a>
    </li>
    <li style="width:200px; float: left; padding-right: 5px;list-style-type: none; ">
        <a href="">NBA</a>
    </li>

        <%
       }
   %>

</body>
</html>
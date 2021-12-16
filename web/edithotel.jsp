<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="jspresources.jsp" %>

<%
    String id = request.getParameter("hotelid");

    //get current login user and all hotel information of this login user
    VUser loginuser = (VUser)session.getAttribute("loginuser");
    //Permission check
	if(loginuser==null ||loginuser.getUtid()!=1){
		RequestDispatcher rd = request.getRequestDispatcher("prompt.jsp");
		request.setAttribute("promptMsg","You don't have permission");
		request.setAttribute("backUrl","beikemain.jsp");
		rd.forward(request,response);
		return;
	}else{
		if(id==null || id.equals("")){
			//it represnt this page will add new hotel
		}else {
			int hotelid = Integer.parseInt(id);
			HotelDAO hdao = new HotelDaoImpl();
			THotel hotel = hdao.getHotelByid(hotelid);
			if (!hotel.getUserid().equals(loginuser.getUserid())) {
				RequestDispatcher rd = request.getRequestDispatcher("prompt.jsp");
				request.setAttribute("promptMsg", "You don't have permission");
				request.setAttribute("backUrl", "beikemain.jsp");
				rd.forward(request, response);
				return;
			}
		}
	}

    if (id==null || id.equals("")){
        //do nothing
    }else{
        int hotelid = Integer.parseInt(id);
        HotelDAO hdao = new HotelDaoImpl();
        THotel hotel = hdao.getHotelByid(hotelid);

        if (hotel!=null || hotel.getHotelname()!=null){
            request.setAttribute("hotel", hotel);
        }
    }

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
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
    <!--begin to css of page-->
	<style type="text/css">
		/* Border styles */
		.title{
			width:100%; height: 40px;
		}
		
		.sysmenu{
			width:100%; height: 40px;
			border-bottom: #0033FF 1px solid;
			background: #0033FF;
		}
		.sysmenu a{
			color:#fff;
		}
		
		.sysmenu span{
			color:#fff;
		}
		#table-1{
			width:85%;
			margin-top:10px;
		}
		.s1{
			font-size: 16px;
			font-weight: 400;
			color:#575757;
		}
		.editbox{
			 background: #ffffff;
			 border: 1px solid #b7b7b7;
			 color: #003366;
			 cursor: text;
			 font-family: "arial";
			 font-size: 11pt;
			 width:400px;
			 height: 24px;
			 padding: 3px; 
			 border-radius: 5px 5px 5px 5px;
			 margin-top:2px;
			 margin-bottom:2px;
			 padding:3px;
		}
		
		.editbox2{
			 background: #ffffff;
			 border: 1px solid #b7b7b7;
			 color: #003366;
			 cursor: text;
			 font-family: "arial";
			 font-size: 11pt;
			 width:300px;
			 height: 24px;
			 padding: 3px; 
			 border-radius: 5px 5px 5px 5px;
		}
		
		.editbox3{
			 background: #ffffff;
			 border: 1px solid #b7b7b7;
			 color: #003366;
			 cursor: text;
			 font-family: "arial";
			 font-size: 11pt;
			 width:400px;
			 height: 30px;
			 padding: 3px; 
			 border-radius: 5px 5px 5px 5px;
			 margin-top:4px;
			 margin-bottom:4px;
			 padding:3px;
		}
		
		.bluebuttoncss {
			 font-family: "tahoma", "宋体"; /*www.52css.com*/
			 font-size: 11pt; color: #ffffff;
			 border: 0px #93bee2 solid;
			 background-color:#66B3FF;
			 cursor: hand;
			 font-style: normal ;
			 width:80px;
			 height:30px;
			 border-radius: 5px 5px 5px 5px;
		}
		
		.whitebuttoncss {
			 font-family: "tahoma", "宋体"; /*www.52css.com*/
			 font-size: 11pt;
			color: #999999;
			 border: 1px #A9A9A9 solid;
			 background-color:#ffffff;
			 cursor: hand;
			 font-style: normal ;
			 width:80px;
			 height:30px;
			 border-radius: 5px 5px 5px 5px;
		}

		.greenbuttoncss {
			 font-family: "tahoma", "宋体"; /*www.52css.com*/
			 font-size: 11pt; color: #ffffff;
			 border: 0px #93bee2 solid;
			 background-color:#009393;
			 cursor: hand;
			 font-style: normal ;
			 width:120px;
			 height:30px;
			 border-radius: 5px 5px 5px 5px;
		}
		.graybuttoncss {
			font-family: "tahoma", "宋体"; /*www.52css.com*/
			font-size: 11pt; color: #ffffff;
			border: 0px #93bee2 solid;
			background-color:#CCCCCC;
			color:#FFFFFF;
			cursor: hand;
			font-style: normal ;
			width:120px;
			height:30px;
			border-radius: 5px 5px 5px 5px;
		}
		.topic{
			margin-left:100px;
			margin-top:10px;
			width:280px; 
			height:40px; 
			border:#FF8000 solid 1px;
			border-radius: 5px;
			color:#FF8000;
			font-family: "tahoma", "宋体"; /*www.52css.com*/
			font-size: 20pt;
			padding:20px 20px;
		}
	</style>
	<!--end of page css-->
</head>
<body>
	<center>
		<div class="title">
			<div style="float:left; margin-left:20px;line-height:30px;">
				<span style="font-size:28px; color:#FF7F00; font-style: italic;font-weight: 800;" >SHELL NET</span>
			</div>
		</div>
		<!--begin to system menu -->
		<%--    SYS MENU --%>
		<%@ include file="sysmenu.jsp" %>
		<!-- end of system menu-->
		<!-- begin to edit form -->
		<div style="float:left;" class="topic">
			Edit Hotel Information
		</div> 
		<div style="clear:both"></div>
		<div style="margin-top:10px;width:85%;min-width: 800px;border:0.5px solid #CCC"></div>  
		<form action="savehotel.do" method="post">
			<table id="table-1">
				<tbody class="body">
					<tr>
						<td style="width:45%">
							<table style="width:100%">
								<tr>
									<c:if test="${hotel==null}">
									<td><img id="upload" width="450px" height="300px" src="img/nopicture.jpg"></td>
									</c:if>
									<c:if test="${hotel!=null}">
										<td><img id="upload" width="450px" height="300px" src="../upload/${hotel.photourl}"></td>
									</c:if>
								</tr>
								<tr>
									<td>

										<input id="photourl" class="editbox2" type="text" name="photourl" value="${hotel.photourl}" readonly="readonly">
										<input class="greenbuttoncss" type="button" value="Choice Picture" id="choicePhoto">
										<!-- Hide file tag -->
										<input id="fileToUpload" style="display:none" type="file" name="upfile"/>
									</td>
								</tr>
							</table>
						</td>
						
						<td>
							<table  width="100%" height="300px;">
								<tr style="display: none">
									<td class="s1" style="width:120px">HOTEL ID</td>
									<td><input class="editbox" type="text" name="hotelid" value="${hotel.hotelid}"  readonly="readonly"
									style="background-color:lightgray"></td>
								</tr>
								<tr>
									<td class="s1" style="width:120px">HOTEL NAME</td>
									<td><input class="editbox" type="text" name="hotelname" value="${hotel.hotelname}" ></td>
								</tr>
								<tr>
									<td class="s1" >Country</td>
									<td>
										<input class="editbox" type="text" name="country" value="${hotel.country}" >
									</td>
								</tr>
								<tr>
									<td class="s1" >Province</td>
									<td>
										<input class="editbox" type="text" name="province" value="${hotel.province}" >
									</td>
								</tr>
								<tr>
									<td class="s1" >City</td>
									<td>
										<input class="editbox" type="text" name="city" value="${hotel.city}" >
									</td>
								</tr>
								<tr>
									<td class="s1" >DETAILED ADDRESS.CITY</td>
									<td>
										<input class="editbox" type="text" name="detailaddr" value="${hotel.detailaddr}" ></td>
									</td>
								</tr>
								<tr>
									<td class="s1" >HOTEL FEATURES</td>
									<td><input class="editbox" type="text" name="features" value="${hotel.features}" ></td>
								</tr>
								<tr>
									<td class="s1" >HOTEL SERVICE</td>
									<td><input class="editbox" type="text" name="server" value="${hotel.server}" ></td>
								</tr>
								
								<tr>
									<td colspan="2" style="text-align: center">
										<input class="bluebuttoncss" type="submit" value="Save" id="choicePhoto">
										<input class="whitebuttoncss" type="reset" value="Cancel" id="choicePhoto">
									</td>
								</tr>
							</table>
							
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<!-- end of edit form -->
	</center>
</body>
</html>

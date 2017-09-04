<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%
String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link  type="image/x-icon" rel="shortcut icon" href="<%=basePath%>img/favicon.ico">
	<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<title>T-BOX</title>
</head>
<style>
	html, body{
		height: 100%;
	}
	.btu-hover:hover {
		background: #888;
	}
	.blackbg{
		background: #000;
	}
	.bclicked{
		background: #66ccff
	}
</style>
<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="left: 0px; margin: 0px ; padding: 0px;height: 100% ;padding-top: 50px;width: 200px;" id="accordion">
			<div id="ces" class="panel" style="border: 0px;">
		
				<button type="button" class="btn btn-group-justified " data-toggle="collapse" data-target="#demo"  data-parent="#accordion" style="border-radius: 0 !important; background: #999">数据展示</button>
				<div id="demo" class="collapse collapseing in blackbg" style="color: #999999 ; ">
					<button id="ensus" type="button" class="btn btn-default btn-block btn-info btu-hover blackbg bclicked" style="border-radius: 0 !important;;border: 0">用户活跃度</button>
					<button type="button" class="btn btn-default btn-block btn-info btu-hover blackbg" style="border-radius: 0 !important;border: 0">用户升级情况</button>
				</div>
				<button type="button" class="btn btn-group-justified" data-toggle="collapse" data-target="#demo2"  data-parent="#accordion" style="border-radius: 0 !important;background: #999">第二个按钮</button>
				<div id="demo2" class="collapse collapseing" style="color: #999999;background: #000 ">
					<button type="button" class="btn btn-default btn-block btn-info btu-hover blackbg" style="border-radius: 0 !important;border: 0">敬请期待666</button>
					<button type="button" class="btn btn-default btn-block btn-info btu-hover blackbg" style="border-radius: 0 !important;border: 0">敬请期待666</button>
					<button type="button" class="btn btn-default btn-block btn-info btu-hover blackbg" style="border-radius: 0 !important;border: 0">敬请期待666</button>
					<button type="button" class="btn btn-default btn-block btn-info btu-hover blackbg" style="border-radius: 0 !important;border: 0">敬请期待666</button>
					<button type="button" class="btn btn-default btn-block btn-info btu-hover blackbg" style="border-radius: 0 !important;border: 0">敬请期待666</button>
				</div>
			</div>
		</nav>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<!-- <div class="container"> -->
			<div class="navbar-header"  style="padding-left: 200px">
				<span class="navbar-brand">T-BOX</span>
			</div>
			<div  class="collapse navbar-collapse navbar-right"  style="padding-right: 30px">
			<a class="navbar-brand" href="<%=basePath%>/logout">退出</a>
			</div>
		<!-- </div> -->
	</nav>

	
 <div style="padding-left: 200px;" >
	
		<div id="include">
		</div>
	</div> 
	
</body>
</html>
<script>

	$(document).ready(function() {
		$('#include').load("<%=basePath%>table/ensus");
		$('#ces .btu-hover').click(function(event) {
			$('.bclicked').removeClass('bclicked')
			$(this).addClass('bclicked');
		});
		$('#ensus').click(function(event) {
			// $('#include').html("http://localhost:8080/tbox/table/ensus")
			 $('#include').load("<%=basePath%>table/ensus"); 
		<%-- 	$('#include').load("<%=basePath%>NewFile.jsp"); --%>
		});
	});
</script>
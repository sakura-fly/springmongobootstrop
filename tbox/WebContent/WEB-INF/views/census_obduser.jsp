<%@page import="com.tbox.model.Page"%>
<%@page import="com.tbox.model.Ensus"%>
<%@page import="java.util.List"%>
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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>用户活跃统计</title>
	<link  type="image/x-icon" rel="shortcut icon" href="<%=basePath%>img/favicon.ico">

</head>

<body>

		<nav class="navbar navbar-inverse navbar-fixed-top">
			<!-- <div class="container"> -->
				<div class="navbar-header" style="padding-left: 200px;">
				<!-- 	<ul class="breadcrumb" style="background: #000000;color: #ffffff">
					  <li class="active"><a href="#">Home</a></li>
					  <li class="active"><a href="#">Library</a></li>
					  <li class="active">Data</li>
					</ul> -->
					<span class="navbar-brand">T-BOX</span>
					<!-- <span class="">/</span> -->
					<!-- <span class="navbar-brand glyphicon glyphicon-menu-right"></span> -->
					<!-- <span class="navbar-brand">数据展示</span> -->
					<!-- <span class="navbar-brand glyphicon glyphicon-menu-right"></span> -->
					<!-- <span class="navbar-brand">用户活跃统计</span>  -->
				</div>

				<div  class="collapse navbar-collapse navbar-right" style="padding-right: 30px">

					<a id="export" class="navbar-brand" href="javascript:void(0);">导出</a> 
					<a class="navbar-brand" href="<%=basePath%>/logout">退出</a>
				</div>
			<!-- </div> -->
		</nav>
		
		<div class=" " style="padding-top: 50px;">
			<div style="padding: 0px;">
				<ol class="breadcrumb" >
				  <li><a href="#">T-BOX</a></li>
				  <li><a href="#">数据展示</a></li>
				  <li class="active">用户活跃度</li>
				</ol>
			</div>	
			<div class="starter-template">
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th >设备串号</th>
							<th>主机厂</th>
							<th id="ctime" onclick="do_sort('ctime')"><a href="javascript:void(0);">创建时间
							
							</a></th>
							<th id="etime" onclick="do_sort('etime')"><a href="javascript:void(0);">最后使用时间

							</a></th>

							<th id="count" onclick="do_sort('count')"><a href="javascript:void(0);">上报数据量

							</a></th>
							<th>区域</th>

						
						<th id="unum" onclick="do_sort('unum')"><a href="javascript:void(0);">用户数目
						</a></th>
					</tr>
				</thead>
				<tbody id="tablebody">
				</tbody>
			</table>
			<center>
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li id="previous" onclick='previous_page()'>
							<a href="javascript:void(0);" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
			
						<li id="next" onclick='next_page()'>
							<a href="javascript:void(0);" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</center>
			
		</div>
	</div>
	
</body>
</html>
<script type="text/javascript">



	var pant = {
		pagenum : 1,
		value : 1,
		key : null
	}

	var page;

	list_table();




	function next_page () {
		if(page.pageNum < page.pageTotal){
			jump_page(page.pageNum*1 + 1);
		}
	}

	function previous_page () {
		if(page.pageNum > 1){
			jump_page(page.pageNum-1);
		}
	}

	function jump_page (pagenum) {
		pant.pagenum=pagenum;
		list_table();
	}

	function list_table() {
		$.ajax({
			url: '<%=basePath%>table/ensus',
			type: 'POST',
			dataType: 'json',
			data: pant,
		})
		.done(function(e) {
			page = e;
			var ensus = e.content;
			print_table (ensus);
			print_page (e.pageTotal);
			change_page_stat ();
		})
		.fail(function(e) {
		})
		.always(function() {
		});
	}

	function print_table (ensus) {
		var _html="";

		for (var i = 0; i < ensus.length; i++) {

			_html+="<tr><td>" + ensus[i].appid + "</td>"+"<td>福迪</td>"+"<td>" + ensus[i].ctime + "</td>"+"<td>" + ensus[i].etime + "</td>"+"<td>" + ensus[i].count + "</td>"+"<td>无</td>"+"<td>" + ensus[i].unum + "</td></tr>";
		}
		$("#tablebody").html(_html);
	}

	function print_page (pageTotal) {
		$("#next").siblings('.mypage').remove();
		var page_html="";
		for (var i = 0; i < pageTotal; i++) {
			page_html+="<li id='page" + (i + 1) + "' class='mypage' onclick='jump_page(" + (i + 1) + ")'><a href='javascript:void(0);' >" + (i +1)+"</a></li>";
		}
		$("#previous").after(page_html);
	}

	function change_page_stat () {
		$("li.disabled").removeClass('disabled');
		if(page.pageNum == 1){
			$("#previous").addClass('disabled');
		} else if (page.pageNum == page.pageTotal) {
			$("#next").addClass('disabled');
		} 
		$("li.active").removeClass('active');
		$("#page" + page.pageNum).addClass('active');
	}








	$("#export").click(function(event) {
		$.ajax({
			url: '<%=basePath%>table/exportensus',
			type: 'POST',
			dataType: 'json',
		})
		.done(function(e) {
			if(e.stat == 1){
				window.location.href='<%=basePath%>load/' + e.fileName;
			} else {
				alert("导出失败")
			}

		}).fail(function(e) {
			alert("导出失败")
		}).always(function() {
		});

	});


	function do_sort (key) {
		$("#sortimg").remove();
		pant.key=key;
		pant.value=-pant.value;
		list_table();
		if(pant.value == -1){
			$("#"+ key + " a").html($("#"+ key + " a").html() + "<span id='sortimg' class='glyphicon glyphicon-chevron-down'></span>");
		} else if(pant.value == 1) {
			$("#"+ key + " a").html($("#"+ key + " a").html() + "<span id='sortimg' class='glyphicon glyphicon-chevron-up'></span>");
		}
	}






</script>
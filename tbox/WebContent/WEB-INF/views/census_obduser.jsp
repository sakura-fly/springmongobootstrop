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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户活跃统计</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link  type="image/x-icon" rel="shortcut icon" href="<%=basePath%>img/favicon.ico">
<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<style>
body {
	padding: 51px;
}
</style>
</head>

<body>
	<%
		Page<Ensus> ensusPage = (Page<Ensus>) request.getAttribute("ensus");
		List<Ensus> ensus = ensusPage.getContent();
		String v = (String)request.getParameter("value");
	%>




	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<span class="navbar-brand">tbox</span>
		</div>

		<div  class="collapse navbar-collapse navbar-right">
	<!-- 	<span class="dropdown">
		<span class="navbar-brand dropdown dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">导出</span>
			<ul class="dropdown-menu" style="margin-top: 53px">
	            <li><a href="javascript:void(0);" id="export">导出当前页</a></li>
	          </ul>
		</span> -->
			
			<a id="export" class="navbar-brand" href="javascript:void(0);">导出</a> 
			 <a class="navbar-brand" href="/tbox/logout">退出</a>
		</div>
	</div>
	</nav>

	<div class="starter-template"></div>
	<div class="container ">
		<div class="starter-template">
			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th >设备串号</th>
						<th>主机厂</th>
						<th id="ctime"><a href="javascript:void(0);">创建时间
						<%
						
							if("ctime".equals(request.getParameter("key"))){
								if("1".equals(v)){
								 %>
								
								 <span  class="glyphicon glyphicon-menu-up"></span>
								<%
								} else {
									 %>
									 
									 <span  class="glyphicon glyphicon-menu-down"></span>
									<%
								}
									 
							}
							%>
						</a></th>
						<th id="etime"><a href="javascript:void(0);">最后使用时间
						<%
						
							if("etime".equals(request.getParameter("key"))){
								if("1".equals(v)){
								 %>
								
								 <span  class="glyphicon glyphicon-menu-up"></span>
								<%
								} else {
									 %>
									 
									 <span  class="glyphicon glyphicon-menu-down"></span>
									<%
								}
									 
							}
							%>
						</a></th>
						
						<th id="count"><a href="javascript:void(0);">上报数据量
						<%
						
							if("count".equals(request.getParameter("key"))){
								if("1".equals(v)){
								 %>
								
								 <span  class="glyphicon glyphicon-menu-up"></span>
								<%
								} else {
									 %>
									 
									 <span  class="glyphicon glyphicon-menu-down"></span>
									<%
								}
									 
							}
							%>
						</a></th>
						<th>区域</th>
						<th id="unum"><a href="javascript:void(0);">用户数目
						<%
						
							if("unum".equals(request.getParameter("key"))){
								if("1".equals(v)){
								 %>
								
								 <span  class="glyphicon glyphicon-menu-up"></span>
								<%
								} else {
									 %>
									 
									 <span  class="glyphicon glyphicon-menu-down"></span>
									<%
								}
									 
							}
							%>
						</a></th>

					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < ensus.size(); i++) {
							Ensus e = ensus.get(i);
					%>

					<tr>
						<td><%=e.getAppid()%></td>
						<td>福迪</td>
						<td><%=e.getCtime()%></td>
						<td><%=e.getEtime()%></td>
						<td><%=e.getCount()%></td>
						<td>无</td>
						<td><%=e.getUnum()%></td>

					</tr>

					<%
						}
					%>

				</tbody>
			</table>
			<center>

				<nav aria-label="Page navigation">
				<ul class="pagination">
					<%
						if (1 == ensusPage.getPageNum()) {
					%>
					<li class="disabled"><span aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</span></li>
					<%
						} else {
					%>
					<li><a href="ensus?pagenum=<%=ensusPage.getPageNum() - 1%>"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<%
						}
						if (ensusPage.getPageTotal() <= 9) {
							for (int i = 1; i <= ensusPage.getPageTotal(); i++) {
								if (i == ensusPage.getPageNum()) {
					%>
					<li class="active"><span><%=i%></span></li>
					<%
						} else {
					%>
					<li><a href="ensus?pagenum=<%=i%>"><%=i%></a></li>
					<%
						}
					%>


					<%
						}
						} else {
							int f = 1;
							if (ensusPage.getPageNum() <= 5) {
								f = 1;
							} else if (ensusPage.getPageNum() >= ensusPage.getPageTotal() - 4) {
								f = (int) ensusPage.getPageTotal() - 8;
							} else {
								f = (int) ensusPage.getPageNum() - 4;
							}
							for (int i = f; i < f + 9; i++) {
								if (i == ensusPage.getPageNum()) {
					%>
					<li class="active"><span><%=i%></span></li>
					<%
						} else {
					%>
					<li><a href="ensus?pagenum=<%=i%>"><%=i%></a></li>
					<%
						}
					%>


					<%
						}
					%>

					<%
						}
						if (ensusPage.getPageNum() == ensusPage.getPageTotal()) {
					%>
					<li class="disabled"><span href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
					</span></li>
					<%
						} else {
					%>
					<li><a href="ensus?pagenum=<%=ensusPage.getPageNum() + 1%>"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
					<%
						}
					%>
				</ul>
				</nav>
			</center>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		var v = <%=v %>;
		$("#export").click(function(event) {
			//<%=basePath%>load/<%=ensusPage.getPageNum()%>
			$.ajax({
				url: 'exportensus',
				type: 'POST',
				dataType: 'json',
				data: {pagenum: '<%=ensusPage.getPageNum()%>'},
			})
			.done(function(e) {
				//window.location.href='http://www.ddhbb.com';
				if(e.stat == 1){
					window.location.href='<%=basePath%>load/' + e.fileName;
					//alert("导出成功，马上开始下载");
				} else {
					alert("导出失败")
				}

				console.log("success");
			}).fail(function(e) {
				alert("导出失败")
			}).always(function() {
				console.log("complete");
			});

			//return false;
		});
		$("#ctime").click(function(event) {
			if(v==1){
				v = -1;
			} else if(v == -1){
				v = 1;
			}else {
				v = 1;
			}
			window.location.href="ensus?pagenum=<%=ensusPage.getPageNum()%>&key=ctime&value=" + v;
		});
		$("#etime").click(function(event) {
			if(v==1){
				v = -1;
			} else if(v == -1){
				v = 1;
			}else {
				v = 1;
			}
			window.location.href="ensus?pagenum=<%=ensusPage.getPageNum()%>&key=etime&value=" + v;
		});
		$("#count").click(function(event) {
			if(v==1){
				v = -1;
			} else if(v == -1){
				v = 1;
			}else {
				v = 1;
			}
			window.location.href="ensus?pagenum=<%=ensusPage.getPageNum()%>&key=count&value=" + v;
		});
		$("#unum").click(function(event) {
			if(v==1){
				v = -1;
			} else if(v == -1){
				v = 1;
			}else {
				v = 1;
			}
			window.location.href="ensus?pagenum=<%=ensusPage.getPageNum()%>&key=unum&value=" + v;
		});
	});
</script>
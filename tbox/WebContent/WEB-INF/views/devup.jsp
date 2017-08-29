<%@page import="com.tbox.model.Ensus"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户活跃统计</title>
<link rel="stylesheet" href="/tbox/css/bootstrap.min.css">
<script src="/tbox/js/jquery-3.1.1.min.js"></script>
<script src="/tbox/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		List<Ensus> ensus = (List<Ensus>) request.getAttribute("ensus");
	%>
	<div class="container"">
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>设备串号</th>
					<th>主机厂</th>
					<th>创建时间</th>
					<th>最后使用时</th>
					<th>上报数据量</th>
					<th>区域</th>
					<th>用户数目</th>
					<th>最后用户名</th>
					<th>详情</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < ensus.size(); i++) {
						Ensus e = ensus.get(i);
				%>

				<tr>
					<td>94223155-b93a-45fa-81a6-de8cb11547f7</td>
					<td>福迪</td>
					<td><%=e.getCtime() %></td>
					<td><%=e.getEtime() %></td>
					<td><%=e.getCount() %></td>
					<td>区域</td>
					<td><%=e.getUnum() %></td>
					<td><%=e.getAppid() %></td>
					<td>url</td>
				</tr>

				<%
					}
				%>

				<!-- 
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>url</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>url</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>url</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>url</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>url</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>url</td>
				</tr> -->
			</tbody>
		</table>
	</div>
</body>
</html>
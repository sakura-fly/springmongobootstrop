<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link  type="image/x-icon" rel="shortcut icon" href="<%=basePath%>img/favicon.ico">
<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<title>登录</title>
</head>
<body style="background: #eeeeee">
	<%
		String loginerr = (String) request.getAttribute("loginerr");
	%>
	<div class="container">
		<div class="col-xs-4 col-xs-offset-4" style="margin-top: 60px">
			<form action="login" method="post" class="form-signin">
				<div class="form-group">
					<label></label> <input type="text" name="userName" id="userName"
						class="form-control" placeholder="请输入用户名">
				</div>
				<div class="form-group">
					<label></label> <input type="password" name="pwd" id="pwd"
						class="form-control" placeholder="请输入密码">
				</div>

				<div class="form-group">
					<label></label>
					<button type="submit" class="btn btn-info col-lg-12">登录</button>
				</div>

				<%
					if ("-1".equals(loginerr)) {
				%>
				<div class="form-group">
					<label></label>
					<div class="alert alert-danger" role="alert">用户名或密码错误</div>
				</div>
				<%
					}
				%>

			</form>
		</div>

	</div>
</body>
</html>
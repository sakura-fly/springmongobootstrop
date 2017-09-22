<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link type="image/x-icon" rel="shortcut icon" href="<%=basePath%>img/favicon.ico">
    <script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/rsa/tq-min.js"></script>
    <title>登录</title>
</head>
<style>
    .login-footer {
        width: 100%;
        height: 40px;
        line-height: 40px;
        position: absolute;
        bottom: 0;
        left: 0;
        z-index: 99;
        text-align: center
    }
</style>
<body style="background: #eeeeee">
<div class="container" style="margin-top: 200px">
    <center style="padding: 50px; font-size: 30pt;">博波云—汽车电子升级管理平台</center>

    <div class="col-xs-4 col-xs-offset-4">

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
                <button id="login" type="button" class="btn btn-info" style="width: 100%">登录</button>
            </div>


        </form>
    </div>

</div>
<div class="login-footer">
    ©2016 - 2018 郑州博波电子科技有限公司 All Rights Reserved.
</div>
<!-- <center style="position:fixed;bottom: 0;margin: 0 auto;">asd</center>	 -->
<!-- <div style="position:fixed;bottom: 0;margin: 0 auto;">
    <span>©2016 - 2018 郑州博波电子科技有限公司 All Rights Reserved. </span>
</div> -->
</body>
</html>
<script>
    $("#login").click(function (event) {
        var login_data = {};
        var rsa_data = {
            os: "js"
        }
        // var resstr = "{\"user\":\""+username+"\",\"pswd\":\""+password+"\"}";
        login_data.user = $("#userName").val();
        login_data.pswd = $("#pwd").val();
        $.ajax({
            url: '/sdea/auth/spubkey',
//            url: 'https://he.bobdz.com/sdea/auth/spubkey',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(rsa_data),
            contentType: "application/json; charset=utf-8",
            async: false,

        })
            .done(function (spuk) {
                var rsa = new RSAKey();
                rsa.setPublic(spuk.pubkey, "10001");
                var res = rsa.encrypt(JSON.stringify(login_data));
                if (res) {
                    var rsa_res = {
                        rsa: linebrk(hex2b64(res), 64)
                    }
                    $.ajax({
                        url: '/sdea/auth/authenticate',
//                        url: 'https://he.bobdz.com/sdea/auth/authenticate',
                        type: 'POST',
                        dataType: 'json',
                        data: JSON.stringify(rsa_res),
                        async: false,
                        contentType: "application/json; charset=utf-8"
                    })
                        .done(function (e) {
                            if (e.success == 0) {
                                alert("用户名或密码错误")
                            } else {
                                var user = {};
                                user.name = login_data.user;
                                user.salt = e.success;
                                window.name = JSON.stringify(user);
                                $.ajax({
                                    url: '<%=basePath%>login',
                                    // url: 'login',
                                    type: 'POST',
                                    dataType: 'json',
                                    data: {username: user.name},
                                    async: false,
                                });
                                // window.location.href="frame";
                                window.location.href = "<%=basePath%>frame";


                                // $.post('login', {username: user.name});
                            }


                        })
                        .fail(function () {
                            alert("登录失败")
                        })
                        .always(function () {
                        });

                }
            })
            .fail(function () {
                alert("登录失败")
            })
            .always(function () {
            });

    });
</script>
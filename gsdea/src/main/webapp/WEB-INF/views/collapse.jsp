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
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap-switch.min.css">
      <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>    
    <script src="<%=basePath%>js/bootstrap-switch.min.js"></script>
    <script src="<%=basePath%>app/page.js"></script>
    <script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.0&key=53c438158a47a32a5280340d425c2d82"></script> -->

    <title>博波云—汽车电子升级管理平台</title>
</head>
<style>
    html, body {
        height: 100%;
    }

    .btu-hover:hover {
        background: #4a5064;
    }

    .blackbg {
        background: #333744;
    }

    .bclicked {
        background: #00c1de;
    }

    .sidebtn {
        background: #42485B;
        color: #fff;
        width: 100%;
        left: 0px;
    }

    .sidebtn:hover {
        /*background: #f00;*/
        background: #00c1de;
    }

    .bmig {
        margin-right: 10px;
    }

    .myfoux {
        background: #f00;
    }
</style>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top blackbg" role="navigation"
     style="margin: 0px ; padding: 0px; width: 200px; height: 100% ;padding-top: 50px;" id="accordion">
    <div id="ces" class="panel blackbg" style="border: 0px;">

        <a type="button" class="btn btn-group-justified sidebtn" data-toggle="collapse" data-target="#baservice"
           data-parent="#accordion" style="border-radius: 0 !important; ">
            <div class="input-group"><span class="glyphicon glyphicon-triangle-right  bmig"></span><b>基础服务</b></div>
        </a>
        <div id="baservice" class="collapse collapseing " style="color: #999999 ; ">
            <a id="map" type="button" class="btn btn-default btn-block btn-info btu-hover blackbg "
               style="border-radius: 0 !important;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-globe" style="margin-right:  10px;"></span>地域部署
                </div>
            </a>
            <a id="ensus" type="button" class="btn btn-default btn-block btn-info btu-hover blackbg "
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-list" style="margin-right:  10px;"></span>资源管理
                </div>
            </a>

        </div>

        <a type="button" class="btn btn-group-justified sidebtn" data-toggle="collapse" data-target="#plat"
           data-parent="#accordion" style="border-radius: 0 !important; ">
            <div class="input-group"><span
                    class="glyphicon glyphicon-triangle-right glyphicon-triangle-bottom bmig"></span><b>平台服务</b></div>
        </a>
        <div id="plat" class="collapse collapseing in" style="color: #999999 ; ">
            <a id="lvup" type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-level-up" style="margin-right:  10px;"></span>升级管理
                </div>
            </a>
            <a id="userctl" type="button" class="btn btn-default btn-block btn-info btu-hover blackbg "
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-user" style="margin-right:  10px;"></span>用户管理
                </div>
            </a>

        </div>

        <a class="btn sidebtn" data-toggle="collapse" data-target="#cloud" data-parent="#accordion"
           style="border-radius: 0 !important;">
            <div class="input-group"><span class="glyphicon glyphicon-triangle-right bmig"></span><b>云计算基础服务</b></div>
        </a>
        <div id="cloud" class="collapse collapseing" style="color: #999999; ">
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-tasks" style="margin-right:  10px;"></span>云计算服务ESC
                </div>
            </a>
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-cloud" style="margin-right:  10px;"></span>云计数据库
                </div>
            </a>
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-transfer" style="margin-right:  10px;"></span>负载均衡
                </div>
            </a>
        </div>


        <a type="button" class="btn   sidebtn" data-toggle="collapse" data-target="#bignum" data-parent="#accordion"
           style="border-radius: 0 !important;">
            <div class="input-group"><span class="glyphicon glyphicon-triangle-right bmig"></span><b>大数据(数加)</b></div>
        </a>
        <div id="bignum" class="collapse collapseing  " style="color: #999999; ">
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-record" style="margin-right:  10px;"></span>数加控制台概念
                </div>
            </a>
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-dashboard"
                                               style="margin-right:  10px;"></span>数据集成
                </div>
            </a>
        </div>

        <a type="button" class="btn   sidebtn" data-toggle="collapse" data-target="#cloudsafe" data-parent="#accordion"
           style="border-radius: 0 !important;">
            <div class="input-group"><span class="glyphicon glyphicon-triangle-right bmig"></span><b>安全(云盾)</b></div>
        </a>
        <div id="cloudsafe" class="collapse collapseing  " style="color: #999999; ">
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-record" style="margin-right:  10px;"></span>云盾控制台概念
                </div>
            </a>
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-certificate"
                                               style="margin-right:  10px;"></span>DDoS高防ip
                </div>
            </a>
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-screenshot"
                                               style="margin-right:  10px;"></span>数据审计
                </div>
            </a>
        </div>

        <a type="button" class="btn   sidebtn" data-toggle="collapse" data-target="#netweb" data-parent="#accordion"
           style="border-radius: 0 !important;">
            <div class="input-group"><span class="glyphicon glyphicon-triangle-right bmig"></span><b>网站与域名(万网)</b></div>
        </a>
        <div id="netweb" class="collapse collapseing " style="color: #999999; ">
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-globe" style="margin-right:  10px;"></span>域名
                </div>
            </a>
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-envelope" style="margin-right:  10px;"></span>企业邮箱
                </div>
            </a>
            <a type="button" class="btn btn-default btn-block btn-info btu-hover blackbg"
               style="border-radius: 0 !important;;border: 0">
                <div class="input-group"><span class="glyphicon glyphicon-screenshot"
                                               style="margin-right:  10px;"></span>数据审计
                </div>
            </a>
        </div>

    </div>
</nav>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-header" style="padding-left: 1px">
        <span class="navbar-brand" style="color: #fff;">博波云—汽车电子升级管理平台</span>
    </div>
    <div class="collapse navbar-collapse navbar-right" style="padding-right: 30px">
        <span id="uname" class="navbar-brand" style="color: #fff;"></span>
        <a class="navbar-brand" href="<%=basePath%>" style="color: #fff;">退出</a>
    </div>
</nav>


<div style="padding-left: 202px;">

    <div id="include">
    </div>
</div>


<div style="padding-left: 202px;">

    <div id="include">
    </div>
</div>

</body>
</html>
<script>

    $(document).ready(function () {


        var user = JSON.parse(window.name);
        $("#uname").text(user.name);


        // $('#include').load("<%=basePath%>NewFile.jsp");
        $("#lvup").click(function (event) {
            $('#include').load("<%=basePath%>lv");
        });
        $('.sidebtn ').click(function (event) {
            if ($(this).children('div').children('span').hasClass('glyphicon-triangle-bottom')) {
                $('.glyphicon-triangle-bottom').removeClass('glyphicon-triangle-bottom')
            } else {
                $('.glyphicon-triangle-bottom').removeClass('glyphicon-triangle-bottom')
                $(this).children('div').children('span').addClass('glyphicon-triangle-bottom');
            }

        });

        $('#ces .btu-hover').click(function (event) {
            $('.bclicked').removeClass('bclicked')
            $(this).addClass('bclicked');
        });

        $("#userctl").click(function (event) {
            $('#include').load("<%=basePath%>userctl");
        });

        // $("#map").click(function(event) {
        //      // $('#include').load("/tboxmap/");
        //      $('#include').load("/tboxmap/gddttest.jsp");
        // });

        $("#lvup").click();
    });

</script>
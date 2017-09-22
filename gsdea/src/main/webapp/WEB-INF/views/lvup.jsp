<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="<%=basePath %>js/jquery.form.min.js"></script>
    <style>

        .packagestate {
            display: inline-block;
            padding: 3px 8px;
            font-style: normal;
            color: #fff;
            font-size: 12px;
        }

        .enabled {
            background-color: #3cc051;
        }

        .disabled {
            background-color: #e8e8e8;
            color: #a2a2a2;
        }

        .fileUpload {
            position: relative;
            overflow: hidden;
            margin: 10px
        }

        .fileUpload input.upload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            height: 32px;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=100)
        }

        th {
            text-align: center;
        }

    </style>
    <title>升级管理</title>
</head>

<body>

<div id="content" style="padding: 10px;">
    <div id="uview" style="padding-top: 52px;">
        <h5 class=" page-header" style=" margin: 0; ">
            <ul class="nav nav-pills" role="tablist" id="mytabs" style="font-size: 17px;">
            </ul>
        </h5>
    </div>

    <div style="padding-top: 5px;">
        <button type="button" class="btn btn-success" style="border-radius: 0 !important;padding: 6px 30px;"
                data-toggle="modal" data-target="#uploadModal">创建
        </button>
        <!-- <button id="closed" type="button" class="btn btn-success" style="border-radius: 0 !important;padding: 6px 30px;">停用</button> -->
        <button id="refresh" type="button" class="btn btn-success"
                style="border-radius: 0 !important;padding: 6px 30px;">刷新
        </button>
        <button type="button" class="btn btn-success" style="border-radius: 0 !important;padding: 6px 30px;">日志</button>
    </div>
</div>
<div id="tables">

</div>

<div class="modal fade bs-example-modal-lg " id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     style="border-radius: 0 !important;border: 0">
    <div class="modal-dialog" role="document" style="border-radius: 0 !important;border: 0">
        <div class="modal-content" style="border-radius: 0 !important;border: 0">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">上传升级包</h4>
            </div>
            <div class="modal-body">
                <form action="https://he.bobdz.com/sdea/uploadfile/devupl" method="post">
                    <div class="form-group">
                        <label for=""></label>
                        <input type="number" class="form-control" id="softVer" name="softVer" placeholder="软件版本">
                    </div>
                    <div class="form-group">
                        <label for=""></label>
                        <input type="number" class="form-control" id="hwVer" name="hwVer" placeholder="硬件版本">
                    </div>
                    <div class="form-group">
                        <label for=""></label>
                        <textarea name="info" id="info" cols="30" rows="10" style="width: 100%"
                                  placeholder="版本描述"></textarea>
                    </div>
                    <div class="form-group">
                        <label for=""></label>
                        <!-- <input  type="file" id="file" name="file"> -->
                        <div class="fileUpload btn btn-primary"><span>浏览文件</span> <input name="file" type="file"
                                                                                         class="upload" id="file"></div>
                        <span class="showFileName"></span>
                    </div>
                    <input type="hidden" name="username" id="username" value="bbcl">
                    <input type="hidden" name="prod" id="prod" value="501">
                    <input type="hidden" name="salt" id="salt" value="32322323">
                </form>
            </div>
            <div class="modal-footer">
                <button id="uploadBtn" type="button" class="btn btn-primary"
                        style="border-radius: 0 !important;border: 0;width: 100px;">上传
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>


    $(document).ready(function () {
        var user = JSON.parse(window.name);
        var prod;

        var prod_id;

        var uppacks;


        function create_table_body() {


            var devlistdata = {
                "name": user.username,
                "salt": user.salt,
                "skip": (page.size * (page.num - 1)),
                "limt": page.size,
                "prod": prod_id
            }
            $.ajax({
                url: '/sdea/uploadfile/listdevupl',
//                url: 'https://he.bobdz.com/sdea/uploadfile/listdevupl',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(devlistdata),
                contentType: "application/json; charset=utf-8"
            })
                .done(function (e) {
                    uppacks = e;
                    var _tbody = '';
                    if (e.length == 0) {
                        $("#tablebody").html('<tr><td colspan="9" style="text-align:center;">对不起，无任何信息！</td></tr>');
                        create_table_foot();
                        return;
                    }
                    for (var i = 0; i < e.length; i++) {
                        _tbody +=
                            '<tr>' +
                            // '<td>' + '<input class="checkbox" type="checkbox" tag="'+i+'">' + '</td>' +
                            '<td>' + e[i].hardVer + '</td>' +
                            '<td>' + e[i].softVer + '</td>' +
                            '<td>' + e[i].time + '</td>' +
                            '<td>' + e[i].user + '</td>' +
                            '<td>' + e[i].name + '</td>' +
                            '<td>' + e[i].size + '</td>' +
                            '<td>' + e[i].info + '</td>' +
                            // '<td>' + e[i].stat + '</td>' +
                            '<td style="white-space:nowrap">' + (e[i].stat == 2 ? '<a href="' + e[i].url + '"><em class="packagestate enabled">请下载</em></a>' : '<em class="packagestate disabled">已禁用</em>') + '</td>' +
                            '<td>' + (e[i].stat == 2 ? '<button type="button" class="btn btn-danger closelink" style="border-radius: 0 !important;border: 0;padding: 3px 16px;" tag="' + i + '" stat="2">禁用</button>' : '<button type="button" class="btn btn-info closelink" style="border-radius: 0 !important;border: 0;padding: 3px 16px;" tag="' + i + '" stat="1">启用</button>') + '</td></tr>'
                    }


                    $("#tablebody").html(_tbody);
                    create_table_foot();
                })
                .fail(function () {
                })
                .always(function () {
                });

        }


        function create_table_foot() {

            var pagen = '';
            pagen +=
                '<center>' +
                '<nav aria-label="Page navigation">' +
                '<ul class="pagination">' +
                '<li id="previous" >' +
                '<a href="javascript:void(0);" aria-label="Previous">' +
                '<span aria-hidden="true">&laquo;</span>' +
                '</a>' +
                '</li>';
            // pagen += '<a onclick="next_page()">aaaa</a>';
            //onclick='jump_page(" + (i + 1) + ")'
            if (page.num < 5) {
                for (var i = 0; i < 10; i++) {
                    pagen += "<li id='page" + (i + 1) + "' class='mypage' tag=" + (i + 1) + "><a href='javascript:void(0);' >" + (i + 1) + "</a></li>"
                }
            } else {
                for (var i = (page.num - 5); i < (page.num * 1 + 5); i++) {
                    pagen += "<li id='page" + (i + 1) + "' class='mypage' tag=" + (i + 1) + "><a href='javascript:void(0);' >" + (i + 1) + "</a></li>"
                }
            }
            pagen +=
                '<li id="next" >' +
                '<a href="javascript:void(0);" aria-label="Next">' +
                '<span aria-hidden="true">&raquo;</span>' +
                '</a>' +
                '</li>' +
                '</ul>' +
                '</nav>' +
                '</center>';
            $("#pageul").html(pagen);
            $("#page" + page.num).addClass('active');
            if (page.num == 1) {
                $("#previous").addClass('disabled')
            }
        }


        // function jump_page (page_num) {
        // 	// alert(page_num);
        // 	page.num = page_num;
        // 	create_table_body();
        // }

        $("#file").change(function (event) {
            var filePath = $(this).val();
            var arr = filePath.split('\\');
            var fileName = arr[arr.length - 1];
            $("span.showFileName").html(fileName);
        });


        $("#uploadBtn").click(function (event) {
            if (prod_id) {
                $("#username").val(user.name);
                $("#prod").val(prod_id);
                $("#salt").val(user.salt);

                $("form").ajaxSubmit({
                    success: function (data) {
                        alert('上传成功');
                        $("#uploadModal").modal("hide");
                        $("#hwVer").val('');
                        $("#softVer").val('');
                        $("#info").val('');
                        $("#file").val('');
                        $(".showFileName").text('');
                        create_table_body();
                    },
                    error: function (error) {
                        alert('上传失败');


                    },
                    // url: '/Default1/UploadFilesPost', /*设置post提交到的页面*/
                    // type: "post", 设置表单以post方法提交
                    // dataType: "json" /*设置返回值类型为文本*/
                });
            } else {
                alert('请先选择项目产品')
            }


        });


        function lvupui() {
            var lvup_data = {"name": user.username, "salt": user.salt};


            $.ajax({
//                url: 'https://he.bobdz.com/sdea/auth/prodlist',
                url: '/sdea/auth/prodlist',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(lvup_data),
                contentType: "application/json; charset=utf-8"
            })
                .done(function (e) {
                    prod = e.prod;
                    var _devupui = '';
                    _devupui += '<li style=" margin-top: 6px;"><span>项目产品：</span></li>';
                    for (var i = 0; i < prod.length; i++) {
                        _devupui += '<li><a class="label label-info" style="border-radius: 0 !important" href="" tag=' + i + ' >' + prod[i].name + '</a></li>';
                        // if (i == 0) {
                        // 	_devupui += '<li class="active"><a class="label label-info" style="border-radius: 0 !important" href="" tag=' + i +'>' + prod[i].name + '</a></li>';
                        // } else {
                        // 	_devupui += '<li><a class="label label-info" style="border-radius: 0 !important" href="" tag=' + i +' >' + prod[i].name + '</a></li>';
                        // }
                    }
                    $("#mytabs").html(_devupui);
                    // alert(JSON.stringify($("a.label-info")[0]))
                    $('#mytabs a:first').tab('show')
                    // alert('show')
                })
                .fail(function () {
                })
                .always(function () {
                });
        }

        $("#tables").delegate('.closelink', 'click', function (event) {
            // alert(uppacks[$(this).attr("tag")].uuid + ',' + $(this).attr("stat"));
            var data = {
                uuid: uppacks[$(this).attr("tag")].uuid,
                stat: $(this).attr("stat")
            }
            $.ajax({
                url: '/sdea/uploadfile/updevuplst',
//                url: 'https://he.bobdz.com/sdea/uploadfile/updevuplst',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8"
            })
                .done(function (e) {
                    create_table_body();
                })
                .fail(function () {
                })
                .always(function () {
                });

        });

        $("#tables").delegate('#next', 'click', function (event) {
            page.num++;
            create_table_body();
        });
        $("#tables").delegate('#previous', 'click', function (event) {
            if (page.num > 1) {
                page.num--;
                create_table_body();
            }
        });

        $("#tables").delegate('.mypage', 'click', function (event) {
            page.num = $(this).attr("tag");
            create_table_body();
        });

        $("#mytabs").on('click', 'a', function (event) {
            event.preventDefault();
            $(this).tab("show");


        });

        $("#mytabs").on('shown.bs.tab', 'a', function (event) {

            page.num = 1;
            $.get('<%=basePath%>write/devuptable', function (e) {
                $('#tables').html(e);
            });
            prod_id = prod[$(this).attr('tag')].id;
            create_table_body();
        });

        $("#refresh").click(function (event) {
            create_table_body();
        });


        lvupui();


    });
</script>
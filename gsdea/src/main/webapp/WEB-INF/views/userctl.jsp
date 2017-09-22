<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用户管理</title>
</head>
<body>
<div id="prolist" style="padding-top: 52px;">
    <div class=" page-header" style=" margin: 0; ">
        <ul class="nav nav-pills" role="tablist" id="mytabs" style="font-size: 17px;">

        </ul>
    </div>
</div>
<div id="menu" style="padding-top:  8px;">
    <button type="button" class="btn btn-success" style="border-radius: 0 !important;padding: 6px 30px;"
            data-toggle="modal" data-target="#create_user">创建
    </button>
    <button id="refresh" type="button" class="btn btn-success" style="border-radius: 0 !important;padding: 6px 30px;">
        停用
    </button>
    <button type="button" class="btn btn-success" style="border-radius: 0 !important;padding: 6px 30px;">刷新</button>
    <div class="btn-group">
        <button id="export" type="button" class="btn btn-success dropdown-toggle"
                style="border-radius: 0 !important;padding: 6px 30px;" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false">导出 <span class="caret"></span></button>
        <ul class="dropdown-menu">
            <li><a href="#" id="exportPage">导出当前页</a></li>
            <li><a href="#" id="exportChecked">导出选中项</a></li>

        </ul>
    </div>

</div>

<div class="modal fade bs-example-modal-lg " id="create_user" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     style="border-radius: 0 !important;border: 0">
    <div class="modal-dialog" role="document" style="border-radius: 0 !important;border: 0">
        <div class="modal-content" style="border-radius: 0 !important;border: 0">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">创建用户</h4>
            </div>
            <div class="modal-body">
                <form action="https://he.bobdz.com/sdea/uploadfile/" method="post">
                    <div class="form-group">
                        <label for=""></label>
                        <input type="text" class="form-control" id="user" name="user" placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <label for=""></label>
                        <input type="number" class="form-control" id="phone" name="phone" placeholder="手机号">
                    </div>
                    <div class="form-group">
                        <label for=""></label>
                        <input type="text" class="form-control" name="email" id="email" placeholder="邮箱">
                    </div>
                    <div class="form-group">
                        <label for=""></label>
                        <textarea name="info" id="info" cols="30" rows="10" style="width: 100%"
                                  placeholder="信息"></textarea>
                    </div>
                    <div class="form-group">
                        <label for=""></label>
                        <input type="number" class="form-control" id="num" name="num" placeholder="添加数量">
                    </div>
                    <div class="form-group">
                        <label for=""></label>
                        <input type="checkbox" name="stat" id="stat">激活
                    </div>

                    <input type="hidden" name="prod" id="prod">
                </form>
            </div>
            <div class="modal-footer">
                <button id="okBtn" type="button" class="btn btn-primary"
                        style="border-radius: 0 !important;border: 0;width: 100px;">确定
                </button>
            </div>
        </div>
    </div>
</div>

<div id="tables"></div>
</body>
</html>
<script>
    $(document).ready(function () {
        var user = JSON.parse(window.name);
        var prod;
        var userlist;

        var prod_id;
        prolist();

        function prolist() {
            var lvup_data = {"name": user.username, "salt": user.salt};


            $.ajax({
                url: '/sdea/auth/prodlist',
//                url: 'https://he.bobdz.com/sdea/auth/prodlist',
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
                    }
                    $("#mytabs").html(_devupui);
                    $('#mytabs a:first').tab('show')
                })
                .fail(function () {
                })
                .always(function () {
                });
        }

        // $('#mytabs a:first').tab('show')
        $("#mytabs").on('click', 'a', function (event) {
            event.preventDefault();
            $(this).tab("show");


        });

        $("#mytabs").on('shown.bs.tab', 'a', function (event) {
            // alert('666')
            page.num = 1;
            $.get('<%=basePath%>write/userctl', function (e) {
                $('#tables').html(e);
            });
            prod_id = prod[$(this).attr('tag')].id;
            create_table_body();
        });

        function create_table_body() {
            $("#export").removeClass('disabled');
            var devlistdata = {
                "name": user.username,
                "skip": (page.size * (page.num - 1)),
                "limt": page.size,
                "prod": prod_id
            }
            $.ajax({
                url: '/sdea/userman/listuser',
//                url: 'https://he.bobdz.com/sdea/userman/listuser',
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(devlistdata),
                contentType: "application/json; charset=utf-8"
            })
                .done(function (e) {
                    userlist = e;
                    var _tbody = '';
                    if (e.length == 0) {
                        $("#export").addClass('disabled');
                        $("#tablebody").html('<tr><td colspan="9" style="text-align:center;">对不起，无任何信息！</td></tr>');
                        create_table_foot();
                        return;
                    }
                    for (var i = 0; i < e.length; i++) {
                        statStr = '';
                        switch (e[i].stat) {
                            case 1:
                                statStr = '禁用'
                                break;
                            case 2:
                                statStr = '激活'
                                break;
                            case 3:
                                statStr = '正在使用'
                                break;
                        }
                        _tbody +=
                            '<tr>' +
                            '<td>' + '<input class="checkbox" type="checkbox" tag="' + i + '">' + '</td>' +
                            '<td>' + e[i].regc + '</td>' +
                            '<td>' + e[i].uuid + '</td>' +
                            '<td>' + e[i].phone + '</td>' +
                            '<td>' + e[i].user + '</td>' +
                            '<td>' + statStr + '</td>' +
                            '<td>' + e[i].time + '</td>' +
                            '<td>' + (e[i].stat == 1 ? '<button type="button" class="btn btn-info closelink" style="border-radius: 0 !important;border: 0;padding: 3px 16px;" tag="' + i + '" stat="1">激活</button>' : '<button type="button" class="btn btn-danger closelink" style="border-radius: 0 !important;border: 0;padding: 3px 16px;" tag="' + i + '" stat="2">禁用</button>') + '</td></tr>'
                        // '<td>' + e[i].stat + '</td>' +
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

        $("#okBtn").click(function (event) {

            if (prod_id) {
                if ($("#stat").is(':checked')) {

                } else {
                    $("#stat").val('1')
                }
                var user_data = {
                    user: $("#user").val(),
                    phone: $("#phone").val(),
                    info: $("#info").val(),
                    email: $("#email").val(),
                    stat: ($("#stat").is(':checked') ? "2" : "1"),
                    prod: prod_id
                }
                var num = $("#num").val();
                var isErr = 0;
                var i = 0;
                for (i = 0; i < num && isErr == 0; i++) {
                    $.ajax({
                        url: '/sdea/userman/addnew',
//                        url: 'https://he.bobdz.com/sdea/userman/addnew',
                        type: 'POST',
                        dataType: 'json',
                        data: JSON.stringify(user_data),
                        contentType: "application/json; charset=utf-8",
                        async: false,
                    })
                        .done(function () {


                        })
                        .fail(function () {
                            isErr = 1;
                            alert('创建失败')
                            // return;

                        })
                        .always(function () {
                        });
                    // if()
                }

                $("#create_user").modal("hide");
                create_table_body();

            } else {
                alert('请先选择项目产品')
            }


        });


        $('#create_user').on('hidden.bs.modal', function (e) {
            $("#user").val("");
            $("#phone").val("");
            $("#info").val("");
            $("#email").val("");
        })


        $("#exportChecked").click(function (event) {
            // $("#tables")
            var h = $("input[type='checkbox']:checked");
            var l = [];
            for (var i = 0; i < h.length; i++) {
                // alert(h[i].getAttribute('tag'))
                l[i] = userlist[h[i].getAttribute('tag')];
            }
            var data = {
                userList: JSON.stringify(l)
            }
            if (l.length == 0) {
                alert('请选择至少一个用户')
            } else {
                exportTable(data);
            }

        });

        $("#exportPage").click(function (event) {
            var data = {
                userList: JSON.stringify(userlist)
            }
            exportTable(data);
        });

        function exportTable(data) {
            // alert(JSON.stringify(l))
            $.ajax({
                url: '<%=basePath%>userctl/export',
                type: 'POST',
                dataType: 'json',
                data: data,
                // contentType: "application/json; charset=utf-8",
                async: false,
            })
                .done(function (e) {
                    if (e.stat) {
                        window.location.href = '<%=basePath%>load/' + e.fileName;
                    } else {
                        alert('导出失败');
                    }
                })
                .fail(function () {
                })
                .always(function () {
                });
        }


    });
</script>
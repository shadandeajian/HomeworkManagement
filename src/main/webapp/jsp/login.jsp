<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    application.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>学生作业管理系统-登录</title>
    <link rel="shortcut icon" href="${basePath }img/favicon.ico"/>
    <link href="${basePath }weblib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath }css/font-awesome.css" rel="stylesheet">
    <link href="${basePath }css/base.css" rel="stylesheet">
    <link href="${basePath }css/login.css" rel="stylesheet">
</head>
<body class="background">
<section>
    <div class="container blur">
        <h2 class="text-center sign_in_heading">log in to Student-Home-Management-System</h2>
        <p id="error_info_id">${returninfo }</p>
        <form class="form-horizontal" method="post" action="${basePath }login">
            <div class="form-group" id="Id_div">
                <label for="inputID" class="col-md-4 control-label fa fa-id-card-o fa-2x" style="color: white"></label>
                <div class="col-md-4"><input type="text" name="username" class="form-control" id="inputID" placeholder="账号" required autofocus></div>
            </div>
            <div class="form-group" id="Password_div">
                <label for="inputPassword" class="col-md-4 control-label fa fa-unlock-alt fa-2x" style="color: white"></label>
                <div class="col-md-4"><input type="password" name ="password"class="form-control" id="inputPassword" placeholder="密码" required></div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-4 col-md-4"> <button type="button" class="btn btn-success btn-block" id="submit_id">登录</button> </div>
            </div>
        </form>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
        <div class="row"><div class="col-md-1">.</div></div>
    </div>
</section>
<%@include file="footer.jsp" %>
<script src="${basePath }weblib/jquery/jquery-3.2.1.min.js"></script>
<script src="${basePath }weblib/bootstrap/js/bootstrap.min.js"></script>
<script src="${basePath }js/base.js"></script>
<script>
    $(function () {
        var height = $(window).height(); //浏览器当前窗口可视区域高度
        var section_height = $("section").outerHeight(true);
        $("section").css("margin-top", (height / 2) - (section_height / 2));
        $(window).resize(function () {
            var height = $(window).height(); //浏览器当前窗口可视区域高度
            var section_height = $("section").outerHeight(true);
            $("section").css("margin-top", (height / 2) - (section_height / 2));
        });
        var idlength = 0;
        var passwdlength = 0;
        var inputID;
        $("#inputID").blur(function () {
            inputID = $(this).val();
            idlength = inputID.length;
            if (idlength !== 0) {
                if (!isNaN(inputID) || inputID =="root") {
                    if (idlength !== 10 && inputID !== "root") { //艺术学院学号是10位
                        $("#error_info_id").text("学号长度为10位数字，请输入正确的学号！");
                        $("#Id_div").addClass("has-error has-feedback");
                    }
                    else {
                        $("#error_info_id").text("");
                        $("#Id_div").removeClass("has-error has-feedback");
                    }
                } else {
                    $("#error_info_id").text("请输入正确的学号！");
                    $("#Id_div").addClass("has-error has-feedback");
                }
            }
        });
        $("#inputPassword").blur(function () {
            var inputPassword = $(this).val();
            passwdlength = inputPassword.length;
            if (passwdlength !== 0) {
                if (passwdlength === 0 || passwdlength < 8) {
                    $("#error_info_id").text("密码不能为空/密码长度至少8位");
                    $("#Password_div").addClass("has-error has-feedback");
                } else {
                    $("#error_info_id").text("");
                    $("#Password_div").removeClass("has-error has-feedback");
                }
            }
        });
        $("#submit_id").click(function () {
            if (idlength === 10 || inputID == "root" && passwdlength !== 0 && passwdlength >= 8) {
                document.forms[0].submit();
            }
            else {
                $("#error_info_id").text("请输入学号和密码！");
                $("#Id_div").addClass("has-error has-feedback");
                $("#Password_div").addClass("has-error has-feedback");
            }
        });
    });
</script>
</body>
</html>
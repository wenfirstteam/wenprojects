<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../../css/user.css" rel="stylesheet" type="text/css">
<link href="../../css/index.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image/x-icon" href="//common-bucket.zhaopin.cn/passport/favicon.ico"  media="screen"/>
<title>汉中人才网-添加管理员</title>
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif, simsun;
	background-image: url(../../pic/.jpg);
}
</style>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../../js/find.js"></script>
<script type="text/javascript">
function register(){
	var $name = $("#username").val();
	var $pwd = $("#password").val();
	var $email = $("#email").val();
	if ($name == "") {
		alert("用户名不能为空！");
		return false;
	} 
	if ($pwd == "") {
		alert("密码不能为空！");
		return false;
	}
	if ($email == "") {
		alert("邮箱不能为空！");
		return false;
	}
	$.ajax({
		async:false,
		url : "/rcw/user/register.action",
		type : "POST",
		data:{"userName":$name,"passWord":$pwd,"flag":2,"email":$email},
		success : function(msg) {
			if (msg.status == 200)
			{
				alert("添加成功！");
					setTimeout(function(){
						findWaitInfo();
						window.location.href = "manager.jsp";
					},1);
			}else{
				alert(msg.message);
				return false;
			}
		},
		error : function(data) {
			alert("系统异常!");
			return false;
		}
	}) ;
}
function logOut(){
	$.ajax({
		async : false,
		url: "/rcw/user/logOut.action",
		data:{},
		type:"GET",
		success:function(msg){
			setTimeout(function(){
				window.location.href = "../login.jsp";
			},1);
		},
		error:function(msg){
			alert("系统异常！");
		}
	});
}
</script>
</head>
<body>
<div id="header">
    <div class="inner home-inner">
    <div class="logo">
				<font size="6" face="微软雅黑" color="#00d7c6"><B>汉中人才网</B></font>
			</div>
        <div class="nav">
				<ul>
					<li class=""><a class="header-home"
						href="manager.jsp" onclick="findWaitInfo();">&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职位审核</a></li>
					<li class=""><a class="header-job"
						href="news.jsp" onclick="findNews();">新闻管理</a></li>
					<li class="cur"><a class="header_brand"
						href="add_manage.jsp">添加管理员</a></li>
				</ul>
			</div>
        <div class="user-nav">
                <!--未登录-->
                <div class="btns" vertical-align="middle" >
                    <input style="display: none;" id="userId" value="${user.id}">
                    <a href="" ka="header-register" id="login" class="btn btn-outline">${user.userName }<div id="isLogin"></div></a>
                    <a href="" ka="header-login" onclick="return logOut();" id="login1" class="btn btn-outline">退出<div id="isLogin1"></div></a>
                </div>
        </div>
    </div>
</div>   
		<div class="big-bg">
		<div class="login-box clearfix">
			<div class="login-tit">
				<span class="login-account-c">管理员</span>
			</div>
			<div class="user-login" align=>
			<form antion="##" id="form1" class="inner_form" method="post">
					<div class="form border">
						<label for="loginName">用户名</label><input class=""
							id="username" name="username" type="text" />
					</div>
					<div id="alertMessage_loginName"
						style="color: red; margin-left: 16px;"></div>
					<div class="form border">
						<label for="password">密 码</label><input class="" id="password"
							name="password" type="password"/>
					</div>
					<div class="form border">
						<label for="password">邮箱</label><input class="" id="email"
							name="email" type="text"/>
					</div>
					<div>
						<input id="submit" name="submit" type="submit"
							class="login-btn __ga__switchTag_loginBtn_001 " onclick="return register();"
							value="确定" > 
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
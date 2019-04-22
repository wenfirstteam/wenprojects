<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" type="image/x-icon" href="//common-bucket.zhaopin.cn/passport/favicon.ico"  media="screen"/>
<link href="../css/user.css" rel="stylesheet" type="text/css">
<title>汉中人才网账号注册</title>
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif, simsun;
	background-image: url(../pic/bg.jpg);
}
</style>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function register(){
	var $name = $("#username").val();
	var $pwd = $("#password").val();
	var $type = $('input:radio:checked').val();
	var $email = $("#email").val();
	if ($name == "") {
		alert("用户名不能为空！");
		return;
	}
	if ($pwd == "") {
		alert("密码不能为空！");
		return;
	}
	if ($email == "") {
		alert("邮箱不能为空！");
		return;
	}
	$.ajax({
		async:false,
		url : "/rcw/user/register.action",
		type : "POST",
		data:{"userName":$name,"passWord":$pwd,"flag":$type,"email":$email},
		success : function(msg) {
			if (msg.status == 200)
			{
				alert("注册成功！");
				window.location.href = "login.jsp";
			}else
				alert(msg.message);
		},
		error : function(data) {
			alert(data+"");
		}
	}) ;
}
</script>
</head>
<body>
	<div class="big-bg">
	<img class="advertisement-hotspot" src="../pic/logo.png" style="left:2.549999999999999%;width:18.490000000000002%;top:4.02%;height:15.83%;"/>
		<div class="login-box clearfix">
			<div class="login-tit">
				<span class="login-account-c">用户注册</span>
			</div>
			<div class="user-login">
			<form antion="##" id="form1" class="inner_form" method="post">
					<div class="form border">
						<label for="loginName">用户名</label><input class="ipt"
							id="username" name="username" type="text" />
					</div>
					<div id="alertMessage_loginName"
						style="color: red; margin-left: 16px;"></div>
					<div class="form border">
						<label for="password">密 码</label><input class="ipt" id="password"
							name="password" type="password"/>
					</div>
					<div class="form border">
					<br>
						<label>类型</label>&nbsp;&nbsp;&nbsp;	
						<input type="radio" name="type" id="find" checked="checked" value="0"><font size=3 color="#9fadc6">求职者</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="type" id="company" value="1"><font size=3 color="#9fadc6">企业</font>
					</div>
					<div class="form border">
						<label for="password">邮箱</label><input class="ipt" id="email"
							name="email" type="text"/>
					</div>
					<div>
						<input id="submit" name="submit" type="submit"
							class="login-btn __ga__switchTag_loginBtn_001 " onclick="register()"
							value="确定" > 
					</div>
					<div class="login-forget">
					<p>
							<font color="#9fadc6">已有账号？</font><a
								class="__ga__switchTag_regist_001"
								onclick="ZP.analysis.init_monitor_analy(this,'switchTag','regist','001');ZP.analysis.init_monitor_analy(this,'switchTag','regist','001');"></a>
							<a class="registerLink"
								href="login.jsp">立即登录</a>
						</p>
						<div class="otherLogin" style="width: 336px; border-top: 1px dotted #ccc; margin-top: 24px; padding-top: 6px;">
					</div></div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
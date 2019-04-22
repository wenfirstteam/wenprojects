<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/user.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
<title>汉中人才网登录入口</title>
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
	function login() {
		var $name = $("#username").val();
		var $pwd = $("#password").val();
		if ($name == "") {
			alert("用户名不能为空！");
			return;
		} 
		if ($pwd == "") {
			alert("密码不能为空！");
			return;
		}
		$.ajax({
			async : false,
			url : "/rcw/user/login.action",
			type : "POST",
			data : {
				"userName" : $name,
				"passWord" : $pwd
			},
			success : function(msg) {
				if (msg.status == 200) {
					alert("登录成功！");
					window.location.href = "index.jsp";
				} else
					alert(msg.message);
			},
			error : function(data) {
				alert("系统异常！");
			}
		});
	}
</script>
</head>
<body>
	<div class="big-bg">
		<img class="advertisement-hotspot" src="../pic/logo.png"
			style="left: 2.549999999999999%; width: 18.490000000000002%; top: 4.02%; height: 15.83%;" />
		<div class="login-box clearfix">
			<div class="login-tit">
				<span class="login-account-c">用户登录</span>
			</div>
			<div class="user-login">
				<form antion="##" id="form1" class="inner_form" method="post">
					<div class="form border">
						<label for="loginName">用户名</label><input class="ipt" id="username"
							name="username" type="text" />
					</div>
					<div id="alertMessage_loginName"
						style="color: red; margin-left: 16px;"></div>
					<div class="form border">
						<label for="password">密 码</label><input class="ipt" id="password"
							name="password" type="password" />
					</div>
					<div>
						<input id="submit" name="submit" type="submit"
							class="login-btn __ga__switchTag_loginBtn_001 " value="登录"
							onclick="login()">
					</div>
					<div class="login-forget">
						<p>
							<font color="#9fadc6">没有账号？</font><a
								class="__ga__switchTag_regist_001"
								onclick="ZP.analysis.init_monitor_analy(this,'switchTag','regist','001');ZP.analysis.init_monitor_analy(this,'switchTag','regist','001');"></a>
							<a class="registerLink" href="register.jsp">立即注册</a> <a
								href="reset_pwd.jsp" class="fr">忘记密码</a>
						</p>
						<div class="otherLogin"
							style="width: 336px; border-top: 1px dotted #ccc; margin-top: 24px; padding-top: 6px;">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
<title>忘记密码 - 汉中人才网</title>
<style>
body, div, dl, dt, dd, ul, ol, h1, h2, h3, h4, h5, h6, pre, code, form,
	fieldset, legend, input, textarea, p, blockquote, table, th, td {
	font-family: PingFang SC, Lantinghei SC, Helvetica Neue, Helvetica,
		Arial, Microsoft YaHei, \\5FAE\8F6F\96C5\9ED1, STHeitiSC-Light, simsun,
		\\5B8B\4F53, WenQuanYi Zen Hei, WenQuanYi Micro Hei, "sans-serif";
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 12px;
}

fieldset, img, abbr, acronym {
	border: none
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
	font-weight: 400;
}

em, i {
	font-style: normal
}

a {
	text-decoration: none;
	color: #29a9db;
}

a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a, input:focus {
	outline: none
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.wrap {
	position: relative;
}

.header-wrapper {
	border-bottom: 1px solid #E8EAEC;
}

.header {
	height: 100px;
	width: 1000px;
	margin: 0 auto;
	position: relative;
}

.header .logo {
	height: 100px;
	line-height: 100px;
}

.header .logo a {
	display: block;
	width: 128px;
}

.header .logo a img {
	vertical-align: middle;
}

.header .service-tel {
	position: absolute;
	right: 0;
	top: 42%;
	font-size: 12px;
	color: #666;
}

.content {
	padding-bottom: 50px;
}

.content .title {
	text-align: center;
	color: #000000;
	font-size: 20px;
	line-height: 90px;
	font-weight: normal;
	letter-spacing: 2px;
}

.form-wrapper {
	width: 370px;
	margin: 0 auto;
	color: #000;
}

.form-wrapper .ipt-wrapper {
	margin-bottom: 20px;
	display: flex;
	/*font-size:14px;line-height:24px;color:#4a4a4a;*/
	position: relative;
}

.form-wrapper .ipt {
	flex: 1;
}

.ipt-wrapper .btn-getCode {
	display: inline-block;
	width: 110px;
	line-height: 40px;
	border-left: 1px solid #DCDEE2;
	font-size: 14px;
	color: #1787FB;
	letter-spacing: 0;
	text-align: center;
}

.btn-getCode:hover {
	cursor: pointer;
}

.form-wrapper label {
	height: 40px;
	line-height: 40px;
	width: 70px;
	text-align: justify;
	display: inline-block;
	overflow: hidden;
	vertical-align: top;
}

.form-wrapper .ipt {
	border: 1px solid #ddd;
	padding: 10px;
	height: 20px;
	border-radius: 2px;
}

.form-wrapper .code-ipt {
	border: 1px solid #ddd;
	height: 40px;
	display: flex;
	width: 300px;
	flex: 1;
}

.code-ipt input {
	border: none;
	flex: 1;
	padding-left: 10px;
}

.form-wrapper .confirm-btn {
	width: 300px;
	height: 48px;
	line-height: 48px;
	margin-top: 10px;
	background: #1787FB;
	border-radius: 4px;
	color: #fff;
	font-size: 16px;
	text-align: center;
	cursor: pointer;
	display: inline-block;
	margin-left: 70px;
}

.form-wrapper .confirm-btn:hover {
	cursor: pointer;
}

.form .ipt {
	width: 300px;
	height: 40px;
	display: inline-block;
	font-size: 12px;
}

.ipt:focus {
	border-color: #1787FB;
}

.form-wrapper .line {
	margin-top: 15px;
	text-align: right;
}

.message {
	font-size: 12px;
	color: #E95A3F;
	letter-spacing: 0;
	line-height: 12px;
	margin-left: 70px;
}

.ipt-icon {
	position: absolute;
	right: 12px;
	top: 12px;
}

.ipt-warning {
	position: absolute;
	left: 70px;
	bottom: -18px;
	color: #E95A3F;
}

@media screen and (max-width: 1000px) {
	.wrap {
		width: 100%;
	}
	.header {
		width: 100%;
	}
}

@media screen and (max-width: 480px) {
	.header .logo a {
		display: block;
		width: 100%;
		text-align: center;
	}
	.header .service-tel {
		position: fixed;
		right: 0;
		bottom: 26px;
		font-size: 12px;
		color: #666;
		text-align: center;
		width: 100%;
		top: unset;
	}
	.content .title {
		font-size: 18px;
		height: 50px;
		line-height: 50px;
	}
	.form-wrapper .confirm-btn {
		width: calc(100% - 70px);
	}
}

@media screen and (max-width: 370px) {
	.form-wrapper {
		width: 100%;
		padding: 5px;
	}
	.ipt-wrapper .btn-getCode {
		width: unset;
	}
}
</style>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="header-wrapper">
			<div class="header">
				<div class="logo">
					<img src="../pic/logo.png"
						style="width: 25.490000000000002%; top: 54.02%; height: 86.83%;" />
				</div>

			</div>
		</div>
		<div class="content verifiTel">
			<div class="title">找回密码</div>
			<div class="form-wrapper form">
				<form action="/rcw/user/resetPwd.action" method="post"
					id="verificationOldTel" class="inner_form" data-ts="5xGY"
					novalidate="novalidate">
					<input type="hidden" id="bkurl" name="bkurl"
						value="https://i.zhaopin.com/blank?https://www.zhaopin.com/">
					<input type="hidden" id=k name="redirect_uri" value="">

					<div class="ipt-wrapper">
						<label for="passportName">用 户 名</label> <input class="ipt"
							id="name" name="username" type="text" placeholder="用户名">
						<div class="ipt-warning" id="alertMessage_passportName"></div>
					</div>
					<div class="ipt-wrapper">
						<label for="passportName">邮箱</label> <input class="ipt" id="email"
							name="email" type="text" placeholder="邮箱">
						<div class="ipt-warning" id="alertMessage_passportName"></div>
					</div>

					<div class="ipt-wrapper code-wrapper">
						<label for="verifiCode">验 证 码</label>
						<div class="code-ipt">
							<input class="" id="verifiCode" name="verifiCode" type="text"
								value="" placeholder="验证码" /> <a href="javascript:;"
								class="btn btn-getCode" id="sendVerifiCode" onclick="verify()">获取验证码</a>
						</div>
						<div class="ipt-warning" id="alertMessage_verifiCode"></div>
					</div>

					<div class="ipt-wrapper">
						<label for="password">重置密码</label> <input id="password"
							name="password" type="password" class="ipt" placeholder="新密码" />
						<div class="ipt-warning" id="alertMessage_password"></div>
					</div>

					<div class="ipt-wrapper">
						<label for="passwordConfirm">确认密码</label> <input
							id="passwordConfirm" type="password" class="ipt"
							placeholder="确认密码" />
						<div class="ipt-warning" id="alertMessage_passwordConfirm"></div>
					</div>

					<div id="alertMessage" class="message"></div>

					<div>
						<input id="submitbtn" type="submit" class="confirm-btn" value="确认">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>	
	function verify(){
		alert("xdsxsx");
		var $name = $("#name");
		var $email = $("#email");
		$.ajax({
			async:false,
			url:"/rcw/user/verify.action",
			type:"POST",
			data:{"userName":$name,"email":$email},
			success:function(msg){
				alert(msg.data);
			},
			error : function(data) {
				alert("系统异常！");
			}
		});
	}
</script>
</html>
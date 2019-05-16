<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>汉中人才网-企业信息完善</title>
<link href="../../css/resume.css" rel="stylesheet" type="text/css" />
<link href="../../css/index.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
<style type="text/css">
.button1 { /* 按钮美化 */
	width: 90px; /* 宽度 */
	height: 30px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: white; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: #1E90FF; /* 字体颜色 */
	font-size: 15px; /* 字体大小 */
}

.button2 { /* 按钮美化 */
	width: 70px; /* 宽度 */
	height: 30px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: #1E90FF; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: white; /* 字体颜色 */
	font-size: 15px; /* 字体大小 */
}
</style>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	var icon = "";
	function fileBtn() {
		document.getElementById('pic').click();
	}

	function upload(file) {
		let img = document.getElementById('img');
		let formData = new FormData();
		let temp = file.files[0];
		if (temp) {
			formData.append('file', temp);
			img.src = window.URL.createObjectURL(temp);
			$.ajax({
				url : "/rcw/upload/upload.action",
				type : "POST",
				data : formData,
				processData : false, // 告诉jQuery不要去处理发送的数据
				contentType : false, // 告诉jQuery不要去设置Content-Type请求头
				success : function(result) {
					icon = result.data;
				}
			});
		}
	}
	function save() {
		var $id = $("#userId").val();
		var $company_name = $("#company_name").val();
		var $name = $("#name").val();
		var $tel = $("#tel").val();
		var $position = $("#position").val();
		var $people = $("#people").val();
		var $email = $("#email").val();
		var $address = $("#address").val();

		if (icon == "") {
			alert("公司头像不能为空！");
			return false;
		}
		if ($company_name == "") {
			alert("公司名称不能为空！");
			return false;
		}
		if ($name == "") {
			alert("代表人姓名不能为空！");
			return false;
		}
		if ($tel == "") {
			alert("电话不能为空！");
			return false;
		}
		if ($tel.length > 11) {
			alert("电话最多11位！");
			return false;
		}
		if ($position == "") {
			alert("代表人职位不能为空！");
			return false;
		}
		if ($email == "") {
			alert("公司邮箱不能为空！");
			return false;
		}
		if ($address == "") {
			alert("公司地址不能为空！");
			return false;
		}
		$.ajax({
			async : false,
			url : "/rcw/introduction/addIntroduction.action",
			type : "POST",
			data : {
				"UserId" : $id,
				"CompanyName" : $company_name,
				"name" : $name,
				"position" : $position,
				"email" : $email,
				"telphone" : $tel,
				"address" : $address,
				"people" : $people,
				"icon" : icon
			},
			success : function(msg) {
				if (msg.status == 200) {
					alert("完善成功，请登录！");
					setTimeout(function() {
						window.location.href = "../login.jsp";
					}, 1);
					return true;
				} else {
					alert(msg.message);
					return false;
				}
			},
			error : function(data) {
				alert("系统异常!");
				return false;
			}
		});
	}
</script>
</head>
<body class="page-single">
	<%
		String username = request.getParameter("username");
		Integer id = Integer.parseInt(request.getParameter("id"));
	%>
	<div id="header">
		<div class="inner home-inner">
			<div class="logo">
				<font size="6" face="微软雅黑" color="#00d7c6"><B>汉中人才网</B></font>
			</div>
			<div class="nav-city">
				<div class="city-box">
					<div class="dorpdown-city"></div>
				</div>
			</div>
			<div class="user-nav">
				<!--未登录-->
				<div class="btns" vertical-align="middle">
					<div>
						<font color="white" size="3"><%=username%></font>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="container">
			<div class="profile-progress">
				<h2>
					请完善公司基本信息：<span class="step-num"></span>
				</h2>
			</div>

			<div class="profile-manage">
				<input style="display: none;" id="userId" value="<%=id%>">
					<div class="form-row">
					<div class="c">
						<img src="../../pic/pic.jpg" id="img" style="width: 100px;height:100px;">
						</div>
					</div>
					<div class="form-row">
						<div class="t">
							<em>*</em>公司头像：
						</div>
						<div class="c">
							<span class="ipt-wrap"><input id="pic" type="file"
								name="pic" class="ipt required" onchange="upload(this)"></span>
							<button class="button2" onclick="fileBtn();" style="display: none">上传</button>
						</div>
					</div>

					<div class="form-row">
						<div class="t">
							<em>*</em>公司名称：
						</div>
						<div class="c">
							<span class="ipt-wrap"><input id="company_name"
								type="text" name="company_name" placeholder="填写公司名称"
								class="ipt required"></span>
						</div>
					</div>
					<div class="form-row">
						<div class="t">
							<em>*</em>代表人姓名：
						</div>
						<div class="c">
							<span class="ipt-wrap"><input id="name" type="text"
								name="name" placeholder="填写代表人姓名" class="ipt required"></span>
						</div>
					</div>
					<div class="form-row">
						<div class="t">
							<em>*</em>代表人电话：
						</div>
						<div class="c">
							<span class="ipt-wrap"><input type="text" name="tel"
								oninput="value=value.replace(/[^\d]/g,'')" id="tel"
								class="ipt required" placeholder="填写代表人电话（此处只能输入数字）"></span>
						</div>
					</div>
					<div class="form-row">
						<div class="t">
							<em>*</em>代表人职位：
						</div>
						<div class="c">
							<span class="ipt-wrap"><input type="text" name="position"
								id="position" class="ipt required" placeholder="填写代表人职位"></span>
						</div>
					</div>
					<div class="form-row">
						<div class="t">
							<em>*</em>公司规模：
						</div>
						<div class="c">
							<span class="ipt-wrap"> <select class="ipt required"
								name="people" id="people">
									<option value="1~50">1~50</option>
									<option value="50~100">50~100</option>
									<option value="100~400">100~400</option>
									<option value="400~1000">400~1000</option>
									<option value="1000~10000">1000~10000</option>
									<option value="10000以上">10000以上</option>
							</select></span>
						</div>
					</div>
					<div class="form-row">
						<div class="t">
							<em>*</em>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：
						</div>
						<div class="c">
							<span class="ipt-wrap"><input type="text" name="email"
								id="email" class="ipt required" placeholder="填写公司邮箱"></span>
						</div>
					</div>
					<div class="form-row">
						<div class="t">
							<em>*</em>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：
						</div>
						<div class="c">
							<span class="ipt-wrap"><input type="text" name="address"
								id="address" class="ipt required" placeholder="填写公司具体地址"></span>
						</div>
					</div>

					<div class="btns" align="right">
						<button id="add" class="button2" onclick="return save();">提交</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="side-tip">
						<img src="../../pic/edit.png" />
						<p>完善资料，让人更加了解企业</p>

					</div>
			</div>
			<div class="form-row form-footer"></div>

		</div>
		<!--更换公司-->
	</div>
	</div>
	<input type="hidden" id="page_key_name" value="bpc_complete_base_noapp" />
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>汉中人才网-求职信息完善</title>
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
	function addProject() {
		var add = document.getElementById("add");
		var project = document.getElementById("project");
		if (project.style.display == "none") {
			project.style.display = "block";
			document.getElementById("add").innerHTML = "取消";
		} else {
			project.style.display = "none";
			document.getElementById("add").innerHTML = "+项目经历";
		}
	}
	function addJob() {
		var add = document.getElementById("add1");
		var job = document.getElementById("job");
		if (job.style.display == "none") {
			job.style.display = "block";
			document.getElementById("add1").innerHTML = "取消";
		} else {
			job.style.display = "none";
			document.getElementById("add1").innerHTML = "+工作经历";
		}
	}
	function save() {
		var $userId = $("#userId").val();
		var $name = $("#name").val();
		var $sex = $('input:radio:checked').val(); //0： 男 1：女
		var $age = $("#age").val();
		var $tel = $("#tel").val();
		var $degree = $("#degree").val();
		var $school = $("#school").val();
		var $professional = $("#professional").val();
		var $position = $("#position").val();
		var $job_age = $("#job_age").val();
		var $salary = $("#salary").val();
		var $advantage = $("#advantage").val();
		var $work_experience1 = $("#work_experience1").val();
		var $work_experience2 = $("#work_experience").val();
		var $project_experience1 = $("#project_experience1").val();
		var $project_experience2 = $("#project_experience2").val();
		var $evaluate = $("#evaluate").val();
		alert($userId);
		if ($name == "") {
			alert("姓名不能为空！");
			return false;
		}
		if ($age == "") {
			alert("年龄不能为空！");
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
		if ($school == "") {
			alert("学校不能为空");
			return false;
		}
		if ($position == "") {
			alert("期望职位不能为空！");
			return false;
		}
		$.ajax({
			async : false,
			url : "/rcw/resume/addResume.action",
			type : "POST",
			data : {
				"userId" : $userId,
				"name" : $name,
				"sex" : $sex,
				"age" : $age,
				"telphone" : $tel,
				"degree" : $degree,
				"jobAge" : $job_age,
				"advantage" : $advantage,
				"position" : $position,
				"salary" : $salary,
				"school" : $school,
				"professional" : $professional,
				"project_experience1" : $project_experience1,
				"project_experience2" : $project_experience2,
				"work_experience1" : $work_experience1,
				"work_experience2" : $work_experience2,
				"evaluate" : $evaluate
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
					请完善基本信息：<span class="step-num"></span>
				</h2>
			</div>
			<div class="profile-manage">
				<input style="display: none;" id="userId" value="<%=id%>">
				<div class="form-row">
					<div class="t">
						<em>*</em>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="name" type="text"
							name="name" placeholder="输入姓名" class="ipt required"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="">
						&nbsp;&nbsp;&nbsp;&nbsp;<font color="#9fadc6"><em>*</em>&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
							<input id="age" type="radio" name="sex" value="0"
							checked="checked">
							男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							id="age" type="radio" name="sex" value="1"> 女</font>
					</div>
				</div>
				<div class="form-row">
					<div class="t">
						<em>*</em>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="age" type="text"
							oninput="value=value.replace(/[^\d]/g,'')" name="age"
							placeholder="输入年龄（此处只能输入数字）" class="ipt required"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">
						<em>*</em>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input type="text" name="tel"
							id="tel" class="ipt required" placeholder="输入电话号码（此处只能输入数字）"
							oninput="value=value.replace(/[^\d]/g,'')"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">
						<em>*</em>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：
					</div>
					<div class="c">
						<span class="ipt-wrap"> <select class="ipt required"
							name="degree" id="degree">
								<option value="初中及以下">初中及以下</option>
								<option value="中专/中技">中专/中技</option>
								<option value="高中">高中</option>
								<option value="大专">大专</option>
								<option value="本科">本科</option>
								<option value="硕士">硕士</option>
								<option value="博士">博士</option>
						</select></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">
						<em>*</em>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="school" type="text"
							name="school" placeholder="输入毕业学校" class="ipt required"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</div>
					<div class="c">
						<span class="ipt-wrap"><input id="professional" type="text"
							name="professional" placeholder="专业（如 网络工程）" class="ipt required"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">
						<em>*</em>期望职位：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="position" type="text"
							name="position" placeholder="输入行业" class="ipt required"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">
						<em>*</em>工作年限：
					</div>
					<div class="c">
						<span class="ipt-wrap"> <select class="ipt required"
							name="job_age" id="job_age">
								<option value="应届毕业生">应届毕业生</option>
								<option value="1~3年">1~3年</option>
								<option value="3~5年">3~5年</option>
								<option value="5~10年">5~10年</option>
								<option value="10年以上">10年以上</option>
						</select></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">期望薪资：</div>
					<div class="c">
						<span class="ipt-wrap"><input id="salary" type="text"
							oninput="value=value.replace(/[^\d]/g,'')" name="salary"
							placeholder="输入理想薪资" class="ipt required"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">个人优势：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6" id="advantage"
								name="advantage" placeholder="总结自己的工作成果，或者对于这份工作上的优势（不超过200字）"
								class="ipt required"></textarea></span>
					</div>
				</div>

				<div class="form-row">
					<div class="t">工作经历：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6"
								id="work_experience1" name="work_experience1"
								placeholder="填写自己的工作经历（应届毕业生可以跳过，不超过250字）" class="ipt required"></textarea></span>
					</div>
				</div>
				<div class="form-row" style="display: none" id="job">
					<div class="t">工作经历：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6"
								id="work_experience2" name="work_experience2"
								placeholder="填写自己的工作经历（不超过250字）" class="ipt required"></textarea></span>
					</div>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="add1" class="button1" onclick="addJob()">+工作经历</button>
				<div class="form-row">
					<div class="t">项目经历：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6"
								id="project_experience1" name="project_experience1"
								placeholder="填写自己做过的项目（不超过250字）" class="ipt required"></textarea></span>
					</div>
				</div>
				<div class="form-row" style="display: none" id="project">
					<div class="t">项目经历：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6"
								id="project_experience2" name="project_experience2"
								placeholder="填写自己做过的项目（不超过250字）" class="ipt required"></textarea></span>
					</div>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="add" class="button1" onclick="addProject()">+项目经历</button>
				<div class="form-row">
					<div class="t">自我评价：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6" id="evaluate"
								name="evaluate" placeholder="说说对自己的评价吧...（不超过250字）"
								class="ipt required"></textarea></span>
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
					<p>完善资料，让企业更加了解你</p>

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

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>汉中人才网-编辑职位</title>
<link href="../../css/resume.css" rel="stylesheet" type="text/css" />
<link href="../../css/index.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
<style type="text/css">
.ipt1 {
	width: 135px;
	padding-left: 13px;
	padding-right: 13px
    -webkit-transition: all linear .2s;
    transition: all linear .2s;
	color: ;	
	-webkit-appearance: none;
    padding: 6px 12px 5px 7px;
    min-height: 22px;
    line-height: 22px;
    border: 1px solid #e3e7ed;
    font-size: 13px;
    vertical-align: middle;
}
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
<script type="text/javascript" src="../../js/find.js"></script>
<script type="text/javascript">
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
function save(){
	var $id = $("#id").val();
	var $position_name = $("#position_name").val();
	var $job_nature = $("#job_nature").val();
	var $job_age = $("#job_age").val();
	var $degree = $("#degree").val();
	var $salary_low = $("#salary_low").val();
	var $salary_high = $("#salary_high").val();
	var $number = $("#number").val();
	var $skills_required = $("#skills_required").val();
	var $job_description = $("#job_description").val();
	if ($position_name == "") {
		alert("职位名称不能为空！");
		return false;
	}
	if ($salary_low == "") {
		alert("最低薪资不能为空！");
		return false;
	}
	if ($salary_high == "") {
		alert("最高薪资不能为空！");
		return false;
	}
	if (parseInt($salary_high) <= parseInt($salary_low)) {
		alert("最高薪资必须大于最低薪资！");
		return false;
	}
	if ($number == "") {
		alert("招聘人数不能为空！");
		return false;
	}
	if ($skills_required == "") {
		alert("技能要求不能为空！");
		return false;
	}
	$.ajax({
		async : false,
		url:"/rcw/position/updatePosition.action", 
		type:"POST",
		data:{"id":$id,"position":$position_name,"jobNature":$job_nature,"jobAge":$job_age,"degree":$degree,
			"salaryLow":$salary_low,"salaryHigh":$salary_high,"skillsRequired":$skills_required,"jobDescription":$job_description,"peopleNumber":$number,"publish":2},
		success : function(msg) {
			if (msg.status == 200) {
				alert("修改成功！");
				setTimeout(function() {
					findPositionByCompany();
					window.location.href = "company.jsp";
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
	<div id="header">
		<div class="inner home-inner">
    <div class="logo">
				<font size="6" face="微软雅黑" color="#00d7c6"><B>汉中人才网</B></font>
			</div>
        <div class="nav">
				<ul>
					<li class="cur"><a class="header-home"
						href="" onclick="findPositionByCompany()">&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职位管理</a></li>
					<li class=""><a class="header-job"
						href="company_talent.jsp" onclick="findPeople()">牛人</a></li>
					<li class=""><a class="header_brand"
						href="info.jsp" onclick="findInfo()">我的资料</a></li>
					<li class=""><a class="header-article"
						href="">资讯</a></li>
				</ul>
			</div>
        <div class="user-nav">
                <!--未登录-->
                <div class="btns" vertical-align="middle" >
                    <input style="display: none;" id="userId" value="${user.id}">
                    <a href="" ka="header-register" id="login" class="btn btn-outline">${user.userName }<div id="isLogin"></div></a>
                    <a href="##" ka="header-login" onclick="return logOut();" id="login1" class="btn btn-outline">退出<div id="isLogin1"></div></a>
                    <a href="add_position.jsp" ka="header-login" id="login1" class="btn btn-outline">发布职位<div id="isLogin1"></div></a>
                </div>
        </div>
    </div>
	</div>
	<div id="main">
		<div id="container">
		  <div class="profile-progress">
                <h2>修改职位，只需<span class="step-num">2</span>步：</h2>
                <ul>
                    <li class="active">
                        <div class="circle">1</div>
                        <p>修改职位</p>
                    </li>
                    <li class="step-last">
                        <div class="circle">2</div>
                        <p>管理员审核</p>
                    </li>
                </ul>
            </div>
			<div class="profile-manage">
				<input style="display: none;" id="id"
					value="${positionList[0].id }">
				<div class="form-row">
					<div class="t">
						<em>*</em>职位名称：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="position_name" type="text"
							name="position_name" placeholder="输入职位名称" class="ipt required" value="${positionList[0].position }"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t"><em>*</em>工作性质：</div>
					<div class="c">
						<span class="ipt-wrap"> <select
							class="ipt required" name="job_nature" id="job_nature" value="${positionList[0].position }">
								<option value="">${positionList[0].jobNature }</option>
								<option value="不限">不限</option>
								<option value="全职">全职</option>
								<option value="兼职<">兼职</option>
								<option value="实习">实习</option>
						</select></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t"><em>*</em>工作年限：</div>
					<div class="c">
						<span class="ipt-wrap"> <select
							class="ipt required" name="job_age" id="job_age">
								<option value="">${positionList[0].jobAge }</option>
								<option value="不限">不限</option>
								<option value="应届毕业生">应届毕业生</option>
								<option value="1年以内">1年以内</option>
								<option value="1~3年">1~3年</option>
								<option value="3~5年">3~5年</option>
								<option value="5~10年">5~10年</option>
								<option value="10年以上">10年以上</option>
						</select></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t"><em>*</em>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：</div>
					<div class="c">
						<span class="ipt-wrap"> <select
							class="ipt required" name="degree" id="degree" >
								<option value="">${positionList[0].degree }</option>
								<option value="不限">不限</option>
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
						<em>*</em>薪资范围：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="salary_low" type="text" oninput="value=value.replace(/[^\d]/g,'')"
							name="salary_low" placeholder="最低" class="ipt1" value="${positionList[0].salaryLow }">&nbsp;&nbsp;~</span>&nbsp;&nbsp;
							<input id="salary_high" type="text" oninput="value=value.replace(/[^\d]/g,'')"
							name="salary_high" placeholder="最高" class="ipt1" value="${positionList[0].salaryHigh }">
					</div>
				</div>
				<div class="form-row">
					<div class="t">
						<em>*</em>招聘人数：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="number" type="text"
							name="number" placeholder="人数 （如 1~3或者3）" class="ipt required" value="${positionList[0].peopleNumber }"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t"><em>*</em>技能要求：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6" id="skills_required"
								name="skills_required" placeholder="支持此职位需要的技能（最多250字）"
								class="ipt required">${positionList[0].skillsRequired }</textarea></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">职位描述：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6" id="job_description"
								name="job_description" placeholder="对此职位的简单描述（最多250字）"
								class="ipt required">${positionList[0].jobDescription }</textarea></span>
					</div>
				</div>
				<div class="btns" align="right">
					<button id="add" class="button2" onclick="return save();">提交</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="company.jsp">取消</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div class="side-tip">
					<img
						src="../../pic/edit.png" />
					<p>发布职位，迅速招揽顶尖人才</p>
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

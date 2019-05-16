<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>汉中人才网-企业端</title>
<link href="../../css/index.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif, simsun;
	background-image: url(../../pic/index.jpg);
}

.button1 { /* 按钮美化 */
	width: 70px; /* 宽度 */
	height: 49px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: #1E90FF; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: white; /* 字体颜色 */
	font-size: 15px; /* 字体大小 */
}

.button2 { /* 按钮美化 */
	width: 50px; /* 宽度 */
	height: 29px; /* 高度 */
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
	$(function() {
		$.ajax({
			async : false,
			url : "/rcw/resume/findResumeByCompany.action",
			data : {},
			type : "GET",
			success : function(msg) {
				if (msg.status != 200) {
					alert("查询载入出现错误，请刷新网页重试！");
				}
			},
			error : function(msg) {
				alert("系统异常！");
			}
		});
	})
	function logOut() {
		$.ajax({
			async : false,
			url : "/rcw/user/logOut.action",
			data : {},
			type : "GET",
			success : function(msg) {
				setTimeout(function() {
					window.location.href = "../login.jsp";
				}, 1);
			},
			error : function(msg) {
				alert("系统异常！");
			}
		});
	}
	function find() {
		var $position = $("#position").val();
		var $jobAge = $("#job_age").val();
		var $degree = $("#degree").val();
		$.ajax({
			async : false,
			url : "/rcw/resume/findResumeByCompany.action",
			data : {
				"position" : $position,
				"jobAge" : $jobAge,
				"degree" : $degree,
			},
			type : "GET",
			success : function(msg) {
				if (msg.status == 200) {
					setTimeout(function() {
						window.location.href = "company_talent.jsp";
					}, 1);
				}
			},
			error : function(msg) {
				alert("系统异常！");
			}
		});
	}
	function findNews(){
		$.ajax({
			async : false,
			url:"/rcw/news/findNews.action", 
			type:"Get",
			data:{},
			success : function(msg) {
			}
		});
	}
	function resumeInfo(id){
		$.ajax({
			async : false,
			url: "/rcw/resume/findResumeByCompany.action",
			data:{"id":id},
			type:"GET",
			success:function(msg){
			},
			error:function(msg){
				alert("系统异常！");
			}
		});
	}
</script>
</head>
<body>
	<div id="wrap" class="search-job-list-wrap">
		<div id="header">
			<div class="inner home-inner">
				<div class="logo">
					<font size="6" face="微软雅黑" color="#00d7c6"><B>汉中人才网</B></font>
				</div>
				<div class="nav">
					<ul>
						<li class=""><a class="header-home" href="company.jsp" onclick="findPositionByCompany()">&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职位管理</a></li>
						<li class="cur"><a class="header-job" href="">牛人</a></li>
						<li class=""><a class="header_brand" href="info.jsp" onclick="findInfo()">我的资料</a></li>
						<li class=""><a class="header-article" href="zixun.jsp" onclick="findNews()">资讯</a></li>
					</ul>
				</div>
				<div class="user-nav">
					<!--未登录-->
					<div class="btns" vertical-align="middle">
						<input style="display: none;" id="userId" value="${user.id}">
						<a href="" ka="header-register" id="login" class="btn btn-outline">${user.userName }<div
								id="isLogin"></div></a> <a href="" ka="header-login"
							onclick="return logOut();" id="login1" class="btn btn-outline">退出
							<div id="isLogin1"></div>
						</a> <a href="add_position.jsp" ka="header-login" id="login1"
							class="btn btn-outline">发布职位
							<div id="isLogin1"></div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="column-search-panel">
			<div class="inner home-inner">
				<div class="search-box">
					<div class="search-form ">
							<div class="logo">
								<font size="6" face="微软雅黑" color="#00d7c6"><B>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B></font>
							</div>
							<div class="search-form-con">
								<div class="position-sel" class="search_box_sel_jobtype">
									<span class="label-text"><b>牛人</b><i
										class="icon-arrow-down"></i></span>
								</div>
								<p class="ipt-wrap">
									<input type="text" name="position" class="ipt-search"
										maxlength="50" autocomplete="off" placeholder="搜索牛人" id="position">
								</p>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="button1"  onclick="find();">搜索</button>
							<div class="suggest-result">
								<ul>
								</ul>
							</div>
							<div class="position-box">
								<div class="dropdown-menu">
									<div class="select-tree" data-level="3"></div>
								</div>
							</div>
					</div>
					<br>
				</div>
			</div>
		</div>
		<div id="filter-box">
			<div class="inner home-inner">
				<div class="box-shadow-box"></div>
				<div class="filter-select-box">
					<div class="dropdown-wrap">

						<span class="dropdown-select"> <select class="ipt required"
							name="job_age" id="job_age">
								<option value="">经验</option>
								<option value="应届毕业生">应届毕业生</option>
								<option value="1年以内">1年以内</option>
								<option value="1~3年">1~3年</option>
								<option value="3~5年">3~5年</option>
								<option value="5~10年">5~10年</option>
								<option value="10年以上">10年以上</option>
						</select>
						</span>
					</div>
					<div class="dropdown-wrap">

						<span class="dropdown-select"> <select class="ipt required"
							name="degree" id="degree">
								<option value="">学历</option>
								<option value="初中及以下">初中及以下</option>
								<option value="中专/中技">中专/中技</option>
								<option value="高中">高中</option>
								<option value="大专">大专</option>
								<option value="本科">本科</option>
								<option value="硕士">硕士</option>
								<option value="博士">博士</option>
						</select>
						</span>
					</div>
					<div class="dropdown-wrap">
						<span class="dropdown-select">
							<button class="button2" onclick="find();">搜索</button>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div id="main" class="inner home-inner">
			<div class="job-box">
				<!-- 广告 -->
				<div class="sider">
				<c:forEach items="${newsList }" var="news">
					<div class="promotion-img nomargin">
						<a href="../find/scan_news.jsp" onclick="findNews(${news.id })" target="_blank"
							ka="ad_banner_0"><img
							src="/icon/${news.pic }"
							/></a>
					</div>
					</c:forEach>
				</div>
				<div class="job-list">
					<ul>
					<c:forEach items="${resumeList }" var="resume">
						<li>
							<div class="job-primary">
								<div class="info-primary">
									<h3 class="name">
											<div class="job-title">${resume.name }</div>
											<div class="info-detail"></div>
									</h3>
									工作年限：${resume.jobAge }<em class="vline"></em>学历：${resume.degree }
								</div>
								<div class="info-company">
										<div class="company-text">
											<div class="job-title">
												<a href="resumeInfo.jsp" onclick="resumeInfo(${resume.id })">查看详情</a>
											</div>
											<p>学校：${resume.school }<em class="vline"></em>专业：${resume.professional }</p>
										</div>
									</div>
								<div class="info-publis">
									<br>
									<p>期望薪资：${resume.salary }/月</p>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<script src="../../js/main.js"></script>
		<input type="hidden" id="page_key_name" value="cpc_job_list" />
</body>
</html>

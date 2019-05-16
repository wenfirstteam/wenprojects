<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>汉中人才网-搜索公司</title>
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
		findShow();
		$.ajax({
			async : false,
			url : "/rcw/user/isLogin.action",
			data : {},
			type : "GET",
			success : function(msg) {
				if (msg.status == 200) {
					document.getElementById("info").innerHTML = "我的资料";
					document.getElementById("isLogin").innerHTML = msg.data.userName;
					document.getElementById("isLogin1").innerHTML = "退出";
					$('#login1').attr('onclick', "logOut()");
				} else {
					document.getElementById("isLogin").innerHTML = "注册";
					document.getElementById("isLogin1").innerHTML = "登录";
					$('#login').attr('href', "../register.jsp");
					$('#login1').attr('href', "../login.jsp");
				}
			}
		});
		$.ajax({
			async : false,
			url : "/rcw/introduction/findIntroductionUser.action",
			data : {},
			type : "GET",
			success : function(msg) {
				if(msg.status != 200)
				{
					alert("查询载入出现错误，请刷新网页重试！");
				}
			}
		});
	})
	function logOut() {
		$.ajax({
			async : true,
			url : "/rcw/user/logOut.action",
			data : {},
			type : "GET",
			success : function(msg) {
				setTimeout(function() {
					window.location.href = "../login.jsp";
				}, 1);
			}
		});
	}
	function find() {
		var $company = $("#company").val();
		var $people = $("#people").val();
		$.ajax({
			async : false,
			url : "/rcw/introduction/findIntroductionUser.action",
			data : {
				"people" : $people,
				"companyName" : $company
			},
			type : "GET",
			success : function(msg) {
				if(msg.status != 200)
				{
					alert("查询出现错误，请刷新网页重试！");
				}else
					setTimeout(function() {
						window.location.href = "";
					}, 1);
			}
		});
	}
	function findCompanyInfo(id){
		$.ajax({
			async : false,
			url : "/rcw/introduction/findIntroductionUser.action",
			data : {"id":id},
			type : "GET",
			success : function(msg) {
				setTimeout(function() {
					window.location.href = "companyInfo.jsp";
				}, 1);
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
						<li class=""><a class="header-home" href="../index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></li>
						<li class=""><a class="header-job" href="position.jsp" onclick="findPosition()">职位</a></li>
						<li class="cur"><a class="header_brand" href="">公司</a></li>
						<li class=""><a class="header-article"
						 href="zixun.jsp" onclick="findNews()">资讯</a></li>
						<li class=""><a class="header-article" href="resume.jsp" onclick="resume()"><div
									id="info"></div></a></li>
					</ul>
				</div>
				<div class="user-nav">
					<!--未登录-->
					<div class="user-nav">
					<!--未登录-->
					<div class="btns" vertical-align="middle">
						<a href="" ka="header-register" id="login" class="btn btn-outline"><div
								id="isLogin"></div></a> <a href="" ka="header-login" id="login1"
							class="btn btn-outline"><div id="isLogin1"></div></a>
					</div>
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
									<span class="label-text"><b>公司</b><i
										class="icon-arrow-down"></i></span>
								</div>
								<p class="ipt-wrap">
									<input type="text" name="query" class="ipt-search"
										maxlength="50" placeholder="搜索公司"
										id="company">
								</p>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="button1" onclick="find()">搜索</button>
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
							name="people" id="people">
								<option value="">公司规模</option>
								<option value="1~50">1~50</option>
								<option value="50~100">50~100</option>
								<option value="100~400">100~400</option>
								<option value="400~1000">400~1000</option>
								<option value="1000~10000">1000~10000</option>
								<option value="10000以上">10000以上</option>
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
						<a href="scan_news.jsp" onclick="findNews(${news.id })" target="_blank"
							ka="ad_banner_0"><img
							src="/icon/${news.pic }"
							/></a>
					</div>
					</c:forEach>
				</div>
				<div class="job-list">
					<div class="company-list"></div>
					<ul>
						<c:forEach items="${introductionList }" var="introduction">
							<li onclick="findCompanyInfo(${introduction.id})"> 
								<div class="job-primary">
									<div class="info-primary">
										<img src="/icon/${introduction.icon }" width="80px" height="60px">
									</div>
									<div class="info-company">
										<div class="company-text">
											<div class="job-title"><h3>${introduction.companyName }</h3></div>
											<p>
											公司规模：${introduction.people }
											</p>
										</div>
									</div>
									<div class="info-publis" style="display: block">
                                       	 邮箱：${introduction.email}
										<p>地址：${introduction.address}</p>
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

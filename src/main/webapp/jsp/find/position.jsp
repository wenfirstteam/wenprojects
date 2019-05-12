<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>汉中人才网-搜索职位</title>
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
<script type="text/javascript">
	$(function() {
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
			},
			error : function(msg) {
				alert("系统异常！");
			}
		});
		$.ajax({
			async : false,
			url : "/rcw/position/findPositionFormUser.action",
			data : {"publish":1},
			type : "GET",
			success : function(msg) {
				if(msg.status != 200)
				{
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
			async : true,
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
		var $salaryLow = $("#salaryLow").val();
		var $nature = $("#job_nature").val();
		$.ajax({
			async : false,
			url : "/rcw/position/findPositionFormUser.action",
			data : {
				"position" : $position,
				"jobAge" : $jobAge,
				"degree" : $degree,
				"salaryLow" : $salaryLow,
				"jobNature" : $nature,
				"publish"   : 1
			},
			type : "GET",
			success : function(msg) {
				if(msg.status != 200)
				{
					alert("查询出现错误，请刷新网页重试！");
				}else
					setTimeout(function() {
						window.location.href = "position.jsp";
					}, 1);
			},
			error : function(msg) {
				alert("系统异常！");
			}
		});
	}
	
	function findInfo(id){
		alert(id);
		$.ajax({
			async : false,
			url : "/rcw/position/findPositionInfo.action",
			data : {
				"id":id
			},
			type : "GET",
			success : function(msg) {
				if(msg.status != 200)
				{
					alert("查询出现错误，请刷新网页重试！");
				}else
					setTimeout(function() {
						window.location.href = "positionInfo.jsp";
					}, 1);
			},
			error : function(msg) {
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
				<div class="nav-city">
					<div class="city-box">
						<div class="dorpdown-city"></div>
					</div>
				</div>
				<div class="nav">
					<ul>
						<li class=""><a class="header-home" href="../index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></li>
						<li class="cur"><a class="header-job" href="">职位</a></li>
						<li class=""><a class="header_brand" href="find_company.jsp" onclick="findCompany()">公司</a></li>
						<li class=""><a class="header-article"
							href="https://news.zhipin.com/">资讯</a></li>
						<li class=""><a class="header-article" href="resume.jsp" onclick="resume()"><div
									id="info"></div></a></li>
					</ul>
				</div>
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
									<span class="label-text"><b>职位类型</b><i
										class="icon-arrow-down"></i></span>
								</div>
								<p class="ipt-wrap">
									<input type="text" name="query" class="ipt-search"
										maxlength="50" placeholder="搜索职位"
										id="position">
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

						<span class="dropdown-select"> <input class="ipt required"
							name="salaryLow" id="salaryLow" placeholder="最低薪资"
							oninput="value=value.replace(/[^\d]/g,'')">
					</div>
					<div class="dropdown-wrap">
						<span class="dropdown-select"> <select class="ipt required"
							name="job_nature" id="job_nature">
								<option value="">性质</option>
								<option value="全职">全职</option>
								<option value="兼职<">兼职</option>
								<option value="实习">实习</option>
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


					<div class="promotion-img nomargin">
						<a href="/activity/personality/index.html" target="_blank"
							ka="ad_banner_0"><img
							src="https://z.zhipin.com/web/upload/market/coop/20180421-03.jpg"
							alt="" /></a>
					</div>
					<div class="promotion-img">
						<a href="/app.html" target="_blank" ka="ad_banner_1"><img
							src="https://static.zhipin.com/zhipin/v151/web/geek/images/pro-1.png"
							alt="" /></a>
					</div>
					<div class="promotion-img">
						<a href="/user/login.html?initType=3" target="_blank"
							ka="ad_banner_2"><img
							src="https://static.zhipin.com/zhipin/v151/web/geek/images/pro-2.png"
							alt="" /></a>
					</div>
				</div>
				<div class="job-list">
					<div class="company-list"></div>
					<ul>
						<c:forEach items="${positionList }" var="position">
							<li>
								<div class="job-primary">
									<div class="info-primary">
										<h3 class="name">
											<a href="/job_detail/c2cf94a2b99762eb1H1z3N21FFA~.html"
												data-jid="c2cf94a2b99762eb1H1z3N21FFA~" data-itemid="1"
												data-lid="1sD6k6heEGM.search" data-jobid="39970842"
												data-index="0" ka="search_list_1" target="_blank">
												<div class="job-title">${position.position }</div> <span
												class="red">${position.salaryLow }-${position.salaryHigh }</span>
												<div class="info-detail"></div>
											</a>
										</h3>
										工作年限：${position.jobAge }<em class="vline"></em>学历：${position.degree }
										</p>
									</div>
									<div class="info-company">
										<div class="company-text">
											<div class="job-title">
												<a href="javascript:findInfo(${position.id });">查看详情</a>
											</div>
											<p>需要人数：${position.peopleNumber }</p>
										</div>
									</div>
									<div class="info-publis">
										<br>
										<p>发布时间：${position.publishTime}</p>
									</div>
									<a href="javascript:;"
										data-url="/gchat/addRelation.json?jobId=c2cf94a2b99762eb1H1z3N21FFA~&lid=1sD6k6heEGM.search"
										redirect-url="/geek/new/index/chat?id=96302df5d741f82f0XRy2dy7FlA~"
										class="btn btn-startchat">立即沟通 </a>
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

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <title>汉中人才网-公司详情</title>
        <link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
	<link href="../../css/info.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="../../js/find.js"></script>
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
			},
			error : function(msg) {
				alert("系统异常！");
			}
		});
	}
	function findInfo(id){
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
			}
		});
	}
    </script>
    </head>

<body class="page-white">

    <div id="wrap">
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
						<li class="cur"><a class="header_brand" href="find_company.jsp" onclick="findCompany()">公司</a></li>
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
 <div id="main" class="company-new">


    <div class="company-banner" style="">
        <div class="inner home-inner">
            <div>
    <div class="info-primary">
        <img src="/icon/${introductionList[0].icon }" alt="" class="fl"/>
        <div class="info">
            <h1 class="name">${introductionList[0].companyName }<i class="icon-brand"></i></h1>
                <div class="tag-container">
                    <div class="job-tags">规模：<span>${introductionList[0].people }</span></div>
                </div>
        </div>
    </div>
            </div>
            <div class="smallbanner " style="display: none;">
                <div class="smallbanner-content">
    <div class="company-stat">
    </div>
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
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

        </div>
</div>
    </div>
</body>
</html>
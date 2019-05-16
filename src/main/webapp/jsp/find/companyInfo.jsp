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
			},
			error : function(msg) {
				alert("系统异常！");
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
	function find(userId) {
		$.ajax({
			async : false,
			url : "/rcw/position/findPositionFormUser.action",
			data : {
				"userId"   : userId,
				"publish"  : 1
			},
			type : "GET",
			success : function(msg) {
				if(msg.status != 200)
				{
					alert("查询出现错误，请刷新网页重试！");
				}
			},
			error : function(msg) {
				alert("系统异常！");
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

                <div class="company-hotjob " >
                    <div class="inner home-inner">
                        <h3><a href="companyPosition.jsp" onclick="find(${introductionList[0].userId })">全部职位</a></h3>
                    </div>
                </div>

            <div class="job-box">
                <div class="inner home-inner">
                    <div class="company-sider">
                        <!-- 快速登录注册 -->

                            <div class="job-sec manager-list">
                                <h3>招聘代表人<span class="tab-nav"><i class="cur"></i><i></i><i></i></span></h3>
                                <div class="manager-inner">
                                    <ul>
                                            <li class="cur">
                                                <div class="info-user">
                                                    <p><span class="name">${introductionList[0].name }</span><span class="job-title">${introductionList[0].position }</span></p>
                                                </div>
                                            </li>
                                    </ul>
                                </div>
                            </div>
                    </div>

                    <div class="job-detail">
                        <div class="detail-content">
                                <div class="job-sec">
                                    <h3>${introductionList[0].companyName }信息：</h3>
                                    <div class="text fold-text">公司规模：${introductionList[0].people }</div>
                                    <div class="text fold-text">详情询问：${introductionList[0].telphone }</div>
                                    <div class="text fold-text">简历投递邮箱：${introductionList[0].email }</div>
                                    <div class="text fold-text">公司地址：${introductionList[0].address }</div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
    </div>
</body>
</html>
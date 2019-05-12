<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>汉中人才网-职位详情</title>
    <link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
    <link href="../../css/info.css" type="text/css" rel="stylesheet">
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
</script>
</head>
<body class="page-white">
<div id="wrap">
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
						<li class=""><a class="header_brand" href="find_company.jsp">公司</a></li>
						<li class=""><a class="header-article"
							href="https://news.zhipin.com/">资讯</a></li>
						<li class=""><a class="header-article" href="resume.jsp"><div
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
	 <div id="main">
        <div class="job-banner">
            <div class="inner home-inner">
                <div class="job-primary detail-box">
                    <div class="info-primary">
                        <div class="name">
                            <h1>${positionMap.publish_position }</h1>
                            <span class="salary">
                                    ${positionMap.salary_low }-${positionMap.salary_high }
                            </span>
                        </div>
                            <div class="tag-container">
                                <div class="job-tags">
                                    <span>${positionMap.job_age }</span><span>${positionMap.degree }</span>
                                    <span>${positionMap.people }</span><span>${positionMap.job_nature }</span>
                                </div>
                            </div>
                    </div>
                    <div class="job-op">
                        <div class="btn-container">
                            <!-- 未登录 -->
                                                 <a class="btn btn-startchat" ka="go_greet_tosign_34447986" href="javascript:;" redirect-url="/geek/new/index/chat?id=ba47f20652adef0b1HZ90tS-F1Y~" target="_blank"
                          data-url="/gchat/addRelation.json?jobId=fabcc4c7642cc8f51HB-39q0GFQ~">立即沟通</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="job-box">
            <div class="inner home-inner">
                <div class="job-sider">
                    <div class="sider-company">
                        <p class="title">公司基本信息</p>
                            <div class="company-info">
                                        <img src="/icon/${positionMap.icon }"/>
                                </a>
                                 ${positionMap.company_name }
                                </a>
                            </div>
                                 <p><i class="icon-stage"></i>${positionMap.people }</p>
                                <p><i class="icon-scale"></i>${positionMap.telphone }</p>
                                <p><i class="icon-net"></i>${positionMap.email }</p>
                    <p class="gray">此职位发布于：${positionMap.publish_time }</p>
                </div>

				<!-- 广告 -->
                <div class="promotion-img">
                    <a href="/app.html" ka="job-detail-app" target="_blank"><img src="https://static.zhipin.com/zhipin/v154/web/geek/images/pro-1.png" alt=""></a>
                </div>
            </div>

            <div class="job-detail">
                <div class="detail-op">
                    <h2 class="name">${positionMap.name }<i class="icon-vip"></i></h2>
                    <p class="gray">${positionMap.position }</p>
                </div>
                <div class="detail-content">
                        <div class="job-sec">
                            <h3>职位描述</h3>
                            <div class="text">
                                岗位职责：<br/>${positionMap.job_description }
                            </div>
                        </div>
                            <div class="job-sec company-info">
                                <h3>技能要求</h3>
                                <div class="text">
                                   ${positionMap.skills_required }
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
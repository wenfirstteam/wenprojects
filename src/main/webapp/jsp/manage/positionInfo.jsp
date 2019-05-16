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
    <style type="text/css">
    .button1 { /* 按钮美化 */
	width: 58px; /* 宽度 */
	height: 29px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: #1E90FF; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: white; /* 字体颜色 */
	font-size: 15px; /* 字体大小 */
}</style>
    <script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="../../js/find.js"></script>
	<script type="text/javascript">
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
        <div class="nav">
				<ul>
					<li class="cur"><a class="header-home"
						href="manager.jsp" onclick="findInfo('');">&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职位审核</a></li>
					<li class=""><a class="header-job"
						href="company_talent.jsp" onclick="findPeople()">新闻管理</a></li>
					<li class=""><a class="header_brand"
						href="info.jsp" onclick="findInfo()">添加管理员</a></li>
				</ul>
			</div>
        <div class="user-nav">
                <!--未登录-->
                <div class="btns" vertical-align="middle" >
                    <input style="display: none;" id="userId" value="${user.id}">
                    <a href="" ka="header-register" id="login" class="btn btn-outline">${user.userName }<div id="isLogin"></div></a>
                    <a href="" ka="header-login" onclick="return logOut();" id="login1" class="btn btn-outline">退出<div id="isLogin1"></div></a>
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
                                 <p><i class="icon-stage"></i>规模：${positionMap.people }</p>
                                <p><i class="icon-scale"></i>电话：${positionMap.telphone }</p>
                                <p><i class="icon-net"></i>邮箱：${positionMap.email }</p>
                    <p class="gray">此职位发布于：${positionMap.publish_time }</p>
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
    							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    							&nbsp;&nbsp;&nbsp;&nbsp;
    							<button class="button1" onclick="updatePublish(1,${positionMap.id })">通过</button>
    							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="button1" onclick="updatePublish(0,${positionMap.id })">驳回</button> <br><br>
</div>
 </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>汉中人才网-我的资料</title>
    <meta name="applicable-device" content="pc">
<link href="../../css/index.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif, simsun;
	background-image: url(../pic/index.jpg);
}
.button1 { /* 按钮美化 */
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
$(function(){
	$.ajax({
		async : false,
		url: "/rcw/user/isLogin.action",
		data:{},
		type:"GET",
		success:function(msg){
			if(msg.status == 200)
			{
				document.getElementById("info").innerHTML = "我的资料";
				document.getElementById("isLogin").innerHTML = msg.data.userName;
				document.getElementById("isLogin1").innerHTML = "退出";
				$('#login1').attr('onclick',"logOut()");
			}else{
				document.getElementById("isLogin").innerHTML = "注册";
				document.getElementById("isLogin1").innerHTML = "登录";
				$('#login').attr('href',"../register.jsp");
				$('#login1').attr('href',"../login.jsp");
			}
		},
		error:function(msg){
			alert("系统异常！");
		}
	});
	$.ajax({
		async : false,
		url: "/rcw/resume/findResumeByUser.action",
		data:{},
		type:"GET",
		success:function(msg){
		},
		error:function(msg){
			alert("系统异常！");
		}
	});
})
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
</script>
</head>
<body class="">

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
					<li class=""><a class="header-home"
						href="../index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></li>
					<li class=""><a class="header-job"
						href="position.jsp" onclick="findPosition()">职位</a></li>
					<li class=""><a class="header_brand"
						href="find_company.jsp" onclick="findCompany()">公司</a></li>
					<li class=""><a class="header-article"
					 href="zixun.jsp" onclick="findNews()">资讯</a></li>
					<li class="cur"><a class="header-article"
						href="resume.jsp"><div id="info"></div></a></li>
				</ul>
			</div>
	<div class="user-nav">
                <!--未登录-->
                <div class="btns" vertical-align="middle" >
                    <a href="" ka="header-register" id="login" class="btn btn-outline"><div id="isLogin"></div></a>
                    <a href="" ka="header-login" id="login1" class="btn btn-outline"><div id="isLogin1"></div></a>
                </div>
        </div>
	</div>
</div>
    <div id="main" class="inner">
        <div class="job-box">
            <!-- 侧边栏 -->
            <div class="sider deliver-sider"></div>
            <!-- 简历主体 -->
            <div class="resume">
            <form action="editResume.jsp">
                <!-- 简历 -->
                <div class="resume-box">
                    <!-- 个人信息 -->
                    <div class="resume-item" id="resume-userinfo">
                        <div class="item-primary">
                            <div class="userinfo-con" ka="user-resume-edit-userinfo">
                                <h2 class="name">
                                  ${resumeList[0].name}
                                    <i class="fz-resume fz-female"></i>
                                </h2>
                                <div class="info-labels">
                                    <p class="row-base">
                                        <span class="label-text">
                                        	<i class="fz-resume fz-experience"></i>${resumeList[0].age}<em class="vline"></em>
                                        	<i class="fz-resume fz-experience"></i>${resumeList[0].jobAge}</span><em class="vline"></em><span class="label-text">
                                        	<i class="fz-resume fz-degree"></i>${resumeList[0].degree}</span>
                                    </p>
                                    <p class="row-contact">
                                        <span class="label-text">
                                        	<i class="fz-resume fz-tel"></i>${resumeList[0].telphone}</span>
                                    </p>
                                </div>
                            </div>
                            </div>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 个人优势 -->
                    <div class="resume-item" id="resume-summary">
                        <div class="item-primary">
                            <h3 class="title">个人优势</h3>
                            <div class="text" ka="user-resume-edit-desc">
                                <p><i class="fz-resume fz-tel"></i>${resumeList[0].advantage }</p>
                            </div>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 期望职位 -->
                    <div class="resume-item" id="resume-purpose">
                        <div class="item-primary">
                            <h3 class="title">期望职位</h3>
                            <ul class="purpose-list">
                                        <li id="row-bda87af775f8739a1Xd_29u4FlE-" ka="user-resume-edit-holpjob1">
                                            <span class="">
                                            	<i class="fz-resume "></i>${resumeList[0].position }</span><em class="vline"></em><span class="">
                                            	<i class="fz-resume "></i>${resumeList[0].salary }</span>
                                        </li>
                                    
                                
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 教育经历 -->
                    <div class="resume-item" id="resume-education">
                        <div class="item-primary">
                            <h3 class="title">教育经历</h3>
                            <ul class="history-project">
                                        <li id="row-1ff231c4536311ac1nd-3t24GFE-" ka="user-resume-edit-eduexp1">
                                            <div class="item-name">
                                                <h4 class="name">${resumeList[0].school }</h4>
                                            </div>
                                            <h4>${resumeList[0].professional }<em class="vline"></em><b>${resumeList[0].degree }</b></h4>
                                        </li>
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 项目经历 -->
                    <div class="resume-item" id="resume-project">
                        <div class="item-primary">
                            <h3 class="title">项目经历</h3>
                            <ul class="history-project">
                                 <i class="fz-resume "></i>${resumeList[0].project_experience1 }
                            </ul>
                            <ul class="history-project">
                                 <i class="fz-resume "></i>${resumeList[0].project_experience2 }
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 社交主页 -->
                    <div class="resume-item" id="resume-social">
                        <div class="item-primary">
                            <h3 class="title">工作经验</h3>
                            <ul class="social-account">
                                <i class="fz-resume "></i>${resumeList[0].work_experience1 }
                            </ul>
                            <ul class="social-account">
                                <i class="fz-resume "></i>${resumeList[0].work_experience2 }
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 志愿者经历 -->
                    <div class="resume-item" id="resume-volunteer">
                        <div class="item-primary">
                            <h3 class="title">自我评价</h3>
                            <ul class="history-project">
                                <i class="fz-resume "></i>${resumeList[0].evaluate }
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <div class="resume-item" id="resume-social">
                        <div class="item-primary" align="right">
                           <button class="button1">修改信息</button>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://static.zhipin.com/zhipin/v151/web/geek/js/main.js"></script>
</body>
<input type="hidden" id="page_key_name" value="cpc_user_resume" />
</html>
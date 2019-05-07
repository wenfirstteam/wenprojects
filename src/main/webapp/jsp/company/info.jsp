<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>汉中人才网企业端-我的资料</title>
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
	background-image: url(../../pic/index.jpg);
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
<script type="text/javascript">
$(function(){
	$.ajax({
		async : false,
		url: "/rcw/introduction/findIntroduction.action",
		data:{},
		type:"GET",
		success:function(msg){
			if(msg.status != 200)
			{
				alert("查询出现错误，请刷新网页重试！");
			}
		},
		error:function(msg){
			alert("系统异常！");
		}
	});
});
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
<body class="position-manage">

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
						href="company.jsp">&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职位管理</a></li>
					<li class=""><a class="header-job"
						href="company_talent.jsp">牛人</a></li>
					<li class="cur"><a class="header_brand"
						href="">我的资料</a></li>
					<li class=""><a class="header-article"
						href="">资讯</a></li>
				</ul>
			</div>
	<div class="user-nav">
                <!--未登录-->
                <div class="btns" vertical-align="middle" >
                    <a href="" ka="header-register" id="login" class="btn btn-outline">${user.userName }<div id="isLogin"></div></a>
                    <a href="" ka="header-login" onclick="return logOut();" id="login1" class="btn btn-outline">退出<div id="isLogin1"></div></a>
                    <a href="add_position.jsp" ka="header-login" id="login1" class="btn btn-outline">发布职位<div id="isLogin1"></div></a>
                </div>
        </div>
	</div>
</div>
    <div id="main" class="inner">
        <div class="job-box">
            <div class="resume">
                <div class="resume-box">
                <form action="editIntroduce.jsp">
                    <div class="resume-item" id="resume-userinfo">
                        <div class="item-primary">
                            <div class="userinfo-con" ka="user-resume-edit-userinfo">
                                <h2 class="name">
                                 ${introductionList[0].companyName }
                                    <i class="fz-resume fz-female"></i>
                                </h2>
                            </div>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <div class="resume-item" id="resume-summary">
                        <div class="item-primary">
                            <div class="title">代&nbsp;表&nbsp;人&nbsp;姓&nbsp;名&nbsp;：
                                <font size="3">${introductionList[0].name }</font>
                            </div>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <div class="resume-item" id="resume-purpose">
                        <div class="item-primary">
                            <div class="title">代&nbsp;表&nbsp;人&nbsp;电&nbsp;话&nbsp;：
                            <font size="3">${introductionList[0].telphone } </font>
                       	 </div>
                        </div>
                    </div>
                    <div class="resume-item" id="resume-history">
                        <div class="item-primary">
                            <div class="title">代&nbsp;表&nbsp;人&nbsp;职&nbsp;位&nbsp;：
                            <font size="3">${introductionList[0].position } </font>
                            </div>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <div class="resume-item" id="resume-project">
                        <div class="item-primary">
                            <div class="title">公&nbsp;司&nbsp;规&nbsp;模&nbsp;：
                            <font size="3">${introductionList[0].people } </font>
                            </div>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <div class="resume-item" id="resume-education">
                        <div class="item-primary">
                            <div class="title">邮&nbsp;&nbsp;箱&nbsp;&nbsp;：
                            <font size="3">${introductionList[0].email } </font>
                            </div>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <div class="resume-item" id="resume-social">
                        <div class="item-primary">
                            <div class="title">地&nbsp;&nbsp;址&nbsp;&nbsp;：
                            <font size="3">${introductionList[0].address } </font>
                       		 </div>
                        <div class="item-form"></div>
                        </div>
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
</body>
</html>
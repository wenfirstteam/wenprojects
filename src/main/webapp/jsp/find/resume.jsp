<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>汉中人才网-我的资料</title>
    <meta name="applicable-device" content="pc">
<link href="../css/index.css" rel="stylesheet" type="text/css">
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
</style>
<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
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
				document.getElementById("isLogin").innerHTML = msg.data;
				document.getElementById("isLogin1").innerHTML = "退出";
				$('#login1').attr('onclick',"logOut()");
			}else{
				document.getElementById("isLogin").innerHTML = "注册";
				document.getElementById("isLogin1").innerHTML = "登录";
				$('#login').attr('href',"register.jsp");
				$('#login1').attr('href',"login.jsp");
			}
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
				window.location.href = "login.jsp";
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
						href="https://www.zhipin.com/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></li>
					<li class=""><a class="header-job"
						href="find/position.jsp">职位</a></li>
					<li class=""><a class="header_brand"
						href="https://www.zhipin.com/gongsi/">公司</a></li>
					<li class="cur"><a class="header-article"
						href="resume.jsp"><div id="info"></div></a></li>
					<li class=""><a class="header-article"
						href="https://news.zhipin.com/">资讯</a></li>
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
                <!-- 最后更新时间，预览简历入口 -->
                <div class="update-time">最后更新 2019.04.28 09:58<span class="prv-view-btn" ka="user_resume_preview">预览简历</span></div>
                <!-- 简历 -->
                <div class="resume-box">
                    <!-- 个人信息 -->
                    <div class="resume-item" id="resume-userinfo">
                        <div class="item-primary">
                            <div class="userinfo-con" ka="user-resume-edit-userinfo">
                                <h2 class="name">
                                    宣雯
                                    <i class="fz-resume fz-female"></i>
                                </h2>
                                <div class="info-labels">
                                    <p class="row-base">
                                        <span class="label-text">
                                        	<i class="fz-resume fz-experience"></i>应届生</span><em class="vline"></em><span class="label-text">
                                        	<i class="fz-resume fz-degree"></i>本科学历</span>
                                        <em class="vline"></em><span class="label-text">
                                        	<i class="fz-resume fz-status"></i>离职-随时到岗</span>
                                    </p>
                                    <p class="row-contact">
                                        <span class="label-text">
                                        	<i class="fz-resume fz-tel"></i>15229009831</span>
                                    </p>
                                </div>
                            </div>
                            <div class="op">
                                <a data-url="/geek/user/info.json" href="javascript:;" ka="user-resume-edit-userinfo" class="link-edit"><i class="iboss-edit"></i><span>编辑</span></a>
                            </div>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 个人优势 -->
                    <div class="resume-item" id="resume-summary">
                        <div class="item-primary">
                            <h3 class="title">个人优势</h3>
                            <div class="summary-con text" ka="user-resume-edit-desc">
                                <p>2019届毕业生，网络工程专业，具备一定编程知识，做事认真负责。虽然我没有实习经验，但我会尽一切努力去完善自己。</p>
                                <div class="op">
                                    <a data-url="/geek/getUserDescForm.json" href="javascript:;" ka="user-resume-edit-desc" class="link-edit"><i class="iboss-edit"></i><span>编辑</span></a>
                                </div>
                            </div>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 期望职位 -->
                    <div class="resume-item" id="resume-purpose">
                        <div class="item-primary">
                            <a href="javascript:;" data-url="/geek/getGeekExpectPositionForm.json" ka="user-resume-add-holpjob" class="link-add" >
                                <i class="iboss-tianjia"></i><span>添加</span>
                            </a>
                            <h3 class="title">期望职位</h3>
                            <ul class="purpose-list">
                                
                                    
                                        <li id="row-bda87af775f8739a1Xd_29u4FlE-" ka="user-resume-edit-holpjob1">
                                            <span class="label-text">
                                            	<i class="fz-resume fz-job"></i>Java</span><em class="vline"></em><span class="label-text">
                                            	<i class="fz-resume fz-salary"></i>面议</span><em class="vline"></em><span class="label-text">
                                            	<i class="fz-resume fz-industry"></i>不限</span><em class="vline"></em>
                                            <span class="label-text">
                                            	<i class="fz-resume fz-place"></i>西安</span>
                                            <div class="op">
                                                <a data-url="/geek/delGeekExceptPosition.json?id=bda87af775f8739a1Xd_29u4FlE~" style="display: none" href="javascript:;" ka="user-resume-del-holpjob1" class="link-delete">
                                                    <i class="iboss-delete"></i><span>删除</span>
                                                </a>
                                                <a data-url="/geek/getGeekExpectPositionForm.json?id=bda87af775f8739a1Xd_29u4FlE~" href="javascript:;" ka="user-resume-edit-holpjob1" class="link-edit">
                                                    <i class="iboss-edit"></i><span>编辑</span>
                                                </a>
                                            </div>
                                        </li>
                                    
                                
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 工作、实习经历 -->
                    <div class="resume-item" id="resume-history">
                        <div class="item-primary">
                            <a href="javascript:;" data-url="/geek/getWorkExperienceForm.json" ka="user-resume-add-workexp" class="link-add"  >
                                <i class="iboss-tianjia"></i><span>添加</span>
                            </a>
                            <h3 class="title">实习经历</h3>
                            <ul class="history-project">
                                
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 项目经历 -->
                    <div class="resume-item" id="resume-project">
                        <div class="item-primary">
                            <a href="javascript:;" data-url="/geek/getGeekProjectExperienceForm.json" ka="user-resume-add-project" class="link-add"  >
                                <i class="iboss-tianjia"></i><span>添加</span>
                            </a>
                            <h3 class="title">项目经历</h3>
                            <ul class="history-project">
                                
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 教育经历 -->
                    <div class="resume-item" id="resume-education">
                        <div class="item-primary">
                            <a href="javascript:;" data-url="/geek/getEduExperienceForm.json" ka="user-resume-add-eduexp" class="link-add"  >
                                <i class="iboss-tianjia"></i><span>添加</span>
                            </a>
                            <h3 class="title">教育经历</h3>
                            <ul class="history-project">
                                
                                    
                                        <li id="row-1ff231c4536311ac1nd-3t24GFE-" ka="user-resume-edit-eduexp1">
                                            <div class="item-name">
                                                <h4 class="name">陕西理工大学</h4>
                                                <span class="period">2018-2019</span>
                                            </div>
                                            <h4>网络工程<em class="vline"></em><b>本科</b></h4>
                                            
                                                <div class="text">积极参加学校各项比赛<br/>四级已经考过</div>
                                            
                                            <div class="op">
                                                <a href="javascript:;" data-url="/geek/delEduExperience.json?id=1ff231c4536311ac1nd-3t24GFE~" class="link-delete" style="display: none" ka="user-resume-del-eduexp1">
                                                    <i class="iboss-delete"></i><span>删除</span>
                                                </a>
                                                <a href="javascript:;" data-url="/geek/getEduExperienceForm.json?id=1ff231c4536311ac1nd-3t24GFE~" class="link-edit" ka="user-resume-edit-eduexp1">
                                                    <i class="iboss-edit"></i><span>编辑</span>
                                                </a>
                                            </div>
                                        </li>
                                    
                                
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 社交主页 -->
                    <div class="resume-item" id="resume-social">
                        <div class="item-primary">
                            <a href="javascript:;" data-url="/geek/getSocialContact.json" ka="user-resume-add-website" class="link-add" >
                                <i class="iboss-tianjia"></i><span>添加</span>
                            </a>
                            <h3 class="title">社交主页</h3>
                            <ul class="social-account">
                                
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                    <!-- 志愿者经历 -->
                    <div class="resume-item" id="resume-volunteer">
                        <div class="item-primary">
                            <a href="javascript:;" data-url="/geek/getGeekVolunteerExperienceForm.json" ka="" class="link-add"  >
                                <i class="iboss-tianjia"></i><span>添加</span>
                            </a>
                            <h3 class="title">志愿服务经历</h3>
                            <ul class="history-project">
                                
                            </ul>
                        </div>
                        <div class="item-form"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://static.zhipin.com/zhipin/v151/web/geek/js/main.js"></script>
</body>
<input type="hidden" id="page_key_name" value="cpc_user_resume" />
</html>
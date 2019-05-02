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
	width: 70px; /* 宽度 */
	height: 25px; /* 高度 */
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
		url: "/rcw/position/findPosition.action",
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
function publish(publish){
	$.ajax({
		async : false,
		url: "/rcw/position/findPosition.action",
		data:{"publish":publish},
		type:"GET",
		success:function(msg){
		},
		error:function(msg){
			alert("系统异常！");
		}
	});
}
function cancel(id){
	$.ajax({
		async : false,
		url: "/rcw/position/deletePosition.action",
		data:{"id":id},
		type:"GET",
		success:function(msg){
			if(msg.status == 200){
				alert("取消发布成功");
			}
			else
				alert(msg.message);
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
					<li class="cur"><a class="header-home"
						href="">&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职位管理</a></li>
					<li class=""><a class="header-job"
						href="company_talent.jsp">牛人</a></li>
					<li class=""><a class="header_brand"
						href="info.jsp">我的资料</a></li>
					<li class=""><a class="header-article"
						href="https://news.zhipin.com/">资讯</a></li>
				</ul>
			</div>
        <div class="user-nav">
                <!--未登录-->
                <div class="btns" vertical-align="middle" >
                    <input style="display: none;" id="userId" value="${user.id}">
                    <a href="" ka="header-register" id="login" class="btn btn-outline">${user.userName }<div id="isLogin"></div></a>
                    <a href="" ka="header-login" onclick="return logOut();" id="login1" class="btn btn-outline">退出<div id="isLogin1"></div></a>
                    <a href="add_position.jsp" ka="header-login" id="login1" class="btn btn-outline">发布职位<div id="isLogin1"></div></a>
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
								<span class="label-text"><b>职位名称</b><i
									class="icon-arrow-down"></i></span>
							</div>
							<p class="ipt-wrap">
								<input type="text" name="query" class="ipt-search"
									maxlength="50" autocomplete="off" placeholder="搜索发布职位">
							</p>
						</div>
						<input type="hidden" name="city" class="city-code"
							value="101110100" /> <input type="hidden" name="industry"
							class="industry-code" value="" /> <input type="hidden"
							name="position" class="position-code" value="" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="button1">搜索</button>
						<div class="suggest-result">
							<ul>
							</ul>
						</div>
						<div class="position-box">
							<div class="dropdown-menu">
								<div class="select-tree" data-level="3"></div>
							</div>
						</div>
					</form>
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
                    
                    <span class="dropdown-select">
                        <div type="text" ka="sel-exp" class="ipt"><a href="company.jsp">全部职位</a></div>
                    </span>
                </div>
                <div class="dropdown-wrap">
                    
                    <span class="dropdown-select">
                            <div type="text" ka="sel-degree" class="ipt"><a href="" onclick="return publish(1);">已发布</a>
                            </div>
                    </span>
                </div>
                <div class="dropdown-wrap">
                    
                    <span class="dropdown-select">
                            <div type="text" ka="sel-salary" class="ipt"><a href="" onclick="return publish(2);">待审核</a>
                            </div>
                    </span>
                </div>
                <div class="dropdown-wrap">
                    
                    <span class="dropdown-select">
                            <div type="text" ka="sel-salary" class="ipt"><a href="" onclick="return publish(0);">未通过</a>
                            </div>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div id="main" class="inner home-inner">
        <div class="job-box">
        <!-- 广告 -->
            <div class="sider">


                <div class="promotion-img nomargin"><a href="/activity/personality/index.html" target="_blank" ka="ad_banner_0"><img src="https://z.zhipin.com/web/upload/market/coop/20180421-03.jpg" alt="" /></a></div>
                <div class="promotion-img"><a href="/app.html" target="_blank" ka="ad_banner_1"><img src="https://static.zhipin.com/zhipin/v151/web/geek/images/pro-1.png" alt="" /></a></div>
                <div class="promotion-img"><a href="/user/login.html?initType=3" target="_blank" ka="ad_banner_2"><img src="https://static.zhipin.com/zhipin/v151/web/geek/images/pro-2.png" alt="" /></a></div>
            </div>
            <div class="job-list">
                    <div class="company-list">
                    </div>
                    <ul>
                    	<c:forEach items="${positionList }" var="position">
                            <li>
                                <div class="job-primary">
                                    <div class="info-primary">
                                        <h3 class="name">
                                                <div class="job-title">${position.position }</div>
                                                <span class="red">${position.salaryLow }-${position.salaryHigh }</span>
                                                <div class="info-detail"></div>
                                            </a>
                                        </h3>
                                        <p>工作年限：${position.jobAge }<em class="vline"></em>学历：${position.degree }</p>
                                    </div>
                                    <div class="info-publis" style="display: block">
                                        <button class="button2">编辑</button>
                                        <p><button class="button2" onclick="cancel(${position.id})">取消发布</button></p>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                         </ul>
        </div>
            </div>
        </div>
    </div>
<script src="../../js/main.js"></script>
<input type="hidden" id="page_key_name" value="cpc_job_list" />
</body>
</html>

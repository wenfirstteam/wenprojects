<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <link href="../../css/bootstrap.min1.css" rel="stylesheet"> 
<link href="../../css/index.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
<title>汉中人才网-资讯</title>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../../js/find.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
			async : false,
			url:"/rcw/news/findNews.action", 
			type:"Get",
			data:{},
			success : function(msg) {
			}
	});
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
function findNews(id){
	$.ajax({
		async : false,
		url:"/rcw/news/findNews.action", 
		type:"Get",
		data:{"id":id},
		success : function(msg) {
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
						<li class=""><a class="header-job" href="">职位</a></li>
						<li class=""><a class="header_brand" href="find_company.jsp" onclick="findCompany()">公司</a></li>
						<li class="cur"><a class="header-article"
						 href="zixun.jsp" onclick="findNews()">资讯</a></li>
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
			<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<br><br><br>
					<div class="col-md-10 column" style="box-shadow:5px 5px 20px;width:1050px"> 
						<table class="table" id="adminNews">
							<caption></caption>
							<thead>
								<tr class="info">
									<th style="text-align: center">资讯图片</th>
									<th style="text-align: center">资讯标题</th>
									<th style="text-align: center">资讯内容</th>
									<th style="text-align: center">创建时间</th>
								</tr>
								<c:forEach items="${newsList }" var="news">
								<tr>
									<td style="text-align: center"><img src="/icon/${news.pic }" width="30" height="30"/>&nbsp;&nbsp;</td>
										
									<td style="text-align: center"><a href="scan_news.jsp" onclick="findNews(${news.id })" target="_blank"><font color="black">${news.title }</font></a></td>
									<td style="text-align: center">${news.content }</td>
									<td style="text-align: center">${news.createTime }</td>
								</tr>
								</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
		</div>
</body>
</html>
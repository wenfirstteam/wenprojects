<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
     <link href="../../css/bootstrap.min1.css" rel="stylesheet"> 
    <link href="../../css/index.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
     <title>汉中人才网-管理员端</title>
     <script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
     <script type="text/javascript" src="../../js/find.js"></script>
     <style>
       body{
           padding-top:10px;
       }
       .socials {
           padding: 30px;
       }
       .button1 { /* 按钮美化 */
	width: 90px; /* 宽度 */
	height: 35px; /* 高度 */
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
</head>
	<style type="text/css">
	.STYLE5 {
	font-size: large;
	font-weight: bold;
}
</style>
	<style type="text/css">
	.STYLE5 {
	font-size: large;
	font-weight: bold;
}
</style>
<script type="text/javascript">
function findNews(){
		$.ajax({
			async : false,
			url:"/rcw/news/findNews.action", 
			type:"Get",
			data:{},
			success : function(msg) {
			}
		});
	}
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
<body>
<br><br>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-10 column" style="box-shadow:5px 5px 20px;width:1050px"> 
						<table class="" id="adminNews" valign="middle" width=1050px">
							<caption></caption>
							<thead>
								<tr>
									<td style="text-align: center"><img src="/icon/${newsList[0].pic }" width="70" height="70"/>&nbsp;&nbsp;</td>
									<td style="text-align: center"><h3><a href="">${newsList[0].title }</h3></a></td>
									<td style="text-align: center">${newsList[0].createTime }</td>
								</tr>
						</table><br><br>
								<tr><td style="text-align: center"${newsList[0].content }</td></tr>
								<br><br>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
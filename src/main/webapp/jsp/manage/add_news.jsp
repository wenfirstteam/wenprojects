<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>汉中人才网-添加新闻</title>
<link href="../../css/bootstrap.min1.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="//common-bucket.zhaopin.cn/passport/favicon.ico"  media="screen"/>
<link href="../../css/index.css" rel="stylesheet" type="text/css">
<style>
body {
	padding-top: 10px;
}

.socials {
	padding: 30px;
}
</style>
</head>
<script type="text/javascript" charset="utf-8"
	src="/rcw/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	var pic = "";
	function fileBtn() {
		document.getElementById('pic').click();
	}

	function upload(file) {
		let img = document.getElementById('img');
		let formData = new FormData();
		let temp = file.files[0];
		if (temp) {
			formData.append('file', temp);
			img.src = window.URL.createObjectURL(temp);
			$.ajax({
				url : "/rcw/upload/upload.action",
				type : "POST",
				data : formData,
				processData : false, // 告诉jQuery不要去处理发送的数据
				contentType : false, // 告诉jQuery不要去设置Content-Type请求头
				success : function(result) {
					pic = result.data;
				}
			});
		}
	}
	function findNews(){
		$.ajax({
			async : false,
			url:"/rcw/news/findNews.action", 
			type:"Get",
			data:{},
			success : function(msg) {
				window.location.href = "";
			}
		});
	}
	function logOut() {
		$.ajax({
			async : false,
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
	function save() {
		var $title = $("#title").val();
		var $content = ed.getData();
		if (title == "") {
			alert("新闻标题不能为空！");
			return false;
		}
		if ($content == "") {
			alert("新闻内容不能为空！");
			return false;
		}
		if (pic == "") {
			alert("新闻图片不能为空！");
			return false;
		}
		$.ajax({
			async : false,
			url : "/rcw/news/addNews.action",
			type : "POST",
			data : {
				"pic" : pic,
				"title" : $title,
				"content" : $content,
				"flag":1
			},
			success : function(msg) {
				if (msg.status == 200) {
					alert("添加成功！");
					setTimeout(function() {
						findNews();
						window.location.href = "news.jsp";
					}, 1);
					return true;
				} else {
					alert(msg.message);
					return false;
				}
			},
			error : function(data) {
				alert("系统异常!");
				return false;
			}
		});
	}
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
</script>
<body>
	<div id="header">
		<div class="inner home-inner">
			<div class="logo">
				<font size="6" face="微软雅黑" color="#00d7c6"><B>汉中人才网</B></font>
			</div>
			<div class="nav">
				<ul>
					<li class=""><a class="header-home" href="manager.jsp"
						onclick="findWaitInfo();">&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职位审核</a></li>
					<li class="cur"><a class="header-job" href="news.jsp"
						onclick="findNews()">新闻管理</a></li>
					<li class=""><a class="header_brand" href="add_manage.jsp">添加管理员</a></li>
				</ul>
			</div>
			<div class="user-nav">
				<!--未登录-->
				<div class="btns" vertical-align="middle">
					<input style="display: none;" id="userId" value="${user.id}">
					<a href="" ka="header-register" id="login" class="btn btn-outline">${user.userName }<div
							id="isLogin"></div></a> <a href="" ka="header-login"
						onclick="return logOut();" id="login1" class="btn btn-outline">退出
						<div id="isLogin1"></div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div id="form">
			<table border="1px" width="995px" align="center" cellpadding="0px"
				cellspacing="0px">
				<tr height="50px">
					<td colspan="2" align="center">添加资讯</td>&nbsp;&nbsp;
					<td><input type="hidden" name="id" id="id"></td>
				</tr>
				<tr height="50px">
					<td align="center">新闻图片</td>
					<td><input type="file" name="pic" id="pic" onchange="upload(this)"></td>
					<button class="button2"" style="display: none"  onclick="fileBtn();">上传</button>
					<img src="" id="img"
						style="width: 100px; height: 100px; display: none">
				</tr>
				<tr height="50px">
					<td align="center">标题</td>
					<td><input type="text" name="title" id="title" /></td>

				</tr>
				<tr height="200px">
					<td align="center">资讯内容</td>
					<!--文本框 -->
					<td><textarea rows="50" cols="50" name="content" id="content"></textarea>
						<script type="text/javascript" >var ed=CKEDITOR.replace("content");</script>
					</td>

				</tr>

				<tr height="50px">
					<td align="center">操作</td>
					<td>&nbsp;&nbsp;&nbsp;<input type="submit" value="确认"
						onclick="return save();">&nbsp;&nbsp;&nbsp; <a
						href="news.jsp"><input type="button" value="返回"
							onclick=""></a></td>
					<td><input type="hidden" name="forward" value="modify"></td>
				</tr>
			</table>
	</div>
	<br>
	<br>
</body>
</html>

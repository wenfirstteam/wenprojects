<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>汉中人才网-发布职位</title>
<link href="../../css/resume.css" rel="stylesheet" type="text/css" />
<link href="../../css/index.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" type="image/x-icon"
	href="//common-bucket.zhaopin.cn/passport/favicon.ico" media="screen" />
<style type="text/css">
.ipt1 {
	width: 135px;
	padding-left: 13px;
	padding-right: 13px
    -webkit-transition: all linear .2s;
    transition: all linear .2s;
	color: ;	
	-webkit-appearance: none;
    padding: 6px 12px 5px 7px;
    min-height: 22px;
    line-height: 22px;
    border: 1px solid #e3e7ed;
    font-size: 13px;
    vertical-align: middle;
}
.button1 { /* 按钮美化 */
	width: 90px; /* 宽度 */
	height: 30px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: white; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: #1E90FF; /* 字体颜色 */
	font-size: 15px; /* 字体大小 */
}
.button2 { /* 按钮美化 */
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
<script type="text/javascript">
</script>
</head>
<body class="page-single">
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
			<div class="user-nav">
				<div vertical-align="middle">
					<font size="3" color="white"></font>
				</div>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="container">
		  <div class="profile-progress">
                <h2>开启高效的招聘方式，只需<span class="step-num">2</span>步：</h2>
                <ul>
                    <li class="active">
                        <div class="circle">1</div>
                        <p>发布职位</p>
                    </li>
                    <li class="step-last">
                        <div class="circle">2</div>
                        <p>管理员审核</p>
                    </li>
                </ul>
            </div>
			<div class="profile-manage">
				<div class="form-row">
					<div class="t">
						<em>*</em>职位名称：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="position_name" type="text"
							name="position_name" placeholder="输入职位名称" class="ipt required"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">工作性质：</div>
					<div class="c">
						<span class="ipt-wrap"> <select
							class="ipt required" name="job_nature">
								<option value="store">全职</option>
								<option value="customer">兼职</option>
								<option value="customer">实习</option>
						</select></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">工作年限：</div>
					<div class="c">
						<span class="ipt-wrap"> <select
							class="ipt required" name="job_age">
								<option value="store">应届毕业生</option>
								<option value="customer">1~3年</option>
								<option value="customer">3~5年</option>
								<option value="customer">5~10年</option>
								<option value="customer">10年以上</option>
						</select></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：</div>
					<div class="c">
						<span class="ipt-wrap"> <select
							class="ipt required" name="type" placeholder="qin">
								<option value="store">初中及以下</option>
								<option value="customer">中专/中技</option>
								<option value="customer">高中</option>
								<option value="customer">大专</option>
								<option value="customer">本科</option>
								<option value="customer">硕士</option>
								<option value="customer">博士</option>
						</select></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">
						<em>*</em>薪资范围：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="salary_low" type="text"
							name="salary_low" placeholder="最低" class="ipt1">&nbsp;&nbsp;~</span>&nbsp;&nbsp;
							<input id="salary_high" type="text"
							name="salary_high" placeholder="最高" class="ipt1">
					</div>
				</div>
				<div class="form-row">
					<div class="t">
						<em>*</em>招聘人数：
					</div>
					<div class="c">
						<span class="ipt-wrap"><input id="number" type="text"
							name="number" placeholder="人数 （如 1~3或者3）" class="ipt required"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">技能要求：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6" id="skills_required"
								name="skills_required" placeholder="支持此职位需要的技能（最多250字）"
								class="ipt required"></textarea></span>
					</div>
				</div>
				<div class="form-row">
					<div class="t">职位描述：</div>
					<div class="c">
						<span class="ipt-wrap"><textarea rows="6" id="job_description"
								name="job_description" placeholder="对此职位的简单描述（最多250字）"
								class="ipt required"></textarea></span>
					</div>
				</div>
				<div class="btns" align="right">
					<button id="add" class="button2" onclick="">提交</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div class="side-tip">
					<img
						src="../../pic/edit.png" />
					<p>发布职位，迅速招揽顶尖人才</p>
				</div>
			</div>
			<div class="form-row form-footer"></div>

		</div>
		<!--更换公司-->
	</div>
	</div>
	<input type="hidden" id="page_key_name" value="bpc_complete_base_noapp" />
</body>
</html>

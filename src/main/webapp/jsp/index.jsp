<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>汉中人才网</title>
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
				document.getElementById("isLogin").innerHTML = msg.data.userName;
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
function find(position) {
	$.ajax({
		async : false,
		url : "/rcw/position/findPositionFormUser.action",
		data : {
			"position" : position
		},
		type : "GET",
		success : function(msg) {
			if(msg.status != 200)
			{
				alert("查询出现错误，请刷新网页重试！");
			}else
				setTimeout(function() {
					window.location.href = "find/position.jsp";
				}, 1);
		},
		error : function(msg) {
			alert("系统异常！");
		}
	});
}
function findName() {
	var $position = $("#position").val();
	$.ajax({
		async : false,
		url : "/rcw/position/findPositionFormUser.action",
		data : {
			"position" : $position
		},
		type : "GET",
		success : function(msg) {
			if(msg.status != 200)
			{
				alert("查询出现错误，请刷新网页重试！");
			}else
				setTimeout(function() {
					window.location.href = "find/position.jsp";
				}, 1);
		},
		error : function(msg) {
			alert("系统异常！");
		}
	});
}
</script>
</head>
<body>
	<!--<img src="images/homg-demo-bg.jpg" style="display: block; display: none; position: absolute; z-index: 9999; top:49px; opacity: 0.8; left: 50%; transform: translateX(-50%)" alt="">-->
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
					<li class="cur"><a class="header-home"
						href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></li>
					<li class=""><a class="header-job"
						href="find/position.jsp">职位</a></li>
					<li class=""><a class="header_brand"
						href="find/find_company.jsp">公司</a></li>
					<li class=""><a class="header-article"
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
                </div></div>
        </div>
	</div>
	<!-- 搜索 -->
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
									<span class="label-text"><b>职位类型</b><i
										class="icon-arrow-down"></i></span>
								</div>
								<p class="ipt-wrap">
									<input type="text" name="query" class="ipt-search"
										maxlength="50" placeholder="搜索职位"
										id="position">
								</p>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="button1" onclick="findName()">搜索</button>
							<div class="suggest-result">
								<ul>
								</ul>
							</div>
							<div class="position-box">
								<div class="dropdown-menu">
									<div class="select-tree" data-level="3"></div>
								</div>
							</div>
					</div>
				<br>
				<div class="search-hot">
					<font face="微软雅黑" color="#000000"><B>热门职位:</B></font> <a
						href="javascript:find('Java');"
						class="hot-position-1"><font face="微软雅黑" color="#efffee">Java</font></a>
					<a href="javascript:find('PHP');"
						class="hot-position-2"><font face="微软雅黑" color="#efffee">PHP</font></a>
					<a href="javascript:find('C++');"
						class="hot-position-3"><font face="微软雅黑" color="#efffee">C++</font></a>
					<a href="javascript:find('web前端');"
						class="hot-position-4"><font face="微软雅黑" color="#efffee">web前端</font></a>
					<a href="javascript:find('iOS');"
						class="hot-position-5"><font face="微软雅黑" color="#efffee">iOS</a></font>
					<a href="javascript:find('Android');"
						class="hot-position-6"><font face="微软雅黑" color="#efffee">Android</font></a>
					<a href="javascript:find('产品经理');"
						class="hot-position-7"><font face="微软雅黑" color="#efffee">产品经理</font></a>
					<a href="javascript:find('UI设计师');"
						class="hot-position-8"><font face="微软雅黑" color="#efffee">UI设计师</font></a>
					<a href="javascript:find('产品运营');"
						class="hot-position-9"><font face="微软雅黑" color="#efffee">产品运营</font></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 搜索 end -->

	<!--主体main-->
	<div id="main" class="inner home-inner">
		<div class="home-box">
			<div class="home-sider">
				<!-- 左侧职位选择 -->
				<div class="job-menu">
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>技术</b> <a
								href="javascript:find('Java');">Java</a> <a
								href="javascript:find('PHP');">PHP</a> <a
								href="javascript:find('web前端');">web前端</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">技术</p>
							<ul>
								<li>
									<h4>后端开发</h4>
									<div class="text">
										<a class="search_100199" href="javascript:find('后端开发');">后端开发</a>
										<a class="search_100101" href="javascript:find('Java');">Java</a>
										<a class="search_100102" href="javascript:find('C++');">C++</a> <a
											class="search_100103" href="javascript:find('PHP');">PHP</a> <a
											class="search_100104" href="javascript:find('数据挖掘');" class="cur">数据挖掘</a>
										<a class="search_100105" href="javascript:find('C');">C</a> <a
											class="search_100106" href="javascript:find('C#');">C#</a> <a
											class="search_100107" href="javascript:find('.NET');">.NET</a> <a
											class="search_100108" href="javascript:find('Hadoop');">Hadoop</a>
										<a class="search_100109" href="javascript:find('Python');">Python</a>
										<a class="search_100110" href="javascript:find('Delphi');">Delphi</a>
										<a class="search_100111" href="javascript:find('VB');">VB</a> <a
											class="search_100112" href="javascript:find('Perl');">Perl</a> <a
											class="search_100113" href="javascript:find('Ruby');">Ruby</a> <a
											class="search_100114" href="javascript:find('Node.js');">Node.js</a>
										<a class="search_100115" href="javascript:find('搜索算法');">搜索算法</a>
										<a class="search_100116" href="javascript:find('Golang');">Golang</a>
										<a class="search_100117" href="javascript:find('自然语言处理');">自然语言处理</a>
										<a class="search_100118" href="javascript:find('推荐算法');">推荐算法</a>
										<a class="search_100119" href="javascript:find('Erlang');">Erlang</a>
										<a class="search_100120" href="javascript:find('算法工程师');"
											class="cur">算法工程师</a>
										<a class="search_100121"
											href="javascript:find('视频开发');">视频开发</a>
										<a class="search_100121"
											href="javascript:find('图形开发');">图形开发</a>
										<a class="search_100122" href="javascript:find('数据采集');">数据采集</a>
									</div>
								</li>
								<li>
									<h4>移动开发</h4>
									<div class="text">
										<a class="search_100299" href="javascript:find('移动开发');">移动开发</a>
										<a class="search_100201" href="javascript:find('HTML5');">HTML5</a>
										<a class="search_100202" href="javascript:find('Android');">Android</a>
										<a class="search_100203" href="javascript:find('iOS');"
											class="cur">iOS</a> <a class="search_100204"
											href="javascript:find('WP');">WP</a> <a class="search_100205"
											href="javascript:find('移动web前端');">移动web前端</a> <a
											class="search_100206" href="javascript:find('Flash');">Flash</a> <a
											class="search_100208" href="javascript:find('JavaScript');">JavaScript</a>
										<a class="search_100209" href="javascript:find('U3D');">U3D</a> <a
											class="search_100210" href="javascript:find('COCOS2DX');">COCOS2DX</a>
									</div>
								</li>
								<li>
									<h4>测试</h4>
									<div class="text">
										<a class="search_100301" href="javascript:find('测试工程师');">测试工程师</a>
										<a class="search_100302" href="javascript:find('自动化测试');">自动化测试</a>
										<a class="search_100303" href="javascript:find('功能测试');">功能测试</a>
										<a class="search_100304" href="javascript:find('性能测试');"
											class="cur">性能测试</a> <a class="search_100305"
											href="javascript:find('测试开发');">测试开发</a> <a class="search_100306"
											href="javascript:find('移动端测试');">移动端测试</a> <a
											class="search_100307" href="javascript:find('游戏测试');">游戏测试</a> <a
											class="search_100308" href="javascript:find('硬件测试');">硬件测试</a> <a
											class="search_100309" href="javascript:find('软件测试');">软件测试</a>
									</div>
								</li>
								<li>
									<h4>运维/技术支持</h4>
									<div class="text">
										<a class="search_100401" href="javascript:find('运维工程师');">运维工程师</a>
										<a class="search_100402" href="javascript:find('运维开发工程师');">运维开发工程师</a>
										<a class="search_100403" href="javascript:find('网络工程师');">网络工程师</a>
										<a class="search_100404" href="javascript:find('系统工程师');">系统工程师</a>
										<a class="search_100405" href="javascript:find('IT技术支持');">IT技术支持</a>
										<a class="search_100406" href="javascript:find('系统管理员');">系统管理员</a>
										<a class="search_100407" href="javascript:find('网络安全');">网络安全</a>
										<a class="search_100408" href="javascript:find('系统安全');">系统安全</a>
										<a class="search_100409" href="javascript:find('DBA');">DBA</a>
									</div>
								</li>
								<li>
									<h4>数据</h4>
									<div class="text">
										<a class="search_100599" href="javascript:find('数据');">数据</a> <a
											class="search_100506" href="javascript:find('ETL工程师');">ETL工程师</a>
										<a class="search_100507" href="javascript:find('数据仓库');">数据仓库</a>
										<a class="search_100508" href="javascript:find('数据开发');">数据开发</a>
										<a class="search_100509" href="javascript:find('数据挖掘');"
											class="cur">数据挖掘</a> <a class="search_100511"
											href="javascript:find('数据分析师');">数据分析师</a> <a
											class="search_100512" href="javascript:find('数据架构师');">数据架构师</a> <a
											class="search_100513" href="javascript:find('算法研究员');">算法研究员</a>
									</div>
								</li>
								<li>
									<h4>项目管理</h4>
									<div class="text">
										<a class="search_100601" href="javascript:find('项目经理');">项目经理</a>
										<a class="search_100602" href="javascript:find('项目主管');">项目主管</a>
										<a class="search_100603" href="javascript:find('项目助理');">项目助理</a>
										<a class="search_100604" href="javascript:find('项目专员');">项目专员</a>
										<a class="search_100605" href="javascript:find('实施顾问');">实施顾问</a>
										<a class="search_100606" href="javascript:find('实施工程师');">实施工程师</a>
										<a class="search_100607" href="javascript:find('需求分析工程师');">需求分析工程师</a>
									</div>
								</li>
								<li>
									<h4>硬件开发</h4>
									<div class="text">
										<a class="search_100801" href="javascript:find('硬件');">硬件</a> <a
											class="search_100802" href="javascript:find('嵌入式');">嵌入式</a> <a
											class="search_100803" href="javascript:find('自动化');">自动化</a> <a
											class="search_100804" href="javascript:find('单片机');">单片机</a> <a
											class="search_100805" href="javascript:find('电路设计');">电路设计</a> <a
											class="search_100806" href="javascript:find('驱动开发');">驱动开发</a> <a
											class="search_100807" href="javascript:find('系统集成');">系统集成</a> <a
											class="search_100808" href="javascript:find('FPGA开发');">FPGA开发</a>
										<a class="search_100809" href="javascript:find('DSP开发');"
											class="cur">DSP开发</a> <a class="search_100810"
											href="javascript:find('ARM开发');">ARM开发</a> <a
											class="search_100811" href="javascript:find('PCB工艺');">PCB工艺</a> <a
											class="search_100812" href="javascript:find('模具设计');">模具设计</a> <a
											class="search_100813" href="javascript:find('热传导');">热传导</a> <a
											class="search_100814" href="javascript:find('材料工程师');">材料工程师</a> <a
											class="search_100815" href="javascript:find('精益工程师');">精益工程师</a> <a
											class="search_100816" href="javascript:find('射频工程师');">射频工程师</a>
									</div>
								</li>
								<li>
									<h4>前端开发</h4>
									<div class="text">
										<a class="search_100999" href="javascript:find('前端开发');">前端开发</a>
										<a class="search_100901" href="javascript:find('web前端');">web前端</a>
										<a class="search_100902" href="javascript:find('Javascript');">Javascript</a>
										<a class="search_100903" href="javascript:find('Flash');">Flash</a>
										<a class="search_100904" href="javascript:find('HTML5');">HTML5</a>
									</div>
								</li>
								<li>
									<h4>通信</h4>
									<div class="text">
										<a class="search_101001" href="javascript:find('通信技术工程师');">通信技术工程师</a>
										<a class="search_101002" href="javascript:find('通信研发工程师');">通信研发工程师</a>
										<a class="search_101003" href="javascript:find('数据通信工程师');"
											class="cur">数据通信工程师</a> <a class="search_101004"
											href="javascript:find('移动通信工程师');">移动通信工程师</a> <a
											class="search_101005" href="javascript:find('电信网络工程师');">电信网络工程师</a>
										<a class="search_101006" href="javascript:find('电信交换工程师');">电信交换工程师</a>
										<a class="search_101007" href="javascript:find('有线传输工程师');">有线传输工程师</a>
										<a class="search_101008" href="javascript:find('无线射频工程师');">无线射频工程师</a>
										<a class="search_101009" href="javascript:find('通信电源工程师');">通信电源工程师</a>
										<a class="search_101010" href="javascript:find('通信标准化工程师');">通信标准化工程师</a>
										<a class="search_101011" href="javascript:find('通信项目专员');">通信项目专员</a>
										<a class="search_101012" href="javascript:find('通信项目经理');">通信项目经理</a>
										<a class="search_101013" href="javascript:find('核心网工程师');">核心网工程师</a>
										<a class="search_101014" href="javascript:find('通信测试工程师');">通信测试工程师</a>
										<a class="search_101015" href="javascript:find('通信设备工程师');">通信设备工程师</a>
										<a class="search_101016" href="javascript:find('光通信工程师');">光通信工程师</a>
										<a class="search_101017" href="javascript:find('光传输工程师');">光传输工程师</a>
										<a class="search_101018" href="javascript:find('光网络工程师');">光网络工程师</a>
									</div>
								</li>
								<li>
									<h4>电子/半导体</h4>
									<div class="text">
										<a class="search_101401" href="javascript:find('电子工程师');">电子工程师</a>
										<a class="search_101402" href="javascript:find('电气工程师');"
											class="cur">电气工程师</a> <a class="search_101403"
											href="javascript:find('FAE');">FAE</a> <a class="search_101404"
											href="javascript:find('电气设计工程师');">电气设计工程师</a>
									</div>
								</li>
								<li>
									<h4>高端技术职位</h4>
									<div class="text">
										<a class="search_100799" href="javascript:find('高端技术职位');">高端技术职位</a>
										<a class="search_100701" href="javascript:find('技术经理');">技术经理</a>
										<a class="search_100702" href="javascript:find('技术总监');">技术总监</a>
										<a class="search_100703" href="javascript:find('测试经理');">测试经理</a>
										<a class="search_100704" href="javascript:find('架构师');">架构师</a> <a
											class="search_100705" href="javascript:find('CTO');">CTO</a> <a
											class="search_100706" href="javascript:find('运维总监');">运维总监</a> <a
											class="search_100707" href="javascript:find('技术合伙人');">技术合伙人</a>
									</div>
								</li>
								<li>
									<h4>人工智能</h4>
									<div class="text">
										<a class="search_101399" href="javascript:find('人工智能');">人工智能</a>
										<a class="search_101301" href="javascript:find('机器学习');">机器学习</a>
										<a class="search_101302" href="javascript:find('深度学习');">深度学习</a>
										<a class="search_101303" href="javascript:find('图像算法');">图像算法</a>
										<a class="search_101304" href="javascript:find('图像处理');">图像处理</a>
										<a class="search_101305" href="javascript:find('语音识别');"
											class="cur">语音识别</a> <a class="search_101306"
											href="javascript:find('图像识别');">图像识别</a> <a class="search_101307"
											href="javascript:find('算法研究员');">算法研究员</a>
									</div>
								</li>
								<li>
									<h4>软件销售支持</h4>
									<div class="text">
										<a class="search_101299" href="javascript:find('软件销售支持');">软件销售支持</a>
										<a class="search_101201" href="javascript:find('售前工程师');">售前工程师</a>
										<a class="search_101202" href="javascript:find('售后工程师');">售后工程师</a>
									</div>
								</li>
								<li>
									<h4>其他技术职位</h4>
									<div class="text">
										<a class="search_101101" href="javascript:find('技术');">其他技术职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>产品</b> <a
								href="javascript:find('产品经理');">产品经理</a> <a
								href="javascript:find('产品总监');">产品总监</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">产品</p>
							<ul>
								<li>
									<h4>产品经理</h4>
									<div class="text">
										<a class="search_110101" href="javascript:find('产品经理');">产品经理</a>
										<a class="search_110102" href="javascript:find('网页产品经理');">网页产品经理</a>
										<a class="search_110103" href="javascript:find('移动产品经理');"
											class="cur">移动产品经理</a> <a class="search_110104"
											href="javascript:find('产品助理');">产品助理</a> <a class="search_110105"
											href="javascript:find('数据产品经理');">数据产品经理</a> <a
											class="search_110106" href="javascript:find('电商产品经理');">电商产品经理</a>
										<a class="search_110107" href="javascript:find('游戏策划');">游戏策划</a>
										<a class="search_110108" href="javascript:find('产品专员');">产品专员</a>
									</div>
								</li>
								<li>
									<h4>高端产品职位</h4>
									<div class="text">
										<a class="search_110399" href="javascript:find('高端产品职位');">高端产品职位</a>
										<a class="search_110302" href="javascript:find('产品总监');">产品总监</a>
										<a class="search_110303" href="javascript:find('游戏制作人');"
											class="cur">游戏制作人</a> <a class="search_110304"
											href="javascript:find('产品VP');">产品VP</a>
									</div>
								</li>
								<li>
									<h4>其他产品职位</h4>
									<div class="text">
										<a class="search_110401" href="javascript:find('产品');">其他产品职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>设计</b> <a
								href="javascript:find('UI设计师');">UI设计师</a> <a
								href="javascript:find('平面设计师');">平面设计师</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">设计</p>
							<ul>
								<li>
									<h4>视觉设计</h4>
									<div class="text">
										<a class="search_120199" href="javascript:find('视觉设计');">视觉设计</a>
										<a class="search_120101" href="javascript:find('视觉设计师');">视觉设计师</a>
										<a class="search_120102" href="javascript:find('网页设计师');">网页设计师</a>
										<a class="search_120103" href="javascript:find('Flash设计师');">Flash设计师</a>
										<a class="search_120104" href="javascript:find('APP设计师');">APP设计师</a>
										<a class="search_120105" href="javascript:find('UI设计师');">UI设计师</a>
										<a class="search_120106" href="javascript:find('平面设计师');">平面设计师</a>
										<a class="search_120107" href="javascript:find('美术设计师');">美术设计师</a>
										<a class="search_120108" href="javascript:find('广告设计师');"
											class="cur">广告设计师</a> <a class="search_120109"
											href="javascript:find('多媒体设计师');">多媒体设计师</a> <a
											class="search_120110" href="javascript:find('原画师');">原画师</a> <a
											class="search_120111" href="javascript:find('游戏特效');">游戏特效</a> <a
											class="search_120112" href="javascript:find('游戏界面设计师');">游戏界面设计师</a>
										<a class="search_120113" href="javascript:find('游戏场景');">游戏场景</a>
										<a class="search_120114" href="javascript:find('游戏角色');">游戏角色</a>
										<a class="search_120115" href="javascript:find('游戏动作');">游戏动作</a>
										<a class="search_120116" href="javascript:find('三维');">三维</a>
										<a class="search_120116" href="javascript:find('CAD');">CAD</a>
										<a class="search_120116" href="javascript:find('制图');">制图</a>
										<a class="search_120117" href="javascript:find('美工');"
											class="cur">美工</a> <a class="search_120118"
											href="javascript:find('包装设计');">包装设计</a> <a class="search_120119"
											href="javascript:find('设计师助理');">设计师助理</a> <a
											class="search_120120" href="javascript:find('动画设计师');">动画设计师</a> <a
											class="search_120121" href="javascript:find('插画师');">插画师</a>
									</div>
								</li>
								<li>
									<h4>交互设计</h4>
									<div class="text">
										<a class="search_120201" href="javascript:find('交互设计师');">交互设计师</a>
										<a class="search_120202" href="javascript:find('无线交互设计师');">无线交互设计师</a>
										<a class="search_120203" href="javascript:find('网页交互设计师');">网页交互设计师</a>
										<a class="search_120204" href="javascript:find('硬件交互设计师');">硬件交互设计师</a>
									</div>
								</li>
								<li>
									<h4>用户研究</h4>
									<div class="text">
										<a class="search_120301" href="javascript:find('数据分析师');">数据分析师</a>
										<a class="search_120302" href="javascript:find('用户研究员');">用户研究员</a>
										<a class="search_120303" href="javascript:find('游戏数值策划');">游戏数值策划</a>
										<a class="search_120304" href="javascript:find('UX设计师');"
											class="cur">UX设计师</a> <a class="search_120407"
											href="javascript:find('用户研究经理');">用户研究经理</a> <a
											class="search_120408" href="javascript:find('用户研究总监');">用户研究总监</a>
									</div>
								</li>
								<li>
									<h4>高端设计职位</h4>
									<div class="text">
										<a class="search_120499" href="javascript:find('高端设计职位');">高端设计职位</a>
										<a class="search_120401" href="javascript:find('设计经理');">设计经理/主管</a>
										<a class="search_120402" href="javascript:find('设计总监');">设计总监</a>
										<a class="search_120403" href="javascript:find('视觉设计经理');">视觉设计经理</a>
										<a class="search_120404" href="javascript:find('视觉设计总监');">视觉设计总监</a>
										<a class="search_120405" href="javascript:find('交互设计经理/主管');">交互设计经理/主管</a>
										<a class="search_120406" href="javascript:find('交互设计总监');">交互设计总监</a>
									</div>
								</li>
								<li>
									<h4>非视觉设计</h4>
									<div class="text">
										<a class="search_120699" href="javascript:find('非视觉设计');">非视觉设计</a>
										<a class="search_120601" href="javascript:find('服装设计');">服装设计</a>
										<a class="search_120602" href="javascript:find('工业设计');"
											class="cur">工业设计</a> <a class="search_120603"
											href="javascript:find('橱柜设计');">橱柜设计</a> <a class="search_120604"
											href="javascript:find('家具设计');">家具设计</a> <a class="search_120605"
											href="javascript:find('家居设计');">家居设计</a> <a class="search_120606"
											href="javascript:find('珠宝设计');">珠宝设计</a> <a class="search_120607"
											href="javascript:find('室内设计');">室内设计</a> <a class="search_120608"
											href="javascript:find('陈列设计');">陈列设计</a> <a class="search_120610"
											href="javascript:find('景观设计');">景观设计</a>
									</div>
								</li>
								<li>
									<h4>其他设计职位</h4>
									<div class="text">
										<a class="search_120501" href="javascript:find('设计');">其他设计职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>

					<dl class="all-box">
						<dd>
							<i class="icon-arrow-right"></i> <b>市场</b> <a
								href="javascript:find('市场营销');">市场营销</a> <a
								href="javascript:find('市场推广');">市场推广</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">市场</p>
							<ul>
								<li>
									<h4>市场/营销</h4>
									<div class="text">
										<a class="search_140114" href="javascript:find('选址开发');">选址开发</a>
										<a class="search_140101" href="javascript:find('市场营销');">市场营销</a>
										<a class="search_140102" href="javascript:find('市场策划');">市场策划</a>
										<a class="search_140103" href="javascript:find('市场顾问');">市场顾问</a>
										<a class="search_140104" href="javascript:find('市场推广');">市场推广</a>
										<a class="search_140105" href="javascript:find('SEO');">SEO</a> <a
											class="search_140106" href="javascript:find('SEM');">SEM</a> <a
											class="search_140107" href="javascript:find('商务渠道');">商务渠道</a> <a
											class="search_140108" href="javascript:find('商业数据分析');">商业数据分析</a>
										<a class="search_140109" href="javascript:find('活动策划');"
											class="cur">活动策划</a> <a class="search_140110"
											href="javascript:find('网络营销');">网络营销</a> <a class="search_140111"
											href="javascript:find('海外市场');">海外市场</a> <a class="search_140112"
											href="javascript:find('政府关系');">政府关系</a> <a class="search_140113"
											href="javascript:find('APP推广');">APP推广</a>
									</div>
								</li>
								<li>
									<h4>公关媒介</h4>
									<div class="text">
										<a class="search_140299" href="javascript:find('公关媒介');">公关媒介</a>
										<a class="search_140201" href="javascript:find('媒介经理');">媒介经理</a>
										<a class="search_140202" href="javascript:find('广告协调');">广告协调</a>
										<a class="search_140203" href="javascript:find('品牌公关');">品牌公关</a>
										<a class="search_140204" href="javascript:find('媒介专员');">媒介专员</a>
										<a class="search_140205" href="javascript:find('活动策划执行');">活动策划执行</a>
										<a class="search_140206" href="javascript:find('媒介策划');">媒介策划</a>
									</div>
								</li>
								<li>
									<h4>会务会展</h4>
									<div class="text">
										<a class="search_140599" href="javascript:find('会务会展');">会务会展</a>
										<a class="search_140501" href="javascript:find('会议活动销售');">会议活动销售</a>
										<a class="search_140502" href="javascript:find('会议活动策划');">会议活动策划</a>
										<a class="search_140503" href="javascript:find('会议活动执行');">会议活动执行</a>
										<a class="search_140504" href="javascript:find('会展活动销售');"
											class="cur">会展活动销售</a> <a class="search_140505"
											href="javascript:find('会展活动策划');">会展活动策划</a> <a
											class="search_140506" href="javascript:find('会展活动执行');">会展活动执行</a>
									</div>
								</li>
								<li>
									<h4>广告</h4>
									<div class="text">
										<a class="search_140699" href="javascript:find('广告');">广告</a> <a
											class="search_140601" href="javascript:find('广告创意');">广告创意</a> <a
											class="search_140602" href="javascript:find('美术指导');">美术指导</a> <a
											class="search_140603" href="javascript:find('广告设计师');">广告设计师</a> <a
											class="search_140604" href="javascript:find('策划经理');">策划经理</a> <a
											class="search_140605" href="javascript:find('文案');">文案</a> <a
											class="search_140607" href="javascript:find('广告制作');">广告制作</a> <a
											class="search_140608" href="javascript:find('媒介投放');">媒介投放</a> <a
											class="search_140609" href="javascript:find('>媒介合作');" class="cur">媒介合作</a>
										<a class="search_140610" href="javascript:find('媒介顾问');">媒介顾问</a>
										<a class="search_140611" href="javascript:find('广告审核');">广告审核</a>
									</div>
								</li>
								<li>
									<h4>高端市场职位</h4>
									<div class="text">
										<a class="search_140499" href="javascript:find('高端市场职位');">高端市场职位</a>
										<a class="search_140401" href="javascript:find('市场总监');">市场总监</a>
										<a class="search_140404" href="javascript:find('CMO');">CMO</a> <a
											class="search_140405" href="javascript:find('公关总监');">公关总监</a> <a
											class="search_140406" href="javascript:find('媒介总监');">媒介总监</a> <a
											class="search_140407" href="javascript:find('创意总监');">创意总监</a>
									</div>
								</li>
								<li>
									<h4>其他市场职位</h4>
									<div class="text">
										<a class="search_140701" href="javascript:find('市场');">其他市场职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>人事</b> <a
								href="javascript:find('HR');">人事/HR</a> <a
								href="javascript:find('行政');">行政</a> <a
								href="javascript:find('财务');">财务</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">人事</p>
							<ul>
								<li>
									<h4>人力资源</h4>
									<div class="text">
										<a class="search_150101" href="javascript:find('人力资源主管');">人力资源主管</a>
										<a class="search_150102" href="javascript:find('招聘');">招聘</a> <a
											class="search_150103" href="javascript:find('HRBP');">HRBP</a> <a
											class="search_150104" href="javascript:find('人力资源');">人力资源专员/助理</a>
										<a class="search_150105" href="javascript:find('培训');">培训</a> <a
											class="search_150106" href="javascript:find('薪资福利');">薪资福利</a> <a
											class="search_150107" href="javascript:find('绩效考核');">绩效考核</a> <a
											class="search_150403" href="javascript:find('人力资源经理');">人力资源经理</a>
										<a class="search_150406" href="javascript:find('人力资源');">人力资源VP/CHO</a>
										<a class="search_150108" href="javascript:find('人力资源总监');"
											class="cur">人力资源总监</a> <a class="search_150109"
											href="javascript:find('员工关系');">员工关系</a> <a class="search_150110"
											href="javascript:find('组织发展');">组织发展</a>
									</div>
								</li>
								<li>
									<h4>行政</h4>
									<div class="text">
										<a class="search_150201" href="javascript:find('行政专员');">行政专员</a>
										<a class="search_150202" href="javascript:find('前台');">前台</a> <a
											class="search_150204" href="javascript:find('行政主管');">行政主管</a> <a
											class="search_150205" href="javascript:find('经理助理');">经理助理</a> <a
											class="search_150207" href="javascript:find('后勤');">后勤</a> <a
											class="search_150208" href="javascript:find('商务司机');">商务司机</a> <a
											class="search_150401" href="javascript:find('行政经理');">行政经理</a> <a
											class="search_150209" href="javascript:find('行政总监');">行政总监</a>
									</div>
								</li>
								<li>
									<h4>财务</h4>
									<div class="text">
										<a class="search_150399" href="javascript:find('财务');">财务</a> <a
											class="search_150301" href="javascript:find('会计');">会计</a> <a
											class="search_150302" href="javascript:find('出纳');">出纳</a> <a
											class="search_150303" href="javascript:find('财务顾问');">财务顾问</a> <a
											class="search_150304" href="javascript:find('结算');" class="cur">结算</a>
										<a class="search_150305" href="javascript:find('税务');">税务</a> <a
											class="search_150306" href="javascript:find('审计');">审计</a> <a
											class="search_150307" href="javascript:find('风控');">风控</a> <a
											class="search_150402" href="javascript:find('财务经理');">财务经理</a> <a
											class="search_150404" href="javascript:find('CFO');">CFO</a> <a
											class="search_150308" href="javascript:find('财务总监');">财务总监</a> <a
											class="search_150309" href="javascript:find('财务主管');">财务主管</a>
									</div>
								</li>
								<li>
									<h4>法务</h4>
									<div class="text">
										<a class="search_150203" href="javascript:find('法务助理');">法务助理</a>
										<a class="search_150502" href="javascript:find('律师');">律师</a> <a
											class="search_150503" href="javascript:find('专利');">专利</a> <a
											class="search_150504" href="javascript:find('法律顾问');">法律顾问</a> <a
											class="search_150505" href="javascript:find('法务主管');">法务主管</a> <a
											class="search_150506" href="javascript:find('法务经理');" class="cur">法务经理</a>
										<a class="search_150507" href="javascript:find('法务总监');">法务总监</a>
									</div>
								</li>
								<li>
									<h4>其他职能职位</h4>
									<div class="text">
										<a class="search_150601" href="javascript:find('职能');">其他职能职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>高级管理</b> <a
								href="javascript:find('总');">CEO/总裁/总经理</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">高级管理</p>
							<ul>
								<li>
									<h4>高级管理职位</h4>
									<div class="text">
										<a class="search_150499" href="javascript:find('高级管理职位');">高级管理职位</a>
										<a class="search_150407" href="javascript:find('总');">CEO/总裁/总经理</a>
										<a class="search_150408" href="javascript:find('副总');">副总裁/副总经理</a>
										<a class="search_150409" href="javascript:find('事业部负责人');">事业部负责人</a>
										<a class="search_150410" href="javascript:find('负责人');">区域/分公司/代表处负责人</a>
										<a class="search_150411" href="javascript:find('助理');"
											class="cur">总裁/总经理/董事长助理</a> <a class="search_150412"
											href="javascript:find('合伙人');">合伙人</a> <a class="search_150413"
											href="javascript:find('创始人');">创始人</a> <a class="search_150414"
											href="javascript:find('董事会秘书');">董事会秘书</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>销售</b> <a
								href="javascript:find('销售专员');">销售专员</a> <a
								href="javascript:find('销售经理');">销售经理</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">销售</p>
							<ul>
								<li>
									<h4>销售</h4>
									<div class="text">
										<a class="search_140399" href="javascript:find('销售');">销售</a> <a
											class="search_140301" href="javascript:find('销售专员');">销售专员</a> <a
											class="search_140302" href="javascript:find('销售经理');">销售经理</a> <a
											class="search_140303" href="javascript:find('客户代表');">客户代表</a> <a
											class="search_140304" href="javascript:find('大客户代表');">大客户代表</a> <a
											class="search_140305" href="javascript:find('BD经理');">BD经理</a> <a
											class="search_140306" href="javascript:find('商务渠道');">商务渠道</a> <a
											class="search_140307" href="javascript:find('渠道销售');">渠道销售</a> <a
											class="search_140308" href="javascript:find('代理商销售');">代理商销售</a> <a
											class="search_140309" href="javascript:find('销售助理');">销售助理</a> <a
											class="search_140310" href="javascript:find('电话销售');">电话销售</a> <a
											class="search_140311" href="javascript:find('销售顾问');" class="cur">销售顾问</a>
										<a class="search_140312" href="javascript:find('商品经理');">商品经理</a>
										<a class="search_140313" href="javascript:find('广告销售');">广告销售</a>
										<a class="search_140314" href="javascript:find('网络营销');">网络营销</a>
										<a class="search_140315" href="javascript:find('营销主管');">营销主管</a>
										<a class="search_140316" href="javascript:find('销售工程师');">销售工程师</a>
										<a class="search_140317" href="javascript:find('客户经理');">客户经理</a>
									</div>
								</li>
								<li>
									<h4>销售管理</h4>
									<div class="text">
										<a class="search_160199" href="javascript:find('销售管理');">销售管理</a>
										<a class="search_140402" href="javascript:find('销售总监');">销售总监</a>
										<a class="search_140403" href="javascript:find('商务总监');"
											class="cur">商务总监</a> <a class="search_160101"
											href="javascript:find('区域总监');">区域总监</a> <a class="search_160102"
											href="javascript:find('城市经理');">城市经理</a> <a class="search_160103"
											href="javascript:find('销售VP');">销售VP</a> <a class="search_160104"
											href="javascript:find('团队经理');">团队经理</a>
									</div>
								</li>
								<li>
									<h4>其他销售职位</h4>
									<div class="text">
										<a class="search_160201" href="javascript:find('销售');">其他销售职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>媒体</b> <a
								href="javascript:find('文案');">文案</a> <a
								href="javascript:find('广告创意');">广告创意</a> <a
								href="javascript:find('编辑');">编辑</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">媒体</p>
							<ul>
								<li>
									<h4>采编/写作/出版</h4>
									<div class="text">
										<a class="search_170199" href="javascript:find('写作');">写作</a>
										<a class="search_170101" href="javascript:find('记者');">记者</a> <a
											class="search_170102" href="javascript:find('编辑');">编辑</a> <a
											class="search_170103" href="javascript:find('采编');">采编</a> <a
											class="search_170104" href="javascript:find('撰稿人');">撰稿人</a> <a
											class="search_170105" href="javascript:find('出版发行');">出版发行</a> <a
											class="search_170106" href="javascript:find('校对录入');">校对录入</a> <a
											class="search_170107" href="javascript:find('总编');">总编</a> <a
											class="search_170108" href="javascript:find('>自媒体');">自媒体</a>
									</div>
								</li>
								<li>
									<h4>公关媒介</h4>
									<div class="text">
										<a class="search_170399" href="javascript:find('公关媒介');">公关媒介</a>
										<a class="search_170301" href="javascript:find('媒介经理');">媒介经理</a>
										<a class="search_170302" href="javascript:find('媒介专员');">媒介专员</a>
										<a class="search_170303" href="javascript:find('广告协调');"
											class="cur">广告协调</a> <a class="search_170304"
											href="javascript:find('品牌公关');">品牌公关</a> <a class="search_170305"
											href="javascript:find('活动策划执行');">活动策划执行</a> <a
											class="search_170306" href="javascript:find('媒介策划');">媒介策划</a>
									</div>
								</li>
								<li>
									<h4>会务会展</h4>
									<div class="text">
										<a class="search_170499" href="javascript:find('会务会展');">会务会展</a>
										<a class="search_170401" href="javascript:find('会议活动销售');">会议活动销售</a>
										<a class="search_170402" href="javascript:find('会议活动策划');">会议活动策划</a>
										<a class="search_170403" href="javascript:find('会议活动执行');">会议活动执行</a>
										<a class="search_170404" href="javascript:find('会展活动销售');">会展活动销售</a>
										<a class="search_170405" href="javascript:find('会展活动策划');">会展活动策划</a>
										<a class="search_170406" href="javascript:find('会展活动执行');">会展活动执行</a>
									</div>
								</li>
								<li>
									<h4>广告</h4>
									<div class="text">
										<a class="search_170299" href="javascript:find('广告');">广告</a> <a
											class="search_170201" href="javascript:find('广告创意');">广告创意</a> <a
											class="search_170202" href="javascript:find('美术指导');">美术指导</a> <a
											class="search_170203" href="javascript:find('广告设计师');">广告设计师</a> <a
											class="search_170204" href="javascript:find('策划经理');">策划经理</a> <a
											class="search_170205" href="javascript:find('文案');" class="cur">文案</a>
										<a class="search_170207" href="javascript:find('广告制作');">广告制作</a>
										<a class="search_170208" href="javascript:find('媒介投放');">媒介投放</a>
										<a class="search_170209" href="javascript:find('媒介合作');">媒介合作</a>
										<a class="search_170210" href="javascript:find('媒介顾问');">媒介顾问</a>
										<a class="search_170211" href="javascript:find('广告审核');">广告审核</a>
									</div>
								</li>
								<li>
									<h4>影视媒体</h4>
									<div class="text">
										<a class="search_170699" href="javascript:find('影视媒体');">影视媒体</a>
										<a class="search_170617" href="javascript:find('助理');">助理</a> <a
											class="search_170618" href="javascript:find('统筹制片人');">统筹制片人</a> <a
											class="search_170619" href="javascript:find('执行制片人');">执行制片人</a> <a
											class="search_170601" href="javascript:find('导');">导演/编导</a> <a
											class="search_170602" href="javascript:find('影');">摄影/影像师</a>
										<a class="search_170603" href="javascript:find('视频编辑');">视频编辑</a>
										<a class="search_170604" href="javascript:find('音频编辑');">音频编辑</a>
										<a class="search_170605" href="javascript:find('经纪人');">经纪人</a> <a
											class="search_170606" href="javascript:find('后期制作');" class="cur">后期制作</a>
										<a class="search_170607" href="javascript:find('影视制作');">影视制作</a>
										<a class="search_170608" href="javascript:find('影视发行');">影视发行</a>
										<a class="search_170609" href="javascript:find('影视策划');">影视策划</a>
										<a class="search_170610" href="javascript:find('主');">主持人/主播/DJ</a>
										<a class="search_170611" href="javascript:find('演员');">演员/配音/模特</a>
										<a class="search_170612" href="javascript:find('化妆');">化妆/造型/服装</a>
										<a class="search_170613" href="javascript:find('放映管理');">放映管理</a>
										<a class="search_170614" href="javascript:find('音');">录音/音效</a>
										<a class="search_170615" href="javascript:find('制片人');">制片人</a> <a
											class="search_170616" href="javascript:find('编剧');">编剧</a>
									</div>
								</li>
								<li>
									<h4>其他传媒职位</h4>
									<div class="text">
										<a class="search_170501" href="javascript:find('传媒');">其他传媒职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>金融</b> <a
								href="javascript:find('投资经理');">投资经理</a> <a
								href="javascript:find('投资总监');">投资总监</a> <a
								href="javascript:find('风控');">风控</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">金融</p>
							<ul>
								<li>
									<h4>投融资</h4>
									<div class="text">
										<a class="search_180199" href="javascript:find('投融资');">投融资</a> <a
											class="search_180101" href="javascript:find('投资经理');">投资经理</a> <a
											class="search_180103" href="javascript:find('行业研究');">行业研究</a> <a
											class="search_180104" href="javascript:find('资产管理');">资产管理</a> <a
											class="search_180112" href="javascript:find('投资总监');">投资总监</a> <a
											class="search_180113" href="javascript:find('投资VP');">投资VP</a> <a
											class="search_180114" href="javascript:find('投资合伙人');">投资合伙人</a> <a
											class="search_180115" href="javascript:find('融资');">融资</a> <a
											class="search_180116" href="javascript:find('并购');">并购</a> <a
											class="search_180117" href="javascript:find('投后管理');" class="cur">投后管理</a>
										<a class="search_180118" href="javascript:find('投资助理');">投资助理</a>
										<a class="search_180111" href="javascript:find('其他投融资职位');">其他投融资职位</a>
										<a class="search_180119" href="javascript:find('投资顾问');">投资顾问</a>
									</div>
								</li>
								<li>
									<h4>风控</h4>
									<div class="text">
										<a class="search_180201" href="javascript:find('风控');">风控</a> <a
											class="search_180202" href="javascript:find('律师');">律师</a> <a
											class="search_180203" href="javascript:find('资信评估');">资信评估</a> <a
											class="search_180204" href="javascript:find('合规稽查');" class="cur">合规稽查</a>
									</div>
								</li>
								<li>
									<h4>税务审计</h4>
									<div class="text">
										<a class="search_180301" href="javascript:find('审计');">审计</a> <a
											class="search_180302" href="javascript:find('法务');">法务</a> <a
											class="search_180303" href="javascript:find('会计');">会计</a> <a
											class="search_180304" href="javascript:find('清算');">清算</a>
									</div>
								</li>
								<li>
									<h4>银行</h4>
									<div class="text">
										<a class="search_180499" href="javascript:find('银行');">银行</a> <a
											class="search_180401" href="javascript:find('信用卡销售');">信用卡销售</a> <a
											class="search_180102" href="javascript:find('分析师');">分析师</a> <a
											class="search_180402" href="javascript:find('柜员');">柜员</a> <a
											class="search_180403" href="javascript:find('商务渠道');" class="cur">商务渠道</a>
										<a class="search_180404" href="javascript:find('大堂经理');">大堂经理</a>
										<a class="search_180105" href="javascript:find('理财顾问');">理财顾问</a>
										<a class="search_180405" href="javascript:find('客户经理');">客户经理</a>
										<a class="search_180406" href="javascript:find('信贷管理');">信贷管理</a>
										<a class="search_180107" href="javascript:find('风控');">风控</a>
									</div>
								</li>
								<li>
									<h4>互联网金融</h4>
									<div class="text">
										<a class="search_180599" href="javascript:find('互联网金融');">互联网金融</a>
										<a class="search_180501" href="javascript:find('金融产品经理');">金融产品经理</a>
										<a class="search_180502" href="javascript:find('风控');">风控</a> <a
											class="search_180503" href="javascript:find('催收员');">催收员</a> <a
											class="search_180504" href="javascript:find('分析师');">分析师</a> <a
											class="search_180505" href="javascript:find('投资经理');">投资经理</a> <a
											class="search_180106" href="javascript:find('交易员');">交易员</a> <a
											class="search_180506" href="javascript:find('理财顾问');">理财顾问</a> <a
											class="search_180108" href="javascript:find('合规稽查');" class="cur">合规稽查</a>
										<a class="search_180109" href="javascript:find('审计');">审计</a> <a
											class="search_180110" href="javascript:find('清算');">清算</a>
									</div>
								</li>
								<li>
									<h4>保险</h4>
									<div class="text">
										<a class="search_180701" href="javascript:find('保险业务');">保险业务</a>
										<a class="search_180702" href="javascript:find('精算师');">精算师</a> <a
											class="search_180703" href="javascript:find('保险理赔');">保险理赔</a>
									</div>
								</li>
								<li>
									<h4>证券</h4>
									<div class="text">
										<a class="search_180899" href="javascript:find('证券');">证券</a> <a
											class="search_180801" href="javascript:find('证券经纪人');">证券经纪人</a> <a
											class="search_180802" href="javascript:find('证券分析师');">证券分析师</a>
									</div>
								</li>
								<li>
									<h4>其他金融职位</h4>
									<div class="text">
										<a class="search_180601" href="javascript:find('金融');">其他金融职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>

					<div class="show-all">显示全部职位</div>
					<dl class="all-box">
						<dd>
							<i class="icon-arrow-right"></i> <b>汽车</b> <a
								href="javascript:find('汽车销售');">汽车销售</a> <a
								href="javascript:find('汽车维修');">汽车维修</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">汽车</p>
							<ul>
								<li>
									<h4>汽车设计与研发</h4>
									<div class="text">
										<a class="search_230101" href="javascript:find('汽车设计');">汽车设计</a>
										<a class="search_230102" href="javascript:find('车身设计');">车身设计</a>
										<a class="search_230103" href="javascript:find('底盘设计');">底盘设计</a>
										<a class="search_230104" href="javascript:find('机械设计');">机械设计</a>
										<a class="search_230105" href="javascript:find('动力系统设计');">动力系统设计</a>
										<a class="search_230106" href="javascript:find('电子工程设计');">电子工程设计</a>
										<a class="search_230107" href="javascript:find('零部件设计');">零部件设计</a>
										<a class="search_230108" href="javascript:find('汽车工程项目管理');"
											class="cur">汽车工程项目管理</a> <a class="search_230110"
											href="javascript:find('内外饰设计工程师');">内外饰设计工程师</a>
									</div>
								</li>
								<li>
									<h4>汽车生产与制造</h4>
									<div class="text">
										<a class="search_230210" href="javascript:find('总装工程师');">总装工程师</a>
										<a class="search_230211" href="javascript:find('焊接工程师');">焊接工程师</a>
										<a class="search_230212" href="javascript:find('冲压工程师');">冲压工程师</a>
										<a class="search_230109" href="javascript:find('质量工程师');">质量工程师</a>
									</div>
								</li>
								<li>
									<h4>汽车销售与服务</h4>
									<div class="text">
										<a class="search_230299" href="javascript:find('汽车销售与制造');">汽车销售与制造</a>
										<a class="search_230201" href="javascript:find('汽车销售');">汽车销售</a>
										<a class="search_230202" href="javascript:find('汽车配件销售');"
											class="cur">汽车配件销售</a> <a class="search_230203"
											href="javascript:find('汽车售后服务');">汽车售后服务</a> <a
											class="search_230204" href="javascript:find('汽车维修');">汽车维修</a> <a
											class="search_230205" href="javascript:find('汽车美容');">汽车美容</a> <a
											class="search_230206" href="javascript:find('汽车定损理赔');">汽车定损理赔</a>
										<a class="search_230207" href="javascript:find('二手车评估师');">二手车评估师</a>
										<a class="search_230208" href="javascript:find('4S店管理');">4S店管理</a>
										<a class="search_230209" href="javascript:find('汽车改装工程师');"
											class="cur">汽车改装工程师</a>
									</div>
								</li>
								<li>
									<h4>其他汽车职位</h4>
									<div class="text">
										<a class="search_230301" href="javascript:find('汽车');">其他汽车职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="all-box">
						<dd>
							<i class="icon-arrow-right"></i> <b>教育培训</b> <a
								href="javascript:find('课程设计');">课程设计</a> <a
								href="javascript:find('教务管理');">教务管理</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">教育培训</p>
							<ul>
								<li>
									<h4>教育产品研发</h4>
									<div class="text">
										<a class="search_190199" href="javascript:find('教育产品研发');">教育产品研发</a>
										<a class="search_190101" href="javascript:find('课程设计');">课程设计</a>
										<a class="search_190102" href="javascript:find('课程编辑');">课程编辑</a>
										<a class="search_190103" href="javascript:find('教师');">教师</a> <a
											class="search_190104" href="javascript:find('培训研究');">培训研究</a> <a
											class="search_190105" href="javascript:find('培训师');" class="cur">培训师</a>
										<a class="search_190107" href="javascript:find('培训策划');">培训策划</a>
										<a class="search_190106" href="javascript:find('教育');">其他教育产品研发职位</a>
									</div>
								</li>
								<li>
									<h4>教育行政</h4>
									<div class="text">
										<a class="search_190299" href="javascript:find('教育行政');">教育行政</a>
										<a class="search_190201" href="javascript:find('校长');">校长</a> <a
											class="search_190202" href="javascript:find('教务管理');" class="cur">教务管理</a>
										<a class="search_190203" href="javascript:find('教学管理');">教学管理</a>
										<a class="search_190204" href="javascript:find('班主任');">班主任/辅导员</a>
									</div>
								</li>
								<li>
									<h4>教师</h4>
									<div class="text">
										<a class="search_190301" href="javascript:find('教师');">教师</a> <a
											class="search_190302" href="javascript:find('助教');">助教</a> <a
											class="search_190303" href="javascript:find('高中教师');">高中教师</a> <a
											class="search_190304" href="javascript:find('初中教师');">初中教师</a> <a
											class="search_190305" href="javascript:find('小学教师');">小学教师</a> <a
											class="search_190306" href="javascript:find('幼教');" class="cur">幼教</a>
										<a class="search_190307" href="javascript:find('理科教师');">理科教师</a>
										<a class="search_190308" href="javascript:find('文科教师');">文科教师</a>
										<a class="search_190309" href="javascript:find('外语教师');">外语教师</a>
										<a class="search_190310" href="javascript:find('音乐教师');">音乐教师</a>
										<a class="search_190311" href="javascript:find('美术教师');">美术教师</a>
										<a class="search_190312" href="javascript:find('体育教师');">体育教师</a>
										<a class="search_190313" href="javascript:find('就业老师');">就业老师</a>
									</div>
								</li>
								<li>
									<h4>IT培训</h4>
									<div class="text">
										<a class="search_190499" href="javascript:find('IT培训');">IT培训</a>
										<a class="search_190401" href="javascript:find('JAVA培训讲师');">JAVA培训讲师</a>
										<a class="search_190402" href="javascript:find('Android培训讲师');">Android培训讲师</a>
										<a class="search_190403" href="javascript:find('ios培训讲师');">ios培训讲师</a>
										<a class="search_190404" href="javascript:find('PHP培训讲师');">PHP培训讲师</a>
										<a class="search_190405" href="javascript:find('.NET培训讲师');">.NET培训讲师</a>
										<a class="search_190406" href="javascript:find('C++培训讲师');">C++培训讲师</a>
										<a class="search_190407" href="javascript:find('Unity3D培训讲师');">Unity3D培训讲师</a> 
										<a class="search_190408" href="javascript:find('Web前端培训讲师');">Web前端培训讲师</a>
										<a class="search_190409" href="javascript:find('软件测试培训讲师');">软件测试培训讲师</a>
										<a class="search_190410" href="javascript:find('动漫培训讲师');">动漫培训讲师</a>
										<a class="search_190411" href="javascript:find('UI设计培训讲师');">UI设计培训讲师</a>
									</div>
								</li>
								<li>
									<h4>职业培训</h4>
									<div class="text">
										<a class="search_190501" href="javascript:find('财会培训讲师');">财会培训讲师</a>
										<a class="search_190502" href="javascript:find('HR培训讲师');">HR培训讲师</a>
										<a class="search_190503" href="javascript:find('培训师');"
											class="cur">培训师</a> <a class="search_190504"
											href="javascript:find('拓展培训');">拓展培训</a>
									</div>
								</li>
								<li>
									<h4>招生</h4>
									<div class="text">
										<a class="search_190601" href="javascript:find('课程顾问');">课程顾问</a>
										<a class="search_190602" href="javascript:find('招生顾问');">招生顾问</a>
										<a class="search_190603" href="javascript:find('留学顾问');">留学顾问</a>
									</div>
								</li>
								<li>
									<h4>教练</h4>
									<div class="text">
										<a class="search_190799" href="javascript:find('教练');">教练</a> <a
											class="search_190701" href="javascript:find('舞蹈教练');">舞蹈教练</a> <a
											class="search_190702" href="javascript:find('瑜伽教练');" class="cur">瑜伽教练</a>
										<a class="search_190703" href="javascript:find('瘦身顾问');">瘦身顾问</a>
										<a class="search_190704" href="javascript:find('游泳教练');">游泳教练</a>
										<a class="search_190705" href="javascript:find('健身教练');">健身教练</a>
										<a class="search_190706" href="javascript:find('球教练');">篮球/羽毛球教练</a>
										<a class="search_190707" href="javascript:find('跆拳道教练');">跆拳道教练</a>
									</div>
								</li>
								<li>
									<h4>其他教育培训职位</h4>
									<div class="text">
										<a class="search_190801" href="javascript:find('培训');">其他教育培训职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="all-box">
						<dd>
							<i class="icon-arrow-right"></i> <b>运营</b> <a
								href="javascript:find('新媒体运营');">新媒体运营</a> <a
								href="javascript:find('产品运营');">产品运营</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">运营</p>
							<ul>
								<li>
									<h4>运营</h4>
									<div class="text">
										<a class="search_130199" href="javascript:find('运营');">运营</a> <a
											class="search_130101" href="javascript:find('用户运营');">用户运营</a> <a
											class="search_130102" href="javascript:find('产品运营');">产品运营</a> <a
											class="search_130103" href="javascript:find('数据运营');">数据运营</a> <a
											class="search_130104" href="javascript:find('内容运营');">内容运营</a> <a
											class="search_130105" href="javascript:find('活动运营');">活动运营</a> <a
											class="search_130106" href="javascript:find('商家运营');">商家运营</a> <a
											class="search_130107" href="javascript:find('品类运营');">品类运营</a> <a
											class="search_130108" href="javascript:find('游戏运营');">游戏运营</a> <a
											class="search_130109" href="javascript:find('网络推广');" class="cur">网络推广</a>
										<a class="search_130110" href="javascript:find('网站运营');">网站运营</a>
										<a class="search_130111" href="javascript:find('新媒体运营');">新媒体运营</a>
										<a class="search_130112" href="javascript:find('社区运营');">社区运营</a>
										<a class="search_130113" href="javascript:find('微信运营');">微信运营</a>
										<a class="search_130114" href="javascript:find('微博运营');">微博运营</a>
										<a class="search_130115" href="javascript:find('策略运营');">策略运营</a>
										<a class="search_130116" href="javascript:find('线下拓展运营');">线下拓展运营</a>
										<a class="search_130117" href="javascript:find('电商运营');">电商运营</a>
										<a class="search_130118" href="javascript:find('运营');">运营助理/专员</a>
										<a class="search_130120" href="javascript:find('内容审核');">内容审核</a>
										<a class="search_130119" href="javascript:find('销售运营');">销售运营</a>
									</div>
								</li>
								<li>
									<h4>编辑</h4>
									<div class="text">
										<a class="search_130299" href="javascript:find('编辑');">编辑</a> <a
											class="search_130201" href="javascript:find('副主编');">副主编</a> <a
											class="search_130202" href="javascript:find('内容编辑');">内容编辑</a> <a
											class="search_130203" href="javascript:find('文案策划');">文案策划</a> <a
											class="search_130204" href="javascript:find('网站编辑');">网站编辑</a> <a
											class="search_130205" href="javascript:find('记者');" class="cur">记者</a>
										<a class="search_130206" href="javascript:find('采编');">采编</a>
									</div>
								</li>
								<li>
									<h4>客服</h4>
									<div class="text">
										<a class="search_130301" href="javascript:find('售前咨询');">售前咨询</a>
										<a class="search_130302" href="javascript:find('售后咨询');">售后咨询</a>
										<a class="search_130303" href="javascript:find('网络客服');">网络客服</a>
										<a class="search_130304" href="javascript:find('客服经理');">客服经理</a>
										<a class="search_130305" href="javascript:find('客服');">客服专员/助理</a>
										<a class="search_130306" href="javascript:find('客服主管');">客服主管</a>
										<a class="search_130307" href="javascript:find('客服总监');">客服总监</a>
										<a class="search_130308" href="javascript:find('电话客服');">电话客服</a>
										<a class="search_130309" href="javascript:find('>咨询热线');">咨询热线/呼叫中心客服</a>
									</div>
								</li>
								<li>
									<h4>高端运营职位</h4>
									<div class="text">
										<a class="search_130499" href="javascript:find('高端运营职位');">高端运营职位</a>
										<a class="search_130401" href="javascript:find('主编');">主编</a> <a
											class="search_130402" href="javascript:find('运营总监');" class="cur">运营总监</a>
										<a class="search_130403" href="javascript:find('COO');">COO</a> <a
											class="search_130404" href="javascript:find('客服总监');">客服总监</a> <a
											class="search_130405" href="javascript:find('运营经理');">运营经理/主管</a>
									</div>
								</li>
								<li>
									<h4>其他运营职位</h4>
									<div class="text">
										<a class="search_130501" href="javascript:find('运营');">其他运营职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<div class="all-box">
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>医疗健康</b> <a
									href="javascript:find('药剂师');">药剂师</a> <a
									href="javascript:find('营养师');">营养师</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">医疗健康</p>
								<ul>
									<li>
										<h4>医生/医技</h4>
										<div class="text">
											<a href="javascript:find('医生');">医生/医技</a> <a
												href="javascript:find('医生助理');">医生助理</a> <a
												href="javascript:find('医学影像');">医学影像</a> <a
												href="javascript:find('B超医生');">B超医生</a> <a
												href="javascript:find('中医');">中医</a> <a
												href="javascript:find('医师');">医师</a> <a
												href="javascript:find('心理医生');">心理医生</a> <a
												href="javascript:find('药剂师');">药剂师</a> <a
												href="javascript:find('牙科医生');">牙科医生</a> <a
												href="javascript:find('康复治疗师');">康复治疗师</a> <a
												href="javascript:find('验光师');">验光师</a> <a
												href="javascript:find('放射科医师');">放射科医师</a> <a
												href="javascript:find('检验科医师');" class="cur">检验科医师</a> <a
												href="javascript:find('医师');">医师</a> <a
												href="javascript:find('其他医生职位');">其他医生职位</a>
										</div>
									</li>
									<li>
										<h4>护士/护理</h4>
										<div class="text">
											<a href="javascript:find('Java');">护士长</a> <a
												href="javascript:find('护士');">护士/护理</a> <a
												href="javascript:find('导医');">导医</a>
										</div>
									</li>
									<li>
										<h4>健康整形</h4>
										<div class="text">
											<a href="javascript:find('健康整形');">健康整形</a> <a
												href="javascript:find('营养师');">营养师</a> <a
												href="javascript:find('整形师');">整形师</a> <a
												href="javascript:find('理疗师');" class="cur">理疗师</a> <a
												href="javascript:find('针灸推拿');">针灸推拿</a>
										</div>
									</li>
									<li>
										<h4>生物制药</h4>
										<div class="text">
											<a href="javascript:find('生物制药');" class="cur">生物制药</a> <a
												href="javascript:find('药品注册');">药品注册</a> <a
												href="javascript:find('药品生产');">药品生产</a> <a
												href="javascript:find('临床研究');">临床研究</a> <a
												href="javascript:find('临床协调');">临床协调</a> <a
												href="javascript:find('临床数据分析');">临床数据分析</a> <a
												href="javascript:find('医学总监');">医学总监</a> <a
												href="javascript:find('医药研发');">医药研发</a>
										</div>
									</li>
									<li>
										<h4>医疗器械</h4>
										<div class="text">
											<a href="javascript:find('医疗器械注册');">医疗器械注册</a> <a
												href="javascript:find('医疗器械生产');">医疗器械生产/质量管理</a> <a
												href="javascript:find('医疗器械研究');">医疗器械研究</a>
										</div>
									</li>
									<li>
										<h4>药店</h4>
										<div class="text">
											<a href="javascript:find('药店');">药店</a> <a
												href="javascript:find('店长');">店长</a> <a
												href="javascript:find('药师');">执业药师/驻店药师</a> <a
												href="javascript:find('店员');">店员/营业员</a>
										</div>
									</li>
									<li>
										<h4>市场营销/媒体</h4>
										<div class="text">
											<a href="javascript:find('市场营销');">市场营销/媒体</a> <a
												href="javascript:find('医疗器械销售');">医疗器械销售</a> <a
												href="javascript:find('医学编辑');" class="cur">医学编辑</a> <a
												href="javascript:find('医学总监');">医学总监</a> <a
												href="javascript:find('药学编辑');">药学编辑</a> <a
												href="javascript:find('医药代表');">医药代表</a> <a
												href="javascript:find('健康顾问');">健康顾问</a> <a
												href="javascript:find('医美咨询');">医美咨询</a>
										</div>
									</li>
									<li>
										<h4>其他医疗健康类职位</h4>
										<div class="text">
											<a href="javascript:find('医疗');">其他医疗健康类职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>采购贸易</b> <a
									href="javascript:find('采购经理');">采购经理</a> <a
									href="javascript:find('采购主管');">采购主管</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">采购贸易</p>
								<ul>
									<li>
										<h4>采购</h4>
										<div class="text">
											<a href="javascript:find('Java');">采购</a> <a
												href="javascript:find('采购总监');">采购总监</a> <a
												href="javascript:find('采购经理');">采购经理</a> <a
												href="javascript:find('采购专员');">采购专员</a> <a
												href="javascript:find('买手');">买手</a> <a
												href="javascript:find('采购工程师');" class="cur">采购工程师</a> <a
												href="javascript:find('采购主管');">采购主管</a> <a
												href="javascript:find('采购助理');">采购助理</a>
										</div>
									</li>
									<li>
										<h4>进出口贸易</h4>
										<div class="text">
											<a href="javascript:find('进出口贸易');">进出口贸易</a> <a
												href="javascript:find('外贸经理');">外贸经理</a> <a
												href="javascript:find('外贸专员');" class="cur">外贸专员</a> <a
												href="javascript:find('外贸业务员');">外贸业务员</a> <a
												href="javascript:find('贸易跟单');">贸易跟单</a>
										</div>
									</li>
									<li>
										<h4>其他采购/贸易职位</h4>
										<div class="text">
											<a href="javascript:find('贸易');">其他采购/贸易类职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>物流</b> <a
									href="javascript:find('物流专员');">物流专员</a> <a
									href="javascript:find('贸易跟单');">贸易跟单</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">供应链/物流</p>
								<ul>
									<li>
										<h4>物流</h4>
										<div class="text">
											<a href="javascript:find('物流');">物流</a> <a
												href="javascript:find('供应链专员');">供应链专员</a> <a
												href="javascript:find('供应链经理');">供应链经理</a> <a
												href="javascript:find('物流专员');">物流专员</a> <a
												href="javascript:find('物流经理');">物流经理</a> <a
												href="javascript:find('物流运营');">物流运营</a> <a
												href="javascript:find('物流跟单');">物流跟单</a> <a
												href="javascript:find('贸易跟单');">贸易跟单</a> <a
												href="javascript:find('物仓调度');">物仓调度</a> <a
												href="javascript:find('物仓项目');" class="cur">物仓项目</a> <a
												href="javascript:find('运输经理');">运输经理/主管</a> <a
												href="javascript:find('货运代理专员');">货运代理专员</a> <a
												href="javascript:find('货运代理经理');">货运代理经理</a> <a
												href="javascript:find('运操作');">水/空/陆运操作</a> <a
												href="javascript:find('报关员');">报关员</a> <a
												href="javascript:find('报检员');">报检员</a> <a
												href="javascript:find('核销员');">核销员</a> <a
												href="javascript:find('单证员');">单证员</a>
										</div>
									</li>
									<li>
										<h4>仓储</h4>
										<div class="text">
											<a href="javascript:find('仓储');">仓储</a> <a
												href="javascript:find('仓储物料经理');">仓储物料经理</a> <a
												href="javascript:find('仓储物料专员');">仓储物料专员</a> <a
												href="javascript:find('仓储物料项目');">仓储物料项目</a> <a
												href="javascript:find('仓储管理');" class="cur">仓储管理</a> <a
												href="javascript:find('仓库文员');">仓库文员</a> <a
												href="javascript:find('货');">配/理/拣/发货</a>
										</div>
									</li>
									<li>
										<h4>运输</h4>
										<div class="text">
											<a href="javascript:find('运输');">运输</a> <a
												href="javascript:find('货运司机');">货运司机</a> <a
												href="javascript:find('集装箱管理');" class="cur">集装箱管理</a> <a
												href="javascript:find('配送');">配送</a> <a
												href="javascript:find('快递');">快递</a>
										</div>
									</li>
									<li>
										<h4>高端供应链职位</h4>
										<div class="text">
											<a href="javascript:find('高端供应链职位');">高端供应链职位</a> <a
												href="javascript:find('供应链总监');">供应链总监</a> <a
												href="javascript:find('物流总监');">物流总监</a>
										</div>
									</li>
									<li>
										<h4>其他供应链职位</h4>
										<div class="text">
											<a href="javascript:find('供应');">其他供应链职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>房地产/建筑</b> <a
									href="javascript:find('物业管理');">物业管理</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">房地产/建筑</p>
								<ul>
									<li>
										<h4>房地产规划开发</h4>
										<div class="text">
											<a href="javascript:find('房地产规划开发');">房地产规划开发</a> <a
												href="javascript:find('房产策划');">房产策划</a> <a
												href="javascript:find('地产项目管理');">地产项目管理</a> <a
												href="javascript:find('地产招投标');">地产招投标</a>
										</div>
									</li>
									<li>
										<h4>设计装修与市政建设</h4>
										<div class="text">
											<a href="javascript:find('设计装修与市政建设');">设计装修与市政建设</a> <a
												href="javascript:find('高级建筑工程师');">高级建筑工程师</a> <a
												href="javascript:find('建筑工程师');">建筑工程师</a> <a
												href="javascript:find('建筑设计师');" class="cur">建筑设计师</a> <a
												href="javascript:find('土木工程师');">土木/土建/结构工程师</a> <a
												href="javascript:find('室内设计');">室内设计</a> <a
												href="javascript:find('园林设计');">园林设计</a> <a
												href="javascript:find('城市规划设计');">城市规划设计</a> <a
												href="javascript:find('工程监理');">工程监理</a> <a
												href="javascript:find('工程造价');">工程造价</a> <a
												href="javascript:find('预结算');">预结算</a> <a
												href="javascript:find('工程资料管理');">工程资料管理</a> <a
												href="javascript:find('建筑施工现场管理');">建筑施工现场管理</a>
										</div>
									</li>
									<li>
										<h4>房地产经纪</h4>
										<div class="text">
											<a href="javascript:find('房地产经纪');">房地产经纪</a> <a
												href="javascript:find('地产置业顾问');">地产置业顾问</a> <a
												href="javascript:find('地产评估');" class="cur">地产评估</a> <a
												href="javascript:find('地产中介');">地产中介</a>
										</div>
									</li>
									<li>
										<h4>物业管理</h4>
										<div class="text">
											<a href="javascript:find('物业管理');">物业管理</a> <a
												href="javascript:find('物业租赁销售');">物业租赁销售 </a> <a
												href="javascript:find('物业招商管理');">物业招商管理</a>
										</div>
									</li>
									<li>
										<h4>高端房地产职位</h4>
										<div class="text">
											<a href="javascript:find('高端房地产职位');">高端房地产职位</a> <a
												href="javascript:find('地产项目总监');">地产项目总监</a> <a
												href="javascript:find('地产策划总监');">地产策划总监</a> <a
												href="javascript:find('地产招投标总监');" class="cur">地产招投标总监</a> <a
												href="javascript:find('物业总监');">物业总监</a> <a
												href="javascript:find('房地产销售总监');">房地产销售总监</a>
										</div>
									</li>
									<li>
										<h4>其他房地产职位</h4>
										<div class="text">
											<a href="javascript:find('地产');">其他房地产职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>咨询/翻译/法律</b> <a
									href="javascript:find('企业管理咨询');">企业管理咨询</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">咨询/翻译/法律</p>
								<ul>
									<li>
										<h4>咨询/调研</h4>
										<div class="text">
											<a href="javascript:find('咨询');">咨询/调研</a> <a
												href="javascript:find('企业管理咨询');">企业管理咨询</a> <a
												href="javascript:find('数据分析师');" class="cur">数据分析师</a> <a
												href="javascript:find('财务咨询顾问');">财务咨询顾问</a> <a
												href="javascript:find('IT咨询顾问');">IT咨询顾问</a> <a
												href="javascript:find('人力资源顾问');">人力资源顾问</a> <a
												href="javascript:find('咨询项目管理');">咨询项目管理</a> <a
												href="javascript:find('战略咨询');">战略咨询</a> <a
												href="javascript:find('猎头顾问');">猎头顾问</a> <a
												href="javascript:find('市场调研');">市场调研</a> <a
												href="javascript:find('其他咨询顾问');">其他咨询顾问</a>
										</div>
									</li>
									<li>
										<h4>律师</h4>
										<div class="text">
											<a href="javascript:find('知识产权');">知识产权</a> <a
												href="javascript:find('事务所律师');">事务所律师</a> <a
												href="javascript:find('公司法务');" class="cur">公司法务</a>
										</div>
									</li>
									<li>
										<h4>翻译</h4>
										<div class="text">
											<a href="javascript:find('英语翻译');">英语翻译</a> <a
												href="javascript:find('日语翻译');">日语翻译</a> <a
												href="javascript:find('韩语翻译');">韩语翻译</a> <a
												href="javascript:find('朝鲜语翻译');">朝鲜语翻译</a> <a
												href="javascript:find('法语翻译');">法语翻译</a> <a
												href="javascript:find('德语翻译');">德语翻译</a> <a
												href="javascript:find('俄语翻译');">俄语翻译</a> <a
												href="javascript:find('西班牙语翻译');">西班牙语翻译</a> <a
												href="javascript:find('其他语种翻译');">其他语种翻译</a>
										</div>
									</li>
									<li>
										<h4>高端咨询类职位</h4>
										<div class="text">
											<a href="javascript:find('高端咨询类职位');">高端咨询类职位</a> <a
												href="javascript:find('咨询总监');">咨询总监</a> <a
												href="javascript:find('咨询经理');" class="cur">咨询经理</a> <a
												href="javascript:find('高级翻译');">高级翻译</a> <a
												href="javascript:find('同声传译');">同声传译 </a>
										</div>
									</li>
									<li>
										<h4>其他咨询类职位</h4>
										<div class="text">
											<a href="javascript:find('咨询');">其他咨询/翻译类职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>实习生/管培生</b> <a
									href="javascript:find('实习生');">实习生</a> <a
									href="javascript:find('管培生');">管培生</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">实习生/管培生</p>
								<ul>
									<li>
										<h4>实习生/培训生/储备干部</h4>
										<div class="text">
											<a href="javascript:find('实习生');">实习生</a> <a
												href="javascript:find('管理培训生');">管理培训生</a> <a
												href="javascript:find('储备干部');">储备干部</a>
										</div>
									</li>
									<li>
										<h4>其他实习/培训/储备职位</h4>
										<div class="text">
											<a href="javascript:find('培');">其他实习/培训/储备职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>旅游</b> <a
									href="javascript:find('旅游顾问');">旅游顾问</a> <a
									href="javascript:find('导游');">导游</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">旅游</p>
								<ul>
									<li>
										<h4>旅游服务</h4>
										<div class="text">
											<a href="javascript:find('旅游服务');">旅游服务</a> <a
												href="javascript:find('计调');">计调</a> <a
												href="javascript:find('签证');">签证</a> <a
												href="javascript:find('旅游顾问');">旅游顾问</a> <a
												href="javascript:find('导游');">导游</a> <a
												href="javascript:find('预定票务');">预定票务</a>
										</div>
									</li>
									<li>
										<h4>旅游产品开发/策划</h4>
										<div class="text">
											<a href="javascript:find('旅游产品');">旅游产品开发/策划</a> <a
												href="javascript:find('旅游产品经理');">旅游产品经理</a> <a
												href="javascript:find('旅游策划师');" class="cur">旅游策划师</a>
										</div>
									</li>
									<li>
										<h4>其他旅游职位</h4>
										<div class="text">
											<a href="javascript:find('旅游');">其他旅游职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>服务业</b> <a
									href="javascript:find('酒店前台');">酒店前台</a> <a
									href="javascript:find('客房服务员');">客房服务员</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">服务业</p>
								<ul>
									<li>
										<h4>安保/家政</h4>
										<div class="text">
											<a href="javascript:find('保安');">保安</a> <a
												href="javascript:find('保洁');">保洁</a>
										</div>
									</li>
									<li>
										<h4>酒店</h4>
										<div class="text">
											<a href="javascript:find('酒店');">酒店</a> <a
												href="javascript:find('收银');">收银</a> <a
												href="javascript:find('酒店前台');">酒店前台</a> <a
												href="javascript:find('客房服务员');">客房服务员</a> <a
												href="javascript:find('酒店经理');" class="cur">酒店经理</a>
										</div>
									</li>
									<li>
										<h4>餐饮</h4>
										<div class="text">
											<a href="javascript:find('后厨');">后厨</a> <a
												href="javascript:find('配菜打荷');">配菜打荷</a> <a
												href="javascript:find('茶艺师');">茶艺师</a> <a
												href="javascript:find('西点师');">西点师</a> <a
												href="javascript:find('餐饮');">餐饮</a> <a
												href="javascript:find('收银');">收银</a> <a
												href="javascript:find('服务员');">服务员</a> <a
												href="javascript:find('厨师');">厨师</a> <a
												href="javascript:find('咖啡师');">咖啡师</a> <a
												href="javascript:find('送餐员');">送餐员</a> <a
												href="javascript:find('餐饮店长');">餐饮店长</a> <a
												href="javascript:find('领班');">领班</a>
										</div>
									</li>
									<li>
										<h4>零售</h4>
										<div class="text">
											<a href="javascript:find('巡店');">巡店</a> <a
												href="javascript:find('陈列员');">陈列员</a> <a
												href="javascript:find('理货员');">理货员</a> <a
												href="javascript:find('零售');">零售</a> <a
												href="javascript:find('收银');">收银</a> <a
												href="javascript:find('导购');" class="cur">导购</a> <a
												href="javascript:find('店员');">店员</a> <a
												href="javascript:find('门店店长');">门店店长</a>
										</div>
									</li>
									<li>
										<h4>美容/健身</h4>
										<div class="text">
											<a href="javascript:find('发型师');">发型师</a> <a
												href="javascript:find('美甲师');">美甲师</a> <a
												href="javascript:find('化妆师');">化妆师</a> <a
												href="javascript:find('健身');">健身</a> <a
												href="javascript:find('瑜伽教练');">瑜伽教练</a> <a
												href="javascript:find('瘦身顾问');">瘦身顾问</a> <a
												href="javascript:find('游泳教练');" class="cur">游泳教练</a> <a
												href="javascript:find('美体教练');">美体教练</a> <a
												href="javascript:find('顾问');">顾问</a> <a
												href="javascript:find('舞蹈教练');">舞蹈教练</a> <a
												href="javascript:find('健身教练');">健身教练</a>
										</div>
									</li>
									<li>
										<h4>其他服务业职位</h4>
										<div class="text">
											<a href="javascript:find('服务');">其他服务业职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>生产制造</b> <a
									href="javascript:find('生产总监');">生产总监</a> <a
									href="javascript:find('安全员');">安全员</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">生产制造</p>
								<ul>
									<li>
										<h4>生产营运</h4>
										<div class="text">
											<a href="javascript:find('生产营运');">生产营运</a> <a
												href="javascript:find('厂长');">厂长</a> <a
												href="javascript:find('生产总监');">生产总监</a> <a
												href="javascript:find('车间主任');">车间主任</a> <a
												href="javascript:find('生产组长');">生产组长</a> <a
												href="javascript:find('生产员');">生产员</a> <a
												href="javascript:find('生产设备管理');">生产设备管理</a> <a
												href="javascript:find('生产计划');">生产计划</a> <a
												href="javascript:find('生产跟单');" class="cur">生产跟单</a>
										</div>
									</li>
									<li>
										<h4>质量安全</h4>
										<div class="text">
											<a href="javascript:find('质量管理');">质量管理</a> <a
												href="javascript:find('可靠度工程师');">可靠度工程师</a> <a
												href="javascript:find('故障分析师');">故障分析师</a> <a
												href="javascript:find('认证工程师');">认证工程师</a> <a
												href="javascript:find('体系工程师');">体系工程师</a> <a
												href="javascript:find('审核员');">审核员</a> <a
												href="javascript:find('安全员');">安全员</a>
										</div>
									</li>
									<li>
										<h4>机械设计/制造</h4>
										<div class="text">
											<a href="javascript:find('机械制造');">机械设计/制造</a> <a
												href="javascript:find('机械工程师');">机械工程师</a> <a
												href="javascript:find('机械设计师');">机械设计师</a> <a
												href="javascript:find('机械设备工程师');">机械设备工程师</a> <a
												href="javascript:find('机械维修');">机械维修/保养</a> <a
												href="javascript:find('机械制图');">机械制图</a> <a
												href="javascript:find('机械结构工程师');">机械结构工程师</a> <a
												href="javascript:find('工业工程师');" class="cur">工业工程师</a> <a
												href="javascript:find('工艺工程师');">工艺/制程工程师</a> <a
												href="javascript:find('材料工程师');">材料工程师</a> <a
												href="javascript:find('机电工程师');">机电工程师</a> <a
												href="javascript:find('数控');">CNC/数控</a> <a
												href="javascript:find('冲压工程师');">冲压工程师</a> <a
												href="javascript:find('夹具工程师');">夹具工程师</a> <a
												href="javascript:find('模具工程师');">模具工程师</a> <a
												href="javascript:find('焊接工程师');">焊接工程师</a> <a
												href="javascript:find('注塑工程师');">注塑工程师</a> <a
												href="javascript:find('锻造工程师');">铸造/锻造工程师</a>
										</div>
									</li>
									<li>
										<h4>化工</h4>
										<div class="text">
											<a href="javascript:find('化工');">化工</a> <a
												href="javascript:find('化工工程师');">化工工程师</a> <a
												href="javascript:find('实验室技术员');">实验室技术员</a> <a
												href="javascript:find('化学分析');">化学分析</a> <a
												href="javascript:find('涂料研发');" class="cur">涂料研发</a> <a
												href="javascript:find('化妆品研发');">化妆品研发</a> <a
												href="javascript:find('食品研发');">食品/饮料研发</a>
										</div>
									</li>
									<li>
										<h4>服装/纺织/皮革</h4>
										<div class="text">
											<a href="javascript:find('服装设计');">服装设计</a> <a
												href="javascript:find('女装设计');">女装设计</a> <a
												href="javascript:find('男装设计');">男装设计</a> <a
												href="javascript:find('童装设计');">童装设计</a> <a
												href="javascript:find('内衣设计');">内衣设计</a> <a
												href="javascript:find('面料设计');">面料设计</a> <a
												href="javascript:find('面料辅料开发');">面料辅料开发</a> <a
												href="javascript:find('面料辅料采购');" class="cur">面料辅料采购</a> <a
												href="javascript:find('打样');">打样/制版</a> <a
												href="javascript:find('服装');">服装/纺织/皮革跟单</a>
										</div>
									</li>
									<li>
										<h4>技工/普工</h4>
										<div class="text">
											<a href="javascript:find('普工');">普工/操作工</a> <a
												href="javascript:find('叉车');">叉车</a> <a
												href="javascript:find('铲车');">铲车</a> <a
												href="javascript:find('焊工');">焊工</a> <a
												href="javascript:find('氩弧焊工');">氩弧焊工</a> <a
												href="javascript:find('电工');">电工</a> <a
												href="javascript:find('木工');">木工</a> <a
												href="javascript:find('漆工');">漆工</a> <a
												href="javascript:find('车工');">车工</a> <a
												href="javascript:find('磨工');">磨工</a> <a
												href="javascript:find('铣工');">铣工</a> <a
												href="javascript:find('钳工');">钳工</a> <a
												href="javascript:find('钻工');">钻工</a> <a
												href="javascript:find('铆工');">铆工</a> <a
												href="javascript:find('钣金');">钣金</a> <a
												href="javascript:find('抛光');" class="cur">抛光</a> <a
												href="javascript:find('机修工');">机修工</a> <a
												href="javascript:find('折弯工');">折弯工</a> <a
												href="javascript:find('电镀工');">电镀工</a> <a
												href="javascript:find('喷塑工');">喷塑工</a> <a
												href="javascript:find('注塑工');">注塑工</a> <a
												href="javascript:find('组装工');">组装工</a> <a
												href="javascript:find('包装工');">包装工</a> <a
												href="javascript:find('空调工');">空调工</a> <a
												href="javascript:find('电梯工');">电梯工</a> <a
												href="javascript:find('锅炉工');">锅炉工</a> <a
												href="javascript:find('学徒工');">学徒工</a>
										</div>
									</li>
									<li>
										<h4>其他生产制造职位</h4>
										<div class="text">
											<a href="javascript:find('工');">其他生产制造职位</a>
										</div>
									</li>
								</ul>
							</div>
							<div class="menu-line"></div>
							<div class="menu-sub">
							<p>
							</div>
						</dl>
					</div>
				</div>
				<!--<div class="promotion-img"><a href="#"<img src="http://172.16.0.44/v2/web/geek/images/promotion-1.png" alt="" /></a></div>-->
			</div>
			<div class="home-main">
				<div class="slider-box">
					<div class="promotion-main"> 
							<img width="842" height="352" src="../pic/index.gif">
							<p>
								<br />
							</p>
							</div>
							</div>
							</div>
							<!--职位tab列表-->
							<div class="common-tab-box job-tab-box">
								<h3>
									<span class="cur" class="index_rcmd_job_type_1">IT·互联网</span><span
										class="" class="index_rcmd_job_type_2">金融</span><span class=""
										class="index_rcmd_job_type_3">房地产·建筑</span><span class=""
										class="index_rcmd_job_type_4">教育培训</span><span class=""
										class="index_rcmd_job_type_5">汽车</span><span class=""
										class="index_rcmd_job_type_6">娱乐传媒</span><span class=""
										class="index_rcmd_job_type_7">医疗健康</span><span class=""
										class="index_rcmd_job_type_8">法律咨询</span><span class=""
										class="index_rcmd_job_type_9">供应链·物流</span><span class=""
										class="index_rcmd_job_type_10">采购贸易</span>
								</h3>
								<ul class="cur">
									<li>
										<div class="sub-li">
											<a href="/job_detail/662cfca21e33d89d1nN709y0E1o~.html"
												class="index_rcmd_job_1" class="job-info" target="_blank">
												<p>
													PaaS 平台架构师<span class="salary">30k-60k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>5-10年<spanclass="vline"></span>本科
												</p>
											</a> <a href="/gongsi/5d627415a46b4a750nJ9.html"
												class="index_rcmd_company_1_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img.bosszhipin.com/beijin/mcs/useravatar/20161029/4143387eb20e3844acffc59e4e5a737b0d134aacfbf05599545b8a07b2304489_s.jpg"
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20161029/4143387eb20e3844acffc59e4e5a737b0d134aacfbf05599545b8a07b2304489_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">阿里巴巴集团 <span class="user-text">李颜良<span
														class="vline"></span>技术专家
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/abcbd241006b207b1XR83dW6FlM~.html"
												class="index_rcmd_job_2" class="job-info" target="_blank">
												<p>
													测试开发<span class="salary">20k-40k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>3-5年<span class="vline"></span>硕士
												</p>
											</a> <a href="/gongsi/fc6aa2d64e0a34b01n1y0t29.html"
												class="index_rcmd_company_2_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_7.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">美团点评 <span class="user-text">牛小彬<span
														class="vline"></span>测试负责人
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/017c1317aa50f89f1HZ_3Ni6FVs~.html"
												class="index_rcmd_job_3" class="job-info" target="_blank">
												<p>
													测试开发专家<span class="salary">30k-50k</span>
												</p>
												<p class="job-text">
													杭州<span class="vline"></span>3-5年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/e9a2427bc19f1b1a33Z_3t0~.html"
												class="index_rcmd_company_3_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_1.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">蚂蚁金服 <span class="user-text">梁雪<span
														class="vline"></span>测试开发专家
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/0443cd1a3322e32b1Hd62du9F1Q~.html"
												class="index_rcmd_job_4" class="job-info" target="_blank">
												<p>
													后台开发工程师<span class="salary">20k-35k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/2e64a887a110ea9f1nRz.html"
												class="index_rcmd_company_4_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_7.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">腾讯 <span class="user-text">李远池<span
														class="vline"></span>后台高级工程师
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/307bca704747f0b81Hd62du6FlU~.html"
												class="index_rcmd_job_5" class="job-info" target="_blank">
												<p>
													Linux内核高级工程师<span class="salary">30k-60k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/2e64a887a110ea9f1nRz.html"
												class="index_rcmd_company_5_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190127/46fe5d444d4064b26729bca051b6c5afdeffa9ef9665f33a71d0d360626d173c_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">腾讯 <span class="user-text">陆志刚<span
														class="vline"></span>高级工程师
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/599806dab44de4981HNz2tS_E1Q~.html"
												class="index_rcmd_job_6" class="job-info" target="_blank">
												<p>
													蚂蚁金服-高级测试开发工程师<span class="salary">25k-45k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>3-5年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/5d627415a46b4a750nJ9.html"
												class="index_rcmd_company_6_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_7.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">阿里巴巴集团 <span class="user-text">钟超军<span
														class="vline"></span>高级开发工程师
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/07fc6c8000d017581Hx72t-9GVs~.html"
												class="index_rcmd_job_7" class="job-info" target="_blank">
												<p>
													蚂蚁金服-国际事业群-Java开发专家<span class="salary">30k-60k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/5d627415a46b4a750nJ9.html"
												class="index_rcmd_company_7_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_7.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">阿里巴巴集团 <span class="user-text">钟超军<span
														class="vline"></span>高级开发工程师
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/ab97a8b0edf78a921Hx72ty9E1c~.html"
												class="index_rcmd_job_8" class="job-info" target="_blank">
												<p>
													阿里云事业群-资深JAVA工程师<span class="salary">30k-60k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/5d627415a46b4a750nJ9.html"
												class="index_rcmd_company_8_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_7.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">阿里巴巴集团 <span class="user-text">钟超军<span
														class="vline"></span>高级开发工程师
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/4dbe03e023f6a71e1Hx73dy_EVo~.html"
												class="index_rcmd_job_9" class="job-info" target="_blank">
												<p>
													阿里集团-数据技术工程师<span class="salary">30k-60k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>3-5年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/5d627415a46b4a750nJ9.html"
												class="index_rcmd_company_9_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_7.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">阿里巴巴集团 <span class="user-text">钟超军<span
														class="vline"></span>高级开发工程师
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<ul class="">
									<li>
										<div class="sub-li">
											<a href="/job_detail/bd3f91523c39f1430HZ70tm1Fw~~.html"
												class="index_rcmd_job_10" class="job-info" target="_blank">
												<p>
													金融内训课程总监<span class="salary">20k-40k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>10年以上<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/2e2e2be08af65d071XJ909u1.html"
												class="index_rcmd_company_10_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img.bosszhipin.com/beijin/mcs/useravatar/20160507/f6bdbfedd90f30122849d689abaee633cf6ce033e2eef4eb39a85dd410916580_s.jpg"
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20160507/f6bdbfedd90f30122849d689abaee633cf6ce033e2eef4eb39a85dd410916580_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">金融职业经理人 <span class="user-text">张宏杰<span
														class="vline"></span>招聘者
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/d7d0d5dac4cad8b01HV5396-FVs~.html"
												class="index_rcmd_job_11" class="job-info" target="_blank">
												<p>
													金融产品经理<span class="salary">20k-30k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/6264c2716096e77e1XF43Ns~.html"
												class="index_rcmd_company_11_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180625/0fe0c26c115fd9f8cdfad649ab75a0afae45e2d55c493aef6366434e9a942137_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">友信 <span class="user-text">陈静<span
														class="vline"></span>HRBP
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/e5bcb2fce64d52151XZz2N69EFM~.html"
												class="index_rcmd_job_12" class="job-info" target="_blank">
												<p>
													金融产品经理<span class="salary">12k-18k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/b476e7aef816cdc11ndz294~.html"
												class="index_rcmd_company_12_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180524/ce6ab8456f5878f341d4f9857c25ee08bf387cd56f96466054251a71f5e344e3_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">华信金融 <span class="user-text">李有昌<span
														class="vline"></span>经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/1ae1e7e6f9ca42321nx639W4FFQ~.html"
												class="index_rcmd_job_13" class="job-info" target="_blank">
												<p>
													金融Java高级<span class="salary">18k-30k</span>
												</p>
												<p class="job-text">
													成都<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/5ea359d44084ec4c03J63A~~.html"
												class="index_rcmd_company_13_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20160831/069536695d57fbca27404caccdd6236972fee5adde63d761571096eb0e950a54_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">货车帮 <span class="user-text">宋旭智<span
														class="vline"></span>JAVA开发工程师
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/cd95e59f5c020d6d1HZy39y4FFY~.html"
												class="index_rcmd_job_14" class="job-info" target="_blank">
												<p>
													产品经理(消费金融)<span class="salary">12k-20k</span>
												</p>
												<p class="job-text">
													石家庄<span class="vline"></span>3-5年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/51c8279b3026dee31nFz3dq8Eg~~.html"
												class="index_rcmd_company_14_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190107/d135dae27d441a4a6a293a6ae896217af4b2437120d392c2b90d54199b41e9e8_s.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">幸福金科 <span class="user-text">李云飞<span
														class="vline"></span>项目经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/99ae3ddd0f95aef81nN739m-F1E~.html"
												class="index_rcmd_job_15" class="job-info" target="_blank">
												<p>
													金融产品经理<span class="salary">10k-20k</span>
												</p>
												<p class="job-text">
													无锡<span class="vline"></span>经验不限<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/5484657036f9b03a1XJ-3dS-.html"
												class="index_rcmd_company_15_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20170824/c6721c9aca08767af0e16a0172c2d94d7e36513db9ee08030bccf087a53c7127_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">民投金融 <span class="user-text">尹俊峰<span
														class="vline"></span>营业部经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/5e27dca052b29f8f1HB62dS-ElA~.html"
												class="index_rcmd_job_16" class="job-info" target="_blank">
												<p>
													软件测试-金融项目<span class="salary">6k-10k</span>
												</p>
												<p class="job-text">
													宁波<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/b9edbaad26519c1f1nN409-8.html"
												class="index_rcmd_company_16_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/mcs/useravatar/20150807/468f2364d68c6eabc721ed8f5f0d8aa28c7dd922ad47494fc02c388e12c00eac_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">博为峰软件 <span class="user-text">陶迎<span
														class="vline"></span>招聘专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/817ec6a64c763f9a1HV53920Elc~.html"
												class="index_rcmd_job_17" class="job-info" target="_blank">
												<p>
													资深金融产品经理<span class="salary">25k-45k</span>
												</p>
												<p class="job-text">
													杭州<span class="vline"></span>3-5年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/71f70f7aa52429bd33R43d28.html"
												class="index_rcmd_company_17_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180416/8188b81ae3c33958dba6814da8ce29f50e0514c4358c92c76632ab489108d5bf_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">vivo <span class="user-text">唐蜜<span
														class="vline"></span>HR招聘
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/6a06da1681143f2f1nV60t28EVo~.html"
												class="index_rcmd_job_18" class="job-info" target="_blank">
												<p>
													测试工程师（金融方向）<span class="salary">10k-20k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/b0ea65c1b3705ba30HV60t--.html"
												class="index_rcmd_company_18_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_6.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">随手科技 <span class="user-text">李靖<span
														class="vline"></span>测试总监
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<ul class="">
									<li>
										<div class="sub-li">
											<a href="/job_detail/ca075ff2cf4340fc1XF909y5E1c~.html"
												class="index_rcmd_job_19" class="job-info" target="_blank">
												<p>
													高级建筑设计师（地产施工图）<span class="salary">15k-30k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>经验不限<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/aff3a2aa29b3825a03d539-0.html"
												class="index_rcmd_company_19_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img.bosszhipin.com/beijin/mcs/useravatar/20171107/14ef9174a9ca6e57f6d8d4cea840e56f9cdf49f60f97ad748c5329a0da274548_s.jpg"
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20171107/14ef9174a9ca6e57f6d8d4cea840e56f9cdf49f60f97ad748c5329a0da274548_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">华强方特 <span class="user-text">黄福香<span
														class="vline"></span>招聘经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/729375829b4e28f71Xx62tm1ElE~.html"
												class="index_rcmd_job_20" class="job-info" target="_blank">
												<p>
													房地产/建筑公司会计主管<span class="salary">5k-6k</span>
												</p>
												<p class="job-text">
													南宁<span class="vline"></span>5-10年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/9e545f959746a36e1n1y2ty5Fw~~.html"
												class="index_rcmd_company_20_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180524/c82c880b03145f5a89a97c7b3fd9df2ef1c0cabebaff9b1d00a1adaaeb4b5fef_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">建开 <span class="user-text">黄春霞<span
														class="vline"></span>HR
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/cd68562dccc247be1Hd40966EVQ~.html"
												class="index_rcmd_job_21" class="job-info" target="_blank">
												<p>
													三维建筑地产、产品、规划影片项目经理/导演<span class="salary">8k-13k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>3-5年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/cd8bf046dc99569f1nxy3dS-Ew~~.html"
												class="index_rcmd_company_21_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190108/6806c91ceae479e18c865997dc2ab0b794f22977a2214c0e185f6ebc5ebb71e8_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">奥视数字视觉 <span class="user-text">邓丽娴<span
														class="vline"></span>招聘者
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/5919d439f517a1311XF83tW6GVo~.html"
												class="index_rcmd_job_22" class="job-info" target="_blank">
												<p>
													项目管理（房产建筑行业）<span class="salary">8k-14k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>经验不限<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/90a224d77c8fe9301nN80tm0Fg~~.html"
												class="index_rcmd_company_22_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180622/18cdef98fde8dd1dde4eec25d27551f23679e77e345d938bdecbe1031918fd71_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">华强方特 <span class="user-text">林女士<span
														class="vline"></span>招聘经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/e4696a80d59e9c6a1XR53ti1FFM~.html"
												class="index_rcmd_job_23" class="job-info" target="_blank">
												<p>
													建筑师助理<span class="salary">10k-11k</span>
												</p>
												<p class="job-text">
													重庆<span class="vline"></span>1年以内<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/5fcc76d4d78a9f7f1n170tS4Eg~~.html"
												class="index_rcmd_company_23_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180513/b4f1184067b1a356abe22aa157c558fa3ac5fae0ff6246c25eb734c287a6de81_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">重庆卓创 <span class="user-text">程伟<span
														class="vline"></span>设计总监
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/0577061dac3b50ac1n1_0tm5FVY~.html"
												class="index_rcmd_job_24" class="job-info" target="_blank">
												<p>
													建筑设计师<span class="salary">20k-40k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>3-5年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/71f70f7aa52429bd33R43d28.html"
												class="index_rcmd_company_24_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20171127/22e0043408b622948300c66719c657f11644cd58dbc44b3acce154623e5b9163_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">vivo <span class="user-text">陈亚伦<span
														class="vline"></span>招聘经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/3407f6d3682e8db51nB409-5EVo~.html"
												class="index_rcmd_job_25" class="job-info" target="_blank">
												<p>
													建筑方案设计<span class="salary">5k-8k</span>
												</p>
												<p class="job-text">
													南宁<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/198c10669731861a1nx50926.html"
												class="index_rcmd_company_25_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20170913/f533dbebb1bc5b4179343f8720a5a2f7e713082401a61e29307db3bd00be6e17_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">基准方中 <span class="user-text">周鑫<span
														class="vline"></span>HR
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/d8c0dc93d17f2c011HV_2tm9E1A~.html"
												class="index_rcmd_job_26" class="job-info" target="_blank">
												<p>
													建筑bim运维管理经理<span class="salary">30k-40k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/ad0308c6c00ba0af1XZ-3dq4EQ~~.html"
												class="index_rcmd_company_26_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_4.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">上海建工四建 <span class="user-text">丁以玲<span
														class="vline"></span>人事专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/790e5a8583eb44820HZ829-6EQ~~.html"
												class="index_rcmd_job_27" class="job-info" target="_blank">
												<p>
													建筑师<span class="salary">9k-12k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/66efba64d012fc6233J43ti_.html"
												class="index_rcmd_company_27_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_6.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">深圳建筑设计总院 <span class="user-text">苑宁<span
														class="vline"></span>所长
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<ul class="">
									<li>
										<div class="sub-li">
											<a href="/job_detail/b1aeab5cb87256b31nJ709y0F1c~.html"
												class="index_rcmd_job_28" class="job-info" target="_blank">
												<p>
													产品专员<span class="salary">6k-12k</span>
												</p>
												<p class="job-text">
													郑州<span class="vline"></span>经验不限<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/c38b4015d2cf7a460Xxz39q4.html"
												class="index_rcmd_company_28_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190301/4656e183feeb1106735eb4af28c092a24affc5d2b9ec7446814eb483fa936d33_s.png"
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190301/4656e183feeb1106735eb4af28c092a24affc5d2b9ec7446814eb483fa936d33_s.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">TutorABC <span class="user-text">李大君<span
														class="vline"></span>业务主管
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/71b5794a304e1d8c1XB93t20ElU~.html"
												class="index_rcmd_job_29" class="job-info" target="_blank">
												<p>
													招生/课程顾问/销售<span class="salary">10k-20k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>经验不限<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/04f11eb0d2934e7b1HZ82960.html"
												class="index_rcmd_company_29_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20171222/e8baa9ca56ae745b1b353e5d5edb5d729cfe53e6a42ee49f9fd1e40d48a736bb_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">弘毅国学 <span class="user-text">任小蓉<span
														class="vline"></span>招聘经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/5adaa8cccfe80c761n160924FFA~.html"
												class="index_rcmd_job_30" class="job-info" target="_blank">
												<p>
													古筝老师（上海各校区）<span class="salary">6k-12k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>经验不限<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/04f11eb0d2934e7b1HZ82960.html"
												class="index_rcmd_company_30_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20171222/e8baa9ca56ae745b1b353e5d5edb5d729cfe53e6a42ee49f9fd1e40d48a736bb_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">弘毅国学 <span class="user-text">任小蓉<span
														class="vline"></span>招聘经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/c6a3a6ad12c651f21Xd42t20GFE~.html"
												class="index_rcmd_job_31" class="job-info" target="_blank">
												<p>
													招生/课程顾问（上海各校区）<span class="salary">10k-20k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>1-3年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/04f11eb0d2934e7b1HZ82960.html"
												class="index_rcmd_company_31_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20171222/e8baa9ca56ae745b1b353e5d5edb5d729cfe53e6a42ee49f9fd1e40d48a736bb_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">弘毅国学 <span class="user-text">任小蓉<span
														class="vline"></span>招聘经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/93440810677f6bb81HZ-3Nq5FFY~.html"
												class="index_rcmd_job_32" class="job-info" target="_blank">
												<p>
													课程顾问<span class="salary">7k-10k</span>
												</p>
												<p class="job-text">
													湖州<span class="vline"></span>经验不限<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/04f11eb0d2934e7b1HZ82960.html"
												class="index_rcmd_company_32_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_9.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">弘毅国学 <span class="user-text">覃燕清<span
														class="vline"></span>招聘专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/96839ffd8d594a511HZ-3Nm_F1I~.html"
												class="index_rcmd_job_33" class="job-info" target="_blank">
												<p>
													市场专员<span class="salary">6k-8k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>经验不限<span class="vline"></span>高中
												</p>
											</a> <a href="/gongsi/04f11eb0d2934e7b1HZ82960.html"
												class="index_rcmd_company_33_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_9.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">弘毅国学 <span class="user-text">覃燕清<span
														class="vline"></span>招聘专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/4ae8e3c846ecdaef1HRy3ti6EVY~.html"
												class="index_rcmd_job_34" class="job-info" target="_blank">
												<p>
													古筝老师<span class="salary">6k-10k</span>
												</p>
												<p class="job-text">
													湖州<span class="vline"></span>经验不限<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/04f11eb0d2934e7b1HZ82960.html"
												class="index_rcmd_company_34_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_9.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">弘毅国学 <span class="user-text">覃燕清<span
														class="vline"></span>招聘专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/813560f88de841d31XF63N25ElY~.html"
												class="index_rcmd_job_35" class="job-info" target="_blank">
												<p>
													校长/储备校长<span class="salary">15k-20k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/04f11eb0d2934e7b1HZ82960.html"
												class="index_rcmd_company_35_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180717/23385127ad3e7b1b057ff8033b7a0f512e7c7edec7b1ba0924351a4b24432e8d_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">弘毅国学 <span class="user-text">高先生<span
														class="vline"></span>HR
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/cc0478b39fbb5f2e1XFy2t28ElU~.html"
												class="index_rcmd_job_36" class="job-info" target="_blank">
												<p>
													招生咨询/课程顾问<span class="salary">10k-15k</span>
												</p>
												<p class="job-text">
													湖州<span class="vline"></span>经验不限<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/04f11eb0d2934e7b1HZ82960.html"
												class="index_rcmd_company_36_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180717/23385127ad3e7b1b057ff8033b7a0f512e7c7edec7b1ba0924351a4b24432e8d_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">弘毅国学 <span class="user-text">高先生<span
														class="vline"></span>HR
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<ul class="">
									<li>
										<div class="sub-li">
											<a href="/job_detail/f0c8d431df8262a51nB63t20GFE~.html"
												class="index_rcmd_job_37" class="job-info" target="_blank">
												<p>
													汽车编辑<span class="salary">8k-13k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>经验不限<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/94ac4a63c659925c1XBz3Ni-.html"
												class="index_rcmd_company_37_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180706/bf64275fba825e938e36a9b76a580a2bcfcd208495d565ef66e7dff9f98764da_s.jpg"
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180706/bf64275fba825e938e36a9b76a580a2bcfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">爱卡汽车 <span class="user-text">孙雨<span
														class="vline"></span>HRBP
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/5bc7be443d42374b1HR-3dm7GFI~.html"
												class="index_rcmd_job_38" class="job-info" target="_blank">
												<p>
													汽车美容<span class="salary">5k-7k</span>
												</p>
												<p class="job-text">
													成都<span class="vline"></span>经验不限<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/beb5efa61234096003V-0t64.html"
												class="index_rcmd_company_38_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_9.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">建国汽车 <span class="user-text">蔡女士<span
														class="vline"></span>招聘专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/01e7347c1b25db841XN62t61EVU~.html"
												class="index_rcmd_job_39" class="job-info" target="_blank">
												<p>
													汽车<span class="salary">5k-8k</span>
												</p>
												<p class="job-text">
													佛山<span class="vline"></span>经验不限<span class="vline"></span>中专/中技
												</p>
											</a> <a href="/gongsi/20e70d222606db4c1Xd-3NS4.html"
												class="index_rcmd_company_39_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20171021/e6a726699ded4b6be833f50ad64f9f1494e5392eb245e23a7474737595f7f376_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">喜相逢汽车 <span class="user-text">林萍<span
														class="vline"></span>行政
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/4206a70da52ae4b11XF_3N-8EVE~.html"
												class="index_rcmd_job_40" class="job-info" target="_blank">
												<p>
													汽车销售经理<span class="salary">6k-12k</span>
												</p>
												<p class="job-text">
													中山<span class="vline"></span>1年以内<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/3103c4ed295ea3c81XZ739-5GA~~.html"
												class="index_rcmd_company_40_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180813/20d703a96b5f9b7af5a548a45320c17b17156ed6106fb9ae0d6cc1be4306e08d_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">赢时通 <span class="user-text">李健勇<span
														class="vline"></span>经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/c7d99e425153cf691XJ83dy9F1c~.html"
												class="index_rcmd_job_41" class="job-info" target="_blank">
												<p>
													汽车销售<span class="salary">6k-7k</span>
												</p>
												<p class="job-text">
													石家庄<span class="vline"></span>经验不限<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/bf0fdd8a8b72aaae1nB92d-4GA~~.html"
												class="index_rcmd_company_41_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180530/0d4de142771b610effb78f5efd4f60d7cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">山西喜相逢 <span class="user-text">赵丹红<span
														class="vline"></span>人事专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/4f9c4ed78816ee851XJz3ti5Els~.html"
												class="index_rcmd_job_42" class="job-info" target="_blank">
												<p>
													汽车销售<span class="salary">5k-8k</span>
												</p>
												<p class="job-text">
													廊坊<span class="vline"></span>经验不限<span class="vline"></span>高中
												</p>
											</a> <a href="/gongsi/bf0fdd8a8b72aaae1nB92d-4GA~~.html"
												class="index_rcmd_company_42_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180530/0d4de142771b610effb78f5efd4f60d7cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">山西喜相逢 <span class="user-text">赵丹红<span
														class="vline"></span>人事专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/86df6b18267ca4a91XJz3ti5FFM~.html"
												class="index_rcmd_job_43" class="job-info" target="_blank">
												<p>
													汽车销售<span class="salary">5k-9k</span>
												</p>
												<p class="job-text">
													石家庄<span class="vline"></span>经验不限<span class="vline"></span>高中
												</p>
											</a> <a href="/gongsi/bf0fdd8a8b72aaae1nB92d-4GA~~.html"
												class="index_rcmd_company_43_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180530/0d4de142771b610effb78f5efd4f60d7cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">山西喜相逢 <span class="user-text">赵丹红<span
														class="vline"></span>人事专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/184917803e0754d21XN_3dm8E1o~.html"
												class="index_rcmd_job_44" class="job-info" target="_blank">
												<p>
													汽车销售<span class="salary">5k-9k</span>
												</p>
												<p class="job-text">
													石家庄<span class="vline"></span>应届生<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/bf0fdd8a8b72aaae1nB92d-4GA~~.html"
												class="index_rcmd_company_44_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180530/0d4de142771b610effb78f5efd4f60d7cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">山西喜相逢 <span class="user-text">赵丹红<span
														class="vline"></span>人事专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/345006af264a5b4c1XF-09y9FVU~.html"
												class="index_rcmd_job_45" class="job-info" target="_blank">
												<p>
													汽车销售<span class="salary">8k-11k</span>
												</p>
												<p class="job-text">
													太原<span class="vline"></span>经验不限<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/bf0fdd8a8b72aaae1nB92d-4GA~~.html"
												class="index_rcmd_company_45_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180530/0d4de142771b610effb78f5efd4f60d7cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">山西喜相逢 <span class="user-text">赵丹红<span
														class="vline"></span>人事专员
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<ul class="">
									<li>
										<div class="sub-li">
											<a href="/job_detail/968af6e46f000cd41XF_2dS8E1o~.html"
												class="index_rcmd_job_46" class="job-info" target="_blank">
												<p>
													传媒行业<span class="salary">5k-10k</span>
												</p>
												<p class="job-text">
													长春<span class="vline"></span>经验不限<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/8506be1048edb4261nV709y6FQ~~.html"
												class="index_rcmd_company_46_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180828/09b5b75746dea4d857d6243e936cd87c48df85e010b45c950ac548e207b295a3_s.jpg"
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180828/09b5b75746dea4d857d6243e936cd87c48df85e010b45c950ac548e207b295a3_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">盛纳传媒 <span class="user-text">张先生<span
														class="vline"></span>人事专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/653761e5aa1bc66f1Xd72d67GVA~.html"
												class="index_rcmd_job_47" class="job-info" target="_blank">
												<p>
													传媒<span class="salary">8k-9k</span>
												</p>
												<p class="job-text">
													沈阳<span class="vline"></span>经验不限<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/cac0388489a330c71nRz09W_GQ~~.html"
												class="index_rcmd_company_47_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180831/5f6db859309d418a09d62b44f7552a850a970ad76b6a1081ed65293886b2690b_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">煜鼎文化 <span class="user-text">孙璐<span
														class="vline"></span>人事主管
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/a8c0965d53e84a3a1XJ_29W_FlY~.html"
												class="index_rcmd_job_48" class="job-info" target="_blank">
												<p>
													传媒<span class="salary">5k-10k</span>
												</p>
												<p class="job-text">
													长春<span class="vline"></span>1年以内<span class="vline"></span>初中及以下
												</p>
											</a> <a href="/gongsi/8506be1048edb4261nV709y6FQ~~.html"
												class="index_rcmd_company_48_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180914/56d42208816c6f872c8919e1b1601fdcb20f2b2458cc1081cee49b555ed9a2fa_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">盛纳传媒 <span class="user-text">丁女士<span
														class="vline"></span>人事经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/619ba2caf98a36bd1Hd_39y9FVU~.html"
												class="index_rcmd_job_49" class="job-info" target="_blank">
												<p>
													传媒总监<span class="salary">10k-15k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>5-10年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/d601f30ebc302c491XVz0928Fw~~.html"
												class="index_rcmd_company_49_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190208/1e5e6613cde8103452e587ac9a77a985cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">深圳分享梦工场影... <span class="user-text">毛艳红<span
														class="vline"></span>法人
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/f154c8e98aef9b141HZ409W9EVA~.html"
												class="index_rcmd_job_50" class="job-info" target="_blank">
												<p>
													文化传媒顾问<span class="salary">5k-7k</span>
												</p>
												<p class="job-text">
													广州<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/afad4ced6bc6c6351HR52dW4GQ~~.html"
												class="index_rcmd_company_50_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20170503/eac2526d8172435f89c93f6d8ceb837b8c7dd922ad47494fc02c388e12c00eac_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">深圳市远界信息科... <span class="user-text">李戎戎<span
														class="vline"></span>招聘者
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/e6c06bb5d13c4cbd1HV52t-1EVQ~.html"
												class="index_rcmd_job_51" class="job-info" target="_blank">
												<p>
													传媒文案<span class="salary">6k-10k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>经验不限<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/4812f21e5deec3681HJz396-.html"
												class="index_rcmd_company_51_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180427/6b9eb77a95457390ee14c3b29dbe27239e32033e375c4c17527872860ca0d9c6_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">艺星美容医院 <span class="user-text">陈先生<span
														class="vline"></span>人事
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/f674b282b89f03501XV93N-5EVU~.html"
												class="index_rcmd_job_52" class="job-info" target="_blank">
												<p>
													传媒老师<span class="salary">6k-12k</span>
												</p>
												<p class="job-text">
													南昌<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/c5cc930fe20dae831XV629-8Eg~~.html"
												class="index_rcmd_company_52_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180808/2fab6c91bbe6573ada0c5186f6900c718b4caa434d6f31ff51b92bc46a7b6cf8_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">南艺人教育 <span class="user-text">何女士<span
														class="vline"></span>招聘者
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/394fedb7a96507b91Hdz3Nq6ElE~.html"
												class="index_rcmd_job_53" class="job-info" target="_blank">
												<p>
													传媒企划经理<span class="salary">6k-8k</span>
												</p>
												<p class="job-text">
													海口<span class="vline"></span>3-5年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/46f6b1685d7f27e60HRz2dW1.html"
												class="index_rcmd_company_53_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190118/156161fed00f4af0a59bd0043af7a5fe880af16ee59ef477d2bfed2293abb6bb_s.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">红妆美容管理 <span class="user-text">刘旭<span
														class="vline"></span>招聘主管
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/0aa84a897d96af791XF43du7EVY~.html"
												class="index_rcmd_job_54" class="job-info" target="_blank">
												<p>
													艺歌传媒<span class="salary">8k-10k</span>
												</p>
												<p class="job-text">
													杭州<span class="vline"></span>经验不限<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/8fb6ed4f9d48334d1nJ739q9GQ~~.html"
												class="index_rcmd_company_54_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180824/ebf12ef7124efd37e1f91ce09990d27a374ff3fdeaa121b9da412fbb8bb2b39d_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">艺歌传媒 <span class="user-text">俞毅<span
														class="vline"></span>招聘者
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<ul class="">
									<li>
										<div class="sub-li">
											<a href="/job_detail/035b0eb7c8a503121HVz2d-0FFs~.html"
												class="index_rcmd_job_55" class="job-info" target="_blank">
												<p>
													项目经理（医疗健康）<span class="salary">12k-18k</span>
												</p>
												<p class="job-text">
													杭州<span class="vline"></span>3-5年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/4536c3e3d5d5dfcc1H172Ng~.html"
												class="index_rcmd_company_55_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190319/e6f87622e6274a22f73004fe384e4016cfcd208495d565ef66e7dff9f98764da_s.jpg"
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190319/e6f87622e6274a22f73004fe384e4016cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">禾连健康 <span class="user-text">潘海玉<span
														class="vline"></span>招聘专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/97db34639a8e257a1HB539u_FFA~.html"
												class="index_rcmd_job_56" class="job-info" target="_blank">
												<p>
													医疗健康高级后台开发工程师<span class="salary">25k-50k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/2e64a887a110ea9f1nRz.html"
												class="index_rcmd_company_56_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_10.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">腾讯 <span class="user-text">张女士<span
														class="vline"></span>HR
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/83f73e7f434cdd751nNy3Nu_EFM~.html"
												class="index_rcmd_job_57" class="job-info" target="_blank">
												<p>
													产品经理（医疗健康）<span class="salary">15k-25k</span>
												</p>
												<p class="job-text">
													广州<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/93f7ed011d76da801XBz3dS6.html"
												class="index_rcmd_company_57_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20170606/d78506c679dfe459cdb092bc9169e5da1e13797510058928f4e1599e59afa516_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">景联科技 <span class="user-text">钟艳红<span
														class="vline"></span>hr
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/e0ce9ab875196e0a1Xx_29y4GFQ~.html"
												class="index_rcmd_job_58" class="job-info" target="_blank">
												<p>
													医疗健康器械店长<span class="salary">5k-10k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>经验不限<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/89fa2818d7b10d021HR539Q~.html"
												class="index_rcmd_company_58_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190228/6bcb1f018a50f3e37e0b5afacfd6005cb3e655f36701dd404048619eaf5db071_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">盛世东泰 <span class="user-text">蔡女士<span
														class="vline"></span>人力资源
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/627cf42238a74d9c1HZz29-9FlI~.html"
												class="index_rcmd_job_59" class="job-info" target="_blank">
												<p>
													产品经理（大数据+医疗健康）<span class="salary">20k-40k</span>
												</p>
												<p class="job-text">
													杭州<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/01333b6819289fb71HV52dk~.html"
												class="index_rcmd_company_59_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20181219/ede49be5cf79109d71a72d83aa86b34a98e574f14f006e464a9847a603bf00f6_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">火石创造 <span class="user-text">梅莎莎<span
														class="vline"></span>HR
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/a9f7e7f4a4d975b71HZ-0tS9FFA~.html"
												class="index_rcmd_job_60" class="job-info" target="_blank">
												<p>
													医疗健康记者<span class="salary">16k-25k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/fc7eca037bc42b851XB83t-9.html"
												class="index_rcmd_company_60_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190103/b75a525178c4ded4a5a0e6e4a95765f50ba72f1890da376cf1f098eaa62e34f4_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">经观文化传媒 <span class="user-text">陈哲<span
														class="vline"></span>招聘者
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/61760f1dd54353f11H1539i_FVs~.html"
												class="index_rcmd_job_61" class="job-info" target="_blank">
												<p>
													垂类-医疗健康业务部_医学编辑<span class="salary">15k-20k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>经验不限<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/ab9fdc6f043679990HY~.html"
												class="index_rcmd_company_61_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190223/db980b70bbb5b2fab67f5ba270332380bb359aac6f24b9c2cb8b7e8f49510786_s.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">百度 <span class="user-text">成婷婷<span
														class="vline"></span>hr
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/e995cb3dc41560b51HRz2t69E1s~.html"
												class="index_rcmd_job_62" class="job-info" target="_blank">
												<p>
													医疗健康顾问<span class="salary">8k-16k</span>
												</p>
												<p class="job-text">
													南京<span class="vline"></span>1年以内<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/7f85fb57363860810Xx42d20.html"
												class="index_rcmd_company_62_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180510/8c103049fa63e7b6319c73ffeeb4db30cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">南京邦德骨科医院 <span class="user-text">潘桂英<span
														class="vline"></span>人事经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/83004b9efe0e6c501HRz2t68GFM~.html"
												class="index_rcmd_job_63" class="job-info" target="_blank">
												<p>
													医疗健康顾问<span class="salary">8k-16k</span>
												</p>
												<p class="job-text">
													南京<span class="vline"></span>经验不限<span class="vline"></span>中专/中技
												</p>
											</a> <a href="/gongsi/7f85fb57363860810Xx42d20.html"
												class="index_rcmd_company_63_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180510/8c103049fa63e7b6319c73ffeeb4db30cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">南京邦德骨科医院 <span class="user-text">潘桂英<span
														class="vline"></span>人事经理
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<ul class="">
									<li>
										<div class="sub-li">
											<a href="/job_detail/72464205a78b13471HRy2dW6ElQ~.html"
												class="index_rcmd_job_64" class="job-info" target="_blank">
												<p>
													英语翻译（法律\核电）<span class="salary">6k-8k</span>
												</p>
												<p class="job-text">
													成都<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/ed4e993f9bb37ab91XF_2Ny_EA~~.html"
												class="index_rcmd_company_64_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img2.bosszhipin.com/boss/avatar/avatar_9.png"
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_9.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">语言桥 <span class="user-text">徐娇娇<span
														class="vline"></span>HR
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/356e246f1d1bc3f71nx82dq7E1Q~.html"
												class="index_rcmd_job_65" class="job-info" target="_blank">
												<p>
													兼职法律英语翻译<span class="salary">15k-30k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>1年以内<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/1dac4f528dc43f601nB63d24FQ~~.html"
												class="index_rcmd_company_65_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_7.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">蓝海法律翻译 <span class="user-text">张海<span
														class="vline"></span>招聘者
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/89047b9dca3eac071nx50tm1FFA~.html"
												class="index_rcmd_job_66" class="job-info" target="_blank">
												<p>
													兼职法律英语翻译<span class="salary">15k-30k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/1dac4f528dc43f601nB63d24FQ~~.html"
												class="index_rcmd_company_66_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_7.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">蓝海法律翻译 <span class="user-text">张海<span
														class="vline"></span>招聘者
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/123cfb20e2e2e1e61HRy2N-9GFM~.html"
												class="index_rcmd_job_67" class="job-info" target="_blank">
												<p>
													英语翻译（法律合同\社科）<span class="salary">6k-8k</span>
												</p>
												<p class="job-text">
													成都<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/ed4e993f9bb37ab91XF_2Ny_EA~~.html"
												class="index_rcmd_company_67_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_9.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">语言桥 <span class="user-text">徐娇娇<span
														class="vline"></span>HR
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/3588d0add2bac1291nZz2NS8EFs~.html"
												class="index_rcmd_job_68" class="job-info" target="_blank">
												<p>
													英语翻译-影视/军工/电力/法律<span class="salary">6k-12k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/cc99ccb9933072c803V90tg~.html"
												class="index_rcmd_company_68_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180105/1a48a1a3ba3ddc3bbc1c7da4ed0f78382883765cec0542e198e9717d1493ea65_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">甲骨易翻译 <span class="user-text">金峥嵘<span
														class="vline"></span>招聘
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/f12dd160d60384d61XF82N26FFI~.html"
												class="index_rcmd_job_69" class="job-info" target="_blank">
												<p>
													兼职法律英语翻译<span class="salary">6k-8k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/06466feac3d190cc1nZ42d27EQ~~.html"
												class="index_rcmd_company_69_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20171226/8c860cbdc697b3ef1bc2280b3f569cc9f870e3e0fd52a6b603aa73a0ff100f59_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">天华煜京 <span class="user-text">周菁<span
														class="vline"></span>招聘专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/d658563e639b66fd1Xx93Nm9EVc~.html"
												class="index_rcmd_job_70" class="job-info" target="_blank">
												<p>
													法律翻译<span class="salary">15k-30k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>1年以内<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/363d4c7b6292f2401X193926Eg~~.html"
												class="index_rcmd_company_70_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_1.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">中科天润翻译 <span class="user-text">刘万芹<span
														class="vline"></span>翻译项目副总经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/73da8e842ba97d631Hd60t2_EVI~.html"
												class="index_rcmd_job_71" class="job-info" target="_blank">
												<p>
													法律类兼职翻译<span class="salary">5k-6k</span>
												</p>
												<p class="job-text">
													苏州<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/57891b92bbfef83e1X1z39-0GA~~.html"
												class="index_rcmd_company_71_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20181102/bf7d700d2af6ff89b96d4c18a8e7d943c19883bb572dcc9c72f7944259f777c2_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">博语创思 <span class="user-text">郭彩云<span
														class="vline"></span>HR
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/ee2aec68b36b8bdd1XF93dS1FFI~.html"
												class="index_rcmd_job_72" class="job-info" target="_blank">
												<p>
													法律翻译<span class="salary">18k-33k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>经验不限<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/ed22be9104a69df71XF609y6Fg~~.html"
												class="index_rcmd_company_72_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_6.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">上海艾睿翻译有限公司 <span class="user-text">吴红<span
														class="vline"></span>销售总监
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<ul class="">
									<li>
										<div class="sub-li">
											<a href="/job_detail/f1c9d372735a19101Xd53tW8FVQ~.html"
												class="index_rcmd_job_73" class="job-info" target="_blank">
												<p>
													京东物流-供应链产品经理<span class="salary">15k-25k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/33e052361693f8371nF-3d25.html"
												class="index_rcmd_company_73_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img.bosszhipin.com/beijin/mcs/banner/20171031/84ade9701fd02a77fedb6675600a134f33d208e8d6fc287973c46e5cb5346f06.png"
														data-src="https://img.bosszhipin.com/beijin/mcs/banner/20171031/84ade9701fd02a77fedb6675600a134f33d208e8d6fc287973c46e5cb5346f06.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">京东集团 <span class="user-text">徐玲<span
														class="vline"></span>招聘者
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/eaf297f4be293d8a1HV72dm0Fls~.html"
												class="index_rcmd_job_74" class="job-info" target="_blank">
												<p>
													助理实施顾问（物流、供应链、生产制造方向）<span class="salary">5k-7k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>应届生<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/08958dfae7554d521HR43tQ~.html"
												class="index_rcmd_company_74_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180929/971b35f60ae9ae28220bf8491416760fcfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">鼎捷软件 <span class="user-text">曾梦依<span
														class="vline"></span>人力资源专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/878a2f8f0554a10e1XN92di9EVM~.html"
												class="index_rcmd_job_75" class="job-info" target="_blank">
												<p>
													跨境供应链(物流/基础产品)-资深java开发<span class="salary">30k-50k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/5d627415a46b4a750nJ9.html"
												class="index_rcmd_company_75_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_15.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">阿里巴巴集团 <span class="user-text">吴俊源<span
														class="vline"></span>专家
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/cc793b5684e392911HZ90t-7FFE~.html"
												class="index_rcmd_job_76" class="job-info" target="_blank">
												<p>
													供应链总监（物流）<span class="salary">20k-30k</span>
												</p>
												<p class="job-text">
													北京<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/cf170fd2fdd088881XZ62Ny6.html"
												class="index_rcmd_company_76_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_1.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">哈哈镜 <span class="user-text">孔女士<span
														class="vline"></span>HRVP
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/1c110f43d1339b201XJ809S-GFM~.html"
												class="index_rcmd_job_77" class="job-info" target="_blank">
												<p>
													国际物流/供应链<span class="salary">10k-20k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>1-3年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/e6cbd48f1e98c3821XJ-3t24GQ~~.html"
												class="index_rcmd_company_77_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20170428/3f69466fd8ae29f8651d8578746e65868c7dd922ad47494fc02c388e12c00eac_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">泛付PanPay <span class="user-text">张女士<span
														class="vline"></span>人事经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/2078bfeeaf359c021XJ809S4F1I~.html"
												class="index_rcmd_job_78" class="job-info" target="_blank">
												<p>
													国际物流/供应链<span class="salary">10k-20k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>1-3年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/e6cbd48f1e98c3821XJ-3t24GQ~~.html"
												class="index_rcmd_company_78_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20170428/3f69466fd8ae29f8651d8578746e65868c7dd922ad47494fc02c388e12c00eac_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">泛付PanPay <span class="user-text">张女士<span
														class="vline"></span>人事经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/249bdbb628b851a31HV63tq_Fls~.html"
												class="index_rcmd_job_79" class="job-info" target="_blank">
												<p>
													商超体系供应链（物流）总监<span class="salary">10k-15k</span>
												</p>
												<p class="job-text">
													济南<span class="vline"></span>经验不限<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/ec643647a43ed1541nx52Ni_Fg~~.html"
												class="index_rcmd_company_79_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20181205/9b49c42efa892bfbe192e404c42b7c5dcfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">巴龙国际集团济南公司 <span class="user-text">刘振<span
														class="vline"></span>人事
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/984ff6a9299cd3b81XR739-9FFs~.html"
												class="index_rcmd_job_80" class="job-info" target="_blank">
												<p>
													物流供应链运营<span class="salary">6k-10k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>1-3年<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/d09345db032658741nVz0t21GQ~~.html"
												class="index_rcmd_company_80_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180103/dee18e14641125e739d9a13f7649ef87e64bf8f46bd3550c1410585eff8236f1_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">VXGROUP <span class="user-text">陈女士<span
														class="vline"></span>行政
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/beac2ec1dfa436751XJ809S_GFY~.html"
												class="index_rcmd_job_81" class="job-info" target="_blank">
												<p>
													国际物流/供应链人员<span class="salary">10k-20k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>1-3年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/e6cbd48f1e98c3821XJ-3t24GQ~~.html"
												class="index_rcmd_company_81_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20170428/3f69466fd8ae29f8651d8578746e65868c7dd922ad47494fc02c388e12c00eac_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">泛付PanPay <span class="user-text">张女士<span
														class="vline"></span>人事经理
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<ul class="">
									<li>
										<div class="sub-li">
											<a href="/job_detail/efd51694cd7359d21nBy3d-8EFE~.html"
												class="index_rcmd_job_82" class="job-info" target="_blank">
												<p>
													贸易跟单<span class="salary">5k-8k</span>
												</p>
												<p class="job-text">
													深圳<span class="vline"></span>1年以内<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/367f91e9a42ab0c70XJ809S9.html"
												class="index_rcmd_company_82_custompage" class="user-info"
												target="_blank">
												<p>
													<img
														src="https://img.bosszhipin.com/beijin/mcs/useravatar/20170515/f8efc3905d90e72a0fb77c471c2ec6fa8c7dd922ad47494fc02c388e12c00eac_s.jpg"
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20170515/f8efc3905d90e72a0fb77c471c2ec6fa8c7dd922ad47494fc02c388e12c00eac_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">力诚 <span class="user-text">张振红<span
														class="vline"></span>总经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/67b2248c7c74713f1XB83tS8FFM~.html"
												class="index_rcmd_job_83" class="job-info" target="_blank">
												<p>
													贸易跟单<span class="salary">8k-10k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>1-3年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/824827a0221589891XV629u_FQ~~.html"
												class="index_rcmd_company_83_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180614/c983b11c68df9af41084dd62cbd3a0ee58a6cc0370a6e3561c487170251f93da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">上海迪拓国际 <span class="user-text">黄涛<span
														class="vline"></span>总经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/6feeb0bb71c32e371nJ43tS5EFI~.html"
												class="index_rcmd_job_84" class="job-info" target="_blank">
												<p>
													其他采购/贸易类职位<span class="salary">5k-8k</span>
												</p>
												<p class="job-text">
													长沙<span class="vline"></span>1年以内<span class="vline"></span>学历不限
												</p>
											</a> <a href="/gongsi/69bd83f0ea2e404e0nV70t27.html"
												class="index_rcmd_company_84_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180922/77736473920362e7d4209d813a03071a43941e0fe71b719fe92ea9e2efb6e055_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">长沙辉驰百货贸易公司 <span class="user-text">黎姐<span
														class="vline"></span>人事副理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/ed46a6a38f62a2211HZ42d20F1c~.html"
												class="index_rcmd_job_85" class="job-info" target="_blank">
												<p>
													国际贸易业务员<span class="salary">10k-15k</span>
												</p>
												<p class="job-text">
													哈尔滨<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/618848faa9781bcc1Xd72di8Fw~~.html"
												class="index_rcmd_company_85_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180712/48ba541b1053ce3a6be609b635b5691cac45e64f2c340d9e227882678f2ed5cd_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">PLANAS <span class="user-text">王振宇<span
														class="vline"></span>总经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/13dfec4b326b86bd1HV_2tW9EFU~.html"
												class="index_rcmd_job_86" class="job-info" target="_blank">
												<p>
													钢铁原料国际贸易经理<span class="salary">10k-15k</span>
												</p>
												<p class="job-text">
													天津<span class="vline"></span>5-10年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/49f78600bfb40eb31HZ739S9Fg~~.html"
												class="index_rcmd_company_86_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img2.bosszhipin.com/boss/avatar/avatar_9.png?x-oss-process=image/resize,w_60,limit_0"
														alt="">天津康乾国际贸易 <span class="user-text">侯二丽<span
														class="vline"></span>人事部长
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/cf8676c683cd717b1XJ82d-_Flc~.html"
												class="index_rcmd_job_87" class="job-info" target="_blank">
												<p>
													采购专员<span class="salary">5k-6k</span>
												</p>
												<p class="job-text">
													上海<span class="vline"></span>1-3年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/a5d2c6df4999d3d71X1939i6.html"
												class="index_rcmd_company_87_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180802/6db02157eeeb5b80578a6f99687a9e37cfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">视互力 <span class="user-text">潘红燕<span
														class="vline"></span>人事招聘专员
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/b3b29ecdc21d4d021HB62dy7GVc~.html"
												class="index_rcmd_job_88" class="job-info" target="_blank">
												<p>
													国际采购主管<span class="salary">5k-9k</span>
												</p>
												<p class="job-text">
													广州<span class="vline"></span>1-3年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/58329bcb6f3e96a41nJ_29u-EQ~~.html"
												class="index_rcmd_company_88_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180502/7f995b98ad9a6dbd5db7c9e9fa8e7df7d0e2c1786da3e268a455f39ae94343e8_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">广州熙彬 <span class="user-text">周冬娉<span
														class="vline"></span>国际采购经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/81827440aea2c8d01HB62di9F1c~.html"
												class="index_rcmd_job_89" class="job-info" target="_blank">
												<p>
													国际采购/买手<span class="salary">6k-9k</span>
												</p>
												<p class="job-text">
													广州<span class="vline"></span>1-3年<span class="vline"></span>大专
												</p>
											</a> <a href="/gongsi/58329bcb6f3e96a41nJ_29u-EQ~~.html"
												class="index_rcmd_company_89_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180502/7f995b98ad9a6dbd5db7c9e9fa8e7df7d0e2c1786da3e268a455f39ae94343e8_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">广州熙彬 <span class="user-text">周冬娉<span
														class="vline"></span>国际采购经理
													</span>
												</p>
											</a>
										</div>
									</li>
									<li>
										<div class="sub-li">
											<a href="/job_detail/2bc36098638413641Xx60ty0FVc~.html"
												class="index_rcmd_job_90" class="job-info" target="_blank">
												<p>
													买手/采购（化妆品/妆具）<span class="salary">6k-9k</span>
												</p>
												<p class="job-text">
													广州<span class="vline"></span>1-3年<span class="vline"></span>本科
												</p>
											</a> <a href="/gongsi/58329bcb6f3e96a41nJ_29u-EQ~~.html"
												class="index_rcmd_company_90_custompage" class="user-info"
												target="_blank">
												<p>
													<img src=""
														data-src="https://img.bosszhipin.com/beijin/mcs/useravatar/20180502/7f995b98ad9a6dbd5db7c9e9fa8e7df7d0e2c1786da3e268a455f39ae94343e8_s.jpg?x-oss-process=image/resize,w_60,limit_0"
														alt="">广州熙彬 <span class="user-text">周冬娉<span
														class="vline"></span>国际采购经理
													</span>
												</p>
											</a>
										</div>
									</li>
								</ul>
								<p class="common-tab-more">
									<a class="btn btn-outline" href="javascript:find('')"
										class="open_joblist">查看所有职位</a>
										<br><br>
								</p>
							</div>
							</div>
							</div>
							<div class="sign-wrap sign-wrap-v2" style="display: none"></div>
							<script
								src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js"></script>
							<script
								src="https://static.zhipin.com/zhipin/v149/web/geek/js/main.js"></script>
							<input type="hidden" id="page_key_name" value="cpc_job_index" />
</body>
</html>
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
						href="https://www.zhipin.com/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></li>
					<li class=""><a class="header-job"
						href="find/position.jsp">职位</a></li>
					<li class=""><a class="header_brand"
						href="https://www.zhipin.com/gongsi/">公司</a></li>
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
                </div>
        </div>
	</div>
	</div>
	<!-- 搜索 -->
	<div class="column-search-panel">
		<div class="inner home-inner">
			<div class="search-box">
				<div class="search-form ">
					<form action="/job_detail/" method="get">
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
									maxlength="50" autocomplete="off" placeholder="搜索职位">
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
				<div class="search-hot">
					<font face="微软雅黑" color="#000000"><B>热门职位:</B></font> <a
						href="/c101110100/?query=Java&industry=&position="
						class="hot-position-1"><font face="微软雅黑" color="#efffee">Java</font></a>
					<a href="/c101110100/?query=PHP&industry=&position="
						class="hot-position-2"><font face="微软雅黑" color="#efffee">PHP</font></a>
					<a href="/c101110100/?query=C%2B%2B&industry=&position="
						class="hot-position-3"><font face="微软雅黑" color="#efffee">C++</font></a>
					<a href="/c101110100/?query=web前端&industry=&position="
						class="hot-position-4"><font face="微软雅黑" color="#efffee">web前端</font></a>
					<a href="/c101110100/?query=iOS&industry=&position="
						class="hot-position-5"><font face="微软雅黑" color="#efffee">iOS</a></font>
					<a href="/c101110100/?query=Android&industry=&position="
						class="hot-position-6"><font face="微软雅黑" color="#efffee">Android</font></a>
					<a href="/c101110100/?query=产品经理&industry=&position="
						class="hot-position-7"><font face="微软雅黑" color="#efffee">产品经理</font></a>
					<a href="/c101110100/?query=UI设计师&industry=&position="
						class="hot-position-8"><font face="微软雅黑" color="#efffee">UI设计师</font></a>
					<a href="/c101110100/?query=产品运营&industry=&position="
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
								href="/c101110100-p100101/">Java</a> <a
								href="/c101110100-p100103/">PHP</a> <a
								href="/c101110100-p100901/">web前端</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">技术</p>
							<ul>
								<li>
									<h4>后端开发</h4>
									<div class="text">
										<a class="search_100199" href="/c101110100-p100199/">后端开发</a>
										<a class="search_100101" href="/c101110100-p100101/">Java</a>
										<a class="search_100102" href="/c101110100-p100102/">C++</a> <a
											class="search_100103" href="/c101110100-p100103/">PHP</a> <a
											class="search_100104" href="/c101110100-p100104/" class="cur">数据挖掘</a>
										<a class="search_100105" href="/c101110100-p100105/">C</a> <a
											class="search_100106" href="/c101110100-p100106/">C#</a> <a
											class="search_100107" href="/c101110100-p100107/">.NET</a> <a
											class="search_100108" href="/c101110100-p100108/">Hadoop</a>
										<a class="search_100109" href="/c101110100-p100109/">Python</a>
										<a class="search_100110" href="/c101110100-p100110/">Delphi</a>
										<a class="search_100111" href="/c101110100-p100111/">VB</a> <a
											class="search_100112" href="/c101110100-p100112/">Perl</a> <a
											class="search_100113" href="/c101110100-p100113/">Ruby</a> <a
											class="search_100114" href="/c101110100-p100114/">Node.js</a>
										<a class="search_100115" href="/c101110100-p100115/">搜索算法</a>
										<a class="search_100116" href="/c101110100-p100116/">Golang</a>
										<a class="search_100117" href="/c101110100-p100117/">自然语言处理</a>
										<a class="search_100118" href="/c101110100-p100118/">推荐算法</a>
										<a class="search_100119" href="/c101110100-p100119/">Erlang</a>
										<a class="search_100120" href="/c101110100-p100120/"
											class="cur">算法工程师</a> <a class="search_100121"
											href="/c101110100-p100121/">语音/视频/图形开发</a> <a
											class="search_100122" href="/c101110100-p100122/">数据采集</a>
									</div>
								</li>
								<li>
									<h4>移动开发</h4>
									<div class="text">
										<a class="search_100299" href="/c101110100-p100299/">移动开发</a>
										<a class="search_100201" href="/c101110100-p100201/">HTML5</a>
										<a class="search_100202" href="/c101110100-p100202/">Android</a>
										<a class="search_100203" href="/c101110100-p100203/"
											class="cur">iOS</a> <a class="search_100204"
											href="/c101110100-p100204/">WP</a> <a class="search_100205"
											href="/c101110100-p100205/">移动web前端</a> <a
											class="search_100206" href="/c101110100-p100206/">Flash</a> <a
											class="search_100208" href="/c101110100-p100208/">JavaScript</a>
										<a class="search_100209" href="/c101110100-p100209/">U3D</a> <a
											class="search_100210" href="/c101110100-p100210/">COCOS2DX</a>
									</div>
								</li>
								<li>
									<h4>测试</h4>
									<div class="text">
										<a class="search_100301" href="/c101110100-p100301/">测试工程师</a>
										<a class="search_100302" href="/c101110100-p100302/">自动化测试</a>
										<a class="search_100303" href="/c101110100-p100303/">功能测试</a>
										<a class="search_100304" href="/c101110100-p100304/"
											class="cur">性能测试</a> <a class="search_100305"
											href="/c101110100-p100305/">测试开发</a> <a class="search_100306"
											href="/c101110100-p100306/">移动端测试</a> <a
											class="search_100307" href="/c101110100-p100307/">游戏测试</a> <a
											class="search_100308" href="/c101110100-p100308/">硬件测试</a> <a
											class="search_100309" href="/c101110100-p100309/">软件测试</a>
									</div>
								</li>
								<li>
									<h4>运维/技术支持</h4>
									<div class="text">
										<a class="search_100401" href="/c101110100-p100401/">运维工程师</a>
										<a class="search_100402" href="/c101110100-p100402/">运维开发工程师</a>
										<a class="search_100403" href="/c101110100-p100403/">网络工程师</a>
										<a class="search_100404" href="/c101110100-p100404/">系统工程师</a>
										<a class="search_100405" href="/c101110100-p100405/">IT技术支持</a>
										<a class="search_100406" href="/c101110100-p100406/">系统管理员</a>
										<a class="search_100407" href="/c101110100-p100407/">网络安全</a>
										<a class="search_100408" href="/c101110100-p100408/">系统安全</a>
										<a class="search_100409" href="/c101110100-p100409/">DBA</a>
									</div>
								</li>
								<li>
									<h4>数据</h4>
									<div class="text">
										<a class="search_100599" href="/c101110100-p100599/">数据</a> <a
											class="search_100506" href="/c101110100-p100506/">ETL工程师</a>
										<a class="search_100507" href="/c101110100-p100507/">数据仓库</a>
										<a class="search_100508" href="/c101110100-p100508/">数据开发</a>
										<a class="search_100509" href="/c101110100-p100509/"
											class="cur">数据挖掘</a> <a class="search_100511"
											href="/c101110100-p100511/">数据分析师</a> <a
											class="search_100512" href="/c101110100-p100512/">数据架构师</a> <a
											class="search_100513" href="/c101110100-p100513/">算法研究员</a>
									</div>
								</li>
								<li>
									<h4>项目管理</h4>
									<div class="text">
										<a class="search_100601" href="/c101110100-p100601/">项目经理</a>
										<a class="search_100602" href="/c101110100-p100602/">项目主管</a>
										<a class="search_100603" href="/c101110100-p100603/">项目助理</a>
										<a class="search_100604" href="/c101110100-p100604/">项目专员</a>
										<a class="search_100605" href="/c101110100-p100605/">实施顾问</a>
										<a class="search_100606" href="/c101110100-p100606/">实施工程师</a>
										<a class="search_100607" href="/c101110100-p100607/">需求分析工程师</a>
									</div>
								</li>
								<li>
									<h4>硬件开发</h4>
									<div class="text">
										<a class="search_100801" href="/c101110100-p100801/">硬件</a> <a
											class="search_100802" href="/c101110100-p100802/">嵌入式</a> <a
											class="search_100803" href="/c101110100-p100803/">自动化</a> <a
											class="search_100804" href="/c101110100-p100804/">单片机</a> <a
											class="search_100805" href="/c101110100-p100805/">电路设计</a> <a
											class="search_100806" href="/c101110100-p100806/">驱动开发</a> <a
											class="search_100807" href="/c101110100-p100807/">系统集成</a> <a
											class="search_100808" href="/c101110100-p100808/">FPGA开发</a>
										<a class="search_100809" href="/c101110100-p100809/"
											class="cur">DSP开发</a> <a class="search_100810"
											href="/c101110100-p100810/">ARM开发</a> <a
											class="search_100811" href="/c101110100-p100811/">PCB工艺</a> <a
											class="search_100812" href="/c101110100-p100812/">模具设计</a> <a
											class="search_100813" href="/c101110100-p100813/">热传导</a> <a
											class="search_100814" href="/c101110100-p100814/">材料工程师</a> <a
											class="search_100815" href="/c101110100-p100815/">精益工程师</a> <a
											class="search_100816" href="/c101110100-p100816/">射频工程师</a>
									</div>
								</li>
								<li>
									<h4>前端开发</h4>
									<div class="text">
										<a class="search_100999" href="/c101110100-p100999/">前端开发</a>
										<a class="search_100901" href="/c101110100-p100901/">web前端</a>
										<a class="search_100902" href="/c101110100-p100902/">Javascript</a>
										<a class="search_100903" href="/c101110100-p100903/">Flash</a>
										<a class="search_100904" href="/c101110100-p100904/">HTML5</a>
									</div>
								</li>
								<li>
									<h4>通信</h4>
									<div class="text">
										<a class="search_101001" href="/c101110100-p101001/">通信技术工程师</a>
										<a class="search_101002" href="/c101110100-p101002/">通信研发工程师</a>
										<a class="search_101003" href="/c101110100-p101003/"
											class="cur">数据通信工程师</a> <a class="search_101004"
											href="/c101110100-p101004/">移动通信工程师</a> <a
											class="search_101005" href="/c101110100-p101005/">电信网络工程师</a>
										<a class="search_101006" href="/c101110100-p101006/">电信交换工程师</a>
										<a class="search_101007" href="/c101110100-p101007/">有线传输工程师</a>
										<a class="search_101008" href="/c101110100-p101008/">无线射频工程师</a>
										<a class="search_101009" href="/c101110100-p101009/">通信电源工程师</a>
										<a class="search_101010" href="/c101110100-p101010/">通信标准化工程师</a>
										<a class="search_101011" href="/c101110100-p101011/">通信项目专员</a>
										<a class="search_101012" href="/c101110100-p101012/">通信项目经理</a>
										<a class="search_101013" href="/c101110100-p101013/">核心网工程师</a>
										<a class="search_101014" href="/c101110100-p101014/">通信测试工程师</a>
										<a class="search_101015" href="/c101110100-p101015/">通信设备工程师</a>
										<a class="search_101016" href="/c101110100-p101016/">光通信工程师</a>
										<a class="search_101017" href="/c101110100-p101017/">光传输工程师</a>
										<a class="search_101018" href="/c101110100-p101018/">光网络工程师</a>
									</div>
								</li>
								<li>
									<h4>电子/半导体</h4>
									<div class="text">
										<a class="search_101401" href="/c101110100-p101401/">电子工程师</a>
										<a class="search_101402" href="/c101110100-p101402/"
											class="cur">电气工程师</a> <a class="search_101403"
											href="/c101110100-p101403/">FAE</a> <a class="search_101404"
											href="/c101110100-p101404/">电气设计工程师</a>
									</div>
								</li>
								<li>
									<h4>高端技术职位</h4>
									<div class="text">
										<a class="search_100799" href="/c101110100-p100799/">高端技术职位</a>
										<a class="search_100701" href="/c101110100-p100701/">技术经理</a>
										<a class="search_100702" href="/c101110100-p100702/">技术总监</a>
										<a class="search_100703" href="/c101110100-p100703/">测试经理</a>
										<a class="search_100704" href="/c101110100-p100704/">架构师</a> <a
											class="search_100705" href="/c101110100-p100705/">CTO</a> <a
											class="search_100706" href="/c101110100-p100706/">运维总监</a> <a
											class="search_100707" href="/c101110100-p100707/">技术合伙人</a>
									</div>
								</li>
								<li>
									<h4>人工智能</h4>
									<div class="text">
										<a class="search_101399" href="/c101110100-p101399/">人工智能</a>
										<a class="search_101301" href="/c101110100-p101301/">机器学习</a>
										<a class="search_101302" href="/c101110100-p101302/">深度学习</a>
										<a class="search_101303" href="/c101110100-p101303/">图像算法</a>
										<a class="search_101304" href="/c101110100-p101304/">图像处理</a>
										<a class="search_101305" href="/c101110100-p101305/"
											class="cur">语音识别</a> <a class="search_101306"
											href="/c101110100-p101306/">图像识别</a> <a class="search_101307"
											href="/c101110100-p101307/">算法研究员</a>
									</div>
								</li>
								<li>
									<h4>软件销售支持</h4>
									<div class="text">
										<a class="search_101299" href="/c101110100-p101299/">软件销售支持</a>
										<a class="search_101201" href="/c101110100-p101201/">售前工程师</a>
										<a class="search_101202" href="/c101110100-p101202/">售后工程师</a>
									</div>
								</li>
								<li>
									<h4>其他技术职位</h4>
									<div class="text">
										<a class="search_101101" href="/c101110100-p101101/">其他技术职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>产品</b> <a
								href="/c101110100-p110101/">产品经理</a> <a
								href="/c101110100-p110302/">产品总监</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">产品</p>
							<ul>
								<li>
									<h4>产品经理</h4>
									<div class="text">
										<a class="search_110101" href="/c101110100-p110101/">产品经理</a>
										<a class="search_110102" href="/c101110100-p110102/">网页产品经理</a>
										<a class="search_110103" href="/c101110100-p110103/"
											class="cur">移动产品经理</a> <a class="search_110104"
											href="/c101110100-p110104/">产品助理</a> <a class="search_110105"
											href="/c101110100-p110105/">数据产品经理</a> <a
											class="search_110106" href="/c101110100-p110106/">电商产品经理</a>
										<a class="search_110107" href="/c101110100-p110107/">游戏策划</a>
										<a class="search_110108" href="/c101110100-p110108/">产品专员</a>
									</div>
								</li>
								<li>
									<h4>高端产品职位</h4>
									<div class="text">
										<a class="search_110399" href="/c101110100-p110399/">高端产品职位</a>
										<a class="search_110302" href="/c101110100-p110302/">产品总监</a>
										<a class="search_110303" href="/c101110100-p110303/"
											class="cur">游戏制作人</a> <a class="search_110304"
											href="/c101110100-p110304/">产品VP</a>
									</div>
								</li>
								<li>
									<h4>其他产品职位</h4>
									<div class="text">
										<a class="search_110401" href="/c101110100-p110401/">其他产品职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>设计</b> <a
								href="/c101110100-p120105/">UI设计师</a> <a
								href="/c101110100-p120106/">平面设计师</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">设计</p>
							<ul>
								<li>
									<h4>视觉设计</h4>
									<div class="text">
										<a class="search_120199" href="/c101110100-p120199/">视觉设计</a>
										<a class="search_120101" href="/c101110100-p120101/">视觉设计师</a>
										<a class="search_120102" href="/c101110100-p120102/">网页设计师</a>
										<a class="search_120103" href="/c101110100-p120103/">Flash设计师</a>
										<a class="search_120104" href="/c101110100-p120104/">APP设计师</a>
										<a class="search_120105" href="/c101110100-p120105/">UI设计师</a>
										<a class="search_120106" href="/c101110100-p120106/">平面设计师</a>
										<a class="search_120107" href="/c101110100-p120107/">美术设计师（2D/3D）</a>
										<a class="search_120108" href="/c101110100-p120108/"
											class="cur">广告设计师</a> <a class="search_120109"
											href="/c101110100-p120109/">多媒体设计师</a> <a
											class="search_120110" href="/c101110100-p120110/">原画师</a> <a
											class="search_120111" href="/c101110100-p120111/">游戏特效</a> <a
											class="search_120112" href="/c101110100-p120112/">游戏界面设计师</a>
										<a class="search_120113" href="/c101110100-p120113/">游戏场景</a>
										<a class="search_120114" href="/c101110100-p120114/">游戏角色</a>
										<a class="search_120115" href="/c101110100-p120115/">游戏动作</a>
										<a class="search_120116" href="/c101110100-p120116/">三维/CAD/制图</a>
										<a class="search_120117" href="/c101110100-p120117/"
											class="cur">美工</a> <a class="search_120118"
											href="/c101110100-p120118/">包装设计</a> <a class="search_120119"
											href="/c101110100-p120119/">设计师助理</a> <a
											class="search_120120" href="/c101110100-p120120/">动画设计师</a> <a
											class="search_120121" href="/c101110100-p120121/">插画师</a>
									</div>
								</li>
								<li>
									<h4>交互设计</h4>
									<div class="text">
										<a class="search_120201" href="/c101110100-p120201/">交互设计师</a>
										<a class="search_120202" href="/c101110100-p120202/">无线交互设计师</a>
										<a class="search_120203" href="/c101110100-p120203/">网页交互设计师</a>
										<a class="search_120204" href="/c101110100-p120204/">硬件交互设计师</a>
									</div>
								</li>
								<li>
									<h4>用户研究</h4>
									<div class="text">
										<a class="search_120301" href="/c101110100-p120301/">数据分析师</a>
										<a class="search_120302" href="/c101110100-p120302/">用户研究员</a>
										<a class="search_120303" href="/c101110100-p120303/">游戏数值策划</a>
										<a class="search_120304" href="/c101110100-p120304/"
											class="cur">UX设计师</a> <a class="search_120407"
											href="/c101110100-p120407/">用户研究经理</a> <a
											class="search_120408" href="/c101110100-p120408/">用户研究总监</a>
									</div>
								</li>
								<li>
									<h4>高端设计职位</h4>
									<div class="text">
										<a class="search_120499" href="/c101110100-p120499/">高端设计职位</a>
										<a class="search_120401" href="/c101110100-p120401/">设计经理/主管</a>
										<a class="search_120402" href="/c101110100-p120402/">设计总监</a>
										<a class="search_120403" href="/c101110100-p120403/">视觉设计经理</a>
										<a class="search_120404" href="/c101110100-p120404/">视觉设计总监</a>
										<a class="search_120405" href="/c101110100-p120405/">交互设计经理/主管</a>
										<a class="search_120406" href="/c101110100-p120406/">交互设计总监</a>
									</div>
								</li>
								<li>
									<h4>非视觉设计</h4>
									<div class="text">
										<a class="search_120699" href="/c101110100-p120699/">非视觉设计</a>
										<a class="search_120601" href="/c101110100-p120601/">服装设计</a>
										<a class="search_120602" href="/c101110100-p120602/"
											class="cur">工业设计</a> <a class="search_120603"
											href="/c101110100-p120603/">橱柜设计</a> <a class="search_120604"
											href="/c101110100-p120604/">家具设计</a> <a class="search_120605"
											href="/c101110100-p120605/">家居设计</a> <a class="search_120606"
											href="/c101110100-p120606/">珠宝设计</a> <a class="search_120607"
											href="/c101110100-p120607/">室内设计</a> <a class="search_120608"
											href="/c101110100-p120608/">陈列设计</a> <a class="search_120610"
											href="/c101110100-p120610/">景观设计</a>
									</div>
								</li>
								<li>
									<h4>其他设计职位</h4>
									<div class="text">
										<a class="search_120501" href="/c101110100-p120501/">其他设计职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>

					<dl class="all-box">
						<dd>
							<i class="icon-arrow-right"></i> <b>市场</b> <a
								href="/c101110100-p140101/">市场营销</a> <a
								href="/c101110100-p140104/">市场推广</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">市场</p>
							<ul>
								<li>
									<h4>市场/营销</h4>
									<div class="text">
										<a class="search_140114" href="/c101110100-p140114/">选址开发</a>
										<a class="search_140101" href="/c101110100-p140101/">市场营销</a>
										<a class="search_140102" href="/c101110100-p140102/">市场策划</a>
										<a class="search_140103" href="/c101110100-p140103/">市场顾问</a>
										<a class="search_140104" href="/c101110100-p140104/">市场推广</a>
										<a class="search_140105" href="/c101110100-p140105/">SEO</a> <a
											class="search_140106" href="/c101110100-p140106/">SEM</a> <a
											class="search_140107" href="/c101110100-p140107/">商务渠道</a> <a
											class="search_140108" href="/c101110100-p140108/">商业数据分析</a>
										<a class="search_140109" href="/c101110100-p140109/"
											class="cur">活动策划</a> <a class="search_140110"
											href="/c101110100-p140110/">网络营销</a> <a class="search_140111"
											href="/c101110100-p140111/">海外市场</a> <a class="search_140112"
											href="/c101110100-p140112/">政府关系</a> <a class="search_140113"
											href="/c101110100-p140113/">APP推广</a>
									</div>
								</li>
								<li>
									<h4>公关媒介</h4>
									<div class="text">
										<a class="search_140299" href="/c101110100-p140299/">公关媒介</a>
										<a class="search_140201" href="/c101110100-p140201/">媒介经理</a>
										<a class="search_140202" href="/c101110100-p140202/">广告协调</a>
										<a class="search_140203" href="/c101110100-p140203/">品牌公关</a>
										<a class="search_140204" href="/c101110100-p140204/">媒介专员</a>
										<a class="search_140205" href="/c101110100-p140205/">活动策划执行</a>
										<a class="search_140206" href="/c101110100-p140206/">媒介策划</a>
									</div>
								</li>
								<li>
									<h4>会务会展</h4>
									<div class="text">
										<a class="search_140599" href="/c101110100-p140599/">会务会展</a>
										<a class="search_140501" href="/c101110100-p140501/">会议活动销售</a>
										<a class="search_140502" href="/c101110100-p140502/">会议活动策划</a>
										<a class="search_140503" href="/c101110100-p140503/">会议活动执行</a>
										<a class="search_140504" href="/c101110100-p140504/"
											class="cur">会展活动销售</a> <a class="search_140505"
											href="/c101110100-p140505/">会展活动策划</a> <a
											class="search_140506" href="/c101110100-p140506/">会展活动执行</a>
									</div>
								</li>
								<li>
									<h4>广告</h4>
									<div class="text">
										<a class="search_140699" href="/c101110100-p140699/">广告</a> <a
											class="search_140601" href="/c101110100-p140601/">广告创意</a> <a
											class="search_140602" href="/c101110100-p140602/">美术指导</a> <a
											class="search_140603" href="/c101110100-p140603/">广告设计师</a> <a
											class="search_140604" href="/c101110100-p140604/">策划经理</a> <a
											class="search_140605" href="/c101110100-p140605/">文案</a> <a
											class="search_140607" href="/c101110100-p140607/">广告制作</a> <a
											class="search_140608" href="/c101110100-p140608/">媒介投放</a> <a
											class="search_140609" href="/c101110100-p140609/" class="cur">媒介合作</a>
										<a class="search_140610" href="/c101110100-p140610/">媒介顾问</a>
										<a class="search_140611" href="/c101110100-p140611/">广告审核</a>
									</div>
								</li>
								<li>
									<h4>高端市场职位</h4>
									<div class="text">
										<a class="search_140499" href="/c101110100-p140499/">高端市场职位</a>
										<a class="search_140401" href="/c101110100-p140401/">市场总监</a>
										<a class="search_140404" href="/c101110100-p140404/">CMO</a> <a
											class="search_140405" href="/c101110100-p140405/">公关总监</a> <a
											class="search_140406" href="/c101110100-p140406/">媒介总监</a> <a
											class="search_140407" href="/c101110100-p140407/">创意总监</a>
									</div>
								</li>
								<li>
									<h4>其他市场职位</h4>
									<div class="text">
										<a class="search_140701" href="/c101110100-p140701/">其他市场职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>人事</b> <a
								href="/c101110100-p150104/">人事/HR</a> <a
								href="/c101110100-p150204/">行政</a> <a
								href="/c101110100-p150303/">财务</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">人事</p>
							<ul>
								<li>
									<h4>人力资源</h4>
									<div class="text">
										<a class="search_150101" href="/c101110100-p150101/">人力资源主管</a>
										<a class="search_150102" href="/c101110100-p150102/">招聘</a> <a
											class="search_150103" href="/c101110100-p150103/">HRBP</a> <a
											class="search_150104" href="/c101110100-p150104/">人力资源专员/助理</a>
										<a class="search_150105" href="/c101110100-p150105/">培训</a> <a
											class="search_150106" href="/c101110100-p150106/">薪资福利</a> <a
											class="search_150107" href="/c101110100-p150107/">绩效考核</a> <a
											class="search_150403" href="/c101110100-p150403/">人力资源经理</a>
										<a class="search_150406" href="/c101110100-p150406/">人力资源VP/CHO</a>
										<a class="search_150108" href="/c101110100-p150108/"
											class="cur">人力资源总监</a> <a class="search_150109"
											href="/c101110100-p150109/">员工关系</a> <a class="search_150110"
											href="/c101110100-p150110/">组织发展</a>
									</div>
								</li>
								<li>
									<h4>行政</h4>
									<div class="text">
										<a class="search_150201" href="/c101110100-p150201/">行政专员/助理</a>
										<a class="search_150202" href="/c101110100-p150202/">前台</a> <a
											class="search_150204" href="/c101110100-p150204/">行政主管</a> <a
											class="search_150205" href="/c101110100-p150205/">经理助理</a> <a
											class="search_150207" href="/c101110100-p150207/">后勤</a> <a
											class="search_150208" href="/c101110100-p150208/">商务司机</a> <a
											class="search_150401" href="/c101110100-p150401/">行政经理</a> <a
											class="search_150209" href="/c101110100-p150209/">行政总监</a>
									</div>
								</li>
								<li>
									<h4>财务</h4>
									<div class="text">
										<a class="search_150399" href="/c101110100-p150399/">财务</a> <a
											class="search_150301" href="/c101110100-p150301/">会计</a> <a
											class="search_150302" href="/c101110100-p150302/">出纳</a> <a
											class="search_150303" href="/c101110100-p150303/">财务顾问</a> <a
											class="search_150304" href="/c101110100-p150304/" class="cur">结算</a>
										<a class="search_150305" href="/c101110100-p150305/">税务</a> <a
											class="search_150306" href="/c101110100-p150306/">审计</a> <a
											class="search_150307" href="/c101110100-p150307/">风控</a> <a
											class="search_150402" href="/c101110100-p150402/">财务经理</a> <a
											class="search_150404" href="/c101110100-p150404/">CFO</a> <a
											class="search_150308" href="/c101110100-p150308/">财务总监</a> <a
											class="search_150309" href="/c101110100-p150309/">财务主管</a>
									</div>
								</li>
								<li>
									<h4>法务</h4>
									<div class="text">
										<a class="search_150203" href="/c101110100-p150203/">法务专员/助理</a>
										<a class="search_150502" href="/c101110100-p150502/">律师</a> <a
											class="search_150503" href="/c101110100-p150503/">专利</a> <a
											class="search_150504" href="/c101110100-p150504/">法律顾问</a> <a
											class="search_150505" href="/c101110100-p150505/">法务主管</a> <a
											class="search_150506" href="/c101110100-p150506/" class="cur">法务经理</a>
										<a class="search_150507" href="/c101110100-p150507/">法务总监</a>
									</div>
								</li>
								<li>
									<h4>其他职能职位</h4>
									<div class="text">
										<a class="search_150601" href="/c101110100-p150601/">其他职能职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>高级管理</b> <a
								href="/c101110100-p150407/">CEO/总裁/总经理</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">高级管理</p>
							<ul>
								<li>
									<h4>高级管理职位</h4>
									<div class="text">
										<a class="search_150499" href="/c101110100-p150499/">高级管理职位</a>
										<a class="search_150407" href="/c101110100-p150407/">CEO/总裁/总经理</a>
										<a class="search_150408" href="/c101110100-p150408/">副总裁/副总经理</a>
										<a class="search_150409" href="/c101110100-p150409/">事业部负责人</a>
										<a class="search_150410" href="/c101110100-p150410/">区域/分公司/代表处负责人</a>
										<a class="search_150411" href="/c101110100-p150411/"
											class="cur">总裁/总经理/董事长助理</a> <a class="search_150412"
											href="/c101110100-p150412/">合伙人</a> <a class="search_150413"
											href="/c101110100-p150413/">创始人</a> <a class="search_150414"
											href="/c101110100-p150414/">董事会秘书</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>销售</b> <a
								href="/c101110100-p140301/">销售专员</a> <a
								href="/c101110100-p140302/">销售经理</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">销售</p>
							<ul>
								<li>
									<h4>销售</h4>
									<div class="text">
										<a class="search_140399" href="/c101110100-p140399/">销售</a> <a
											class="search_140301" href="/c101110100-p140301/">销售专员</a> <a
											class="search_140302" href="/c101110100-p140302/">销售经理</a> <a
											class="search_140303" href="/c101110100-p140303/">客户代表</a> <a
											class="search_140304" href="/c101110100-p140304/">大客户代表</a> <a
											class="search_140305" href="/c101110100-p140305/">BD经理</a> <a
											class="search_140306" href="/c101110100-p140306/">商务渠道</a> <a
											class="search_140307" href="/c101110100-p140307/">渠道销售</a> <a
											class="search_140308" href="/c101110100-p140308/">代理商销售</a> <a
											class="search_140309" href="/c101110100-p140309/">销售助理</a> <a
											class="search_140310" href="/c101110100-p140310/">电话销售</a> <a
											class="search_140311" href="/c101110100-p140311/" class="cur">销售顾问</a>
										<a class="search_140312" href="/c101110100-p140312/">商品经理</a>
										<a class="search_140313" href="/c101110100-p140313/">广告销售</a>
										<a class="search_140314" href="/c101110100-p140314/">网络营销</a>
										<a class="search_140315" href="/c101110100-p140315/">营销主管</a>
										<a class="search_140316" href="/c101110100-p140316/">销售工程师</a>
										<a class="search_140317" href="/c101110100-p140317/">客户经理</a>
									</div>
								</li>
								<li>
									<h4>销售管理</h4>
									<div class="text">
										<a class="search_160199" href="/c101110100-p160199/">销售管理</a>
										<a class="search_140402" href="/c101110100-p140402/">销售总监</a>
										<a class="search_140403" href="/c101110100-p140403/"
											class="cur">商务总监</a> <a class="search_160101"
											href="/c101110100-p160101/">区域总监</a> <a class="search_160102"
											href="/c101110100-p160102/">城市经理</a> <a class="search_160103"
											href="/c101110100-p160103/">销售VP</a> <a class="search_160104"
											href="/c101110100-p160104/">团队经理</a>
									</div>
								</li>
								<li>
									<h4>其他销售职位</h4>
									<div class="text">
										<a class="search_160201" href="/c101110100-p160201/">其他销售职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>媒体</b> <a
								href="/c101110100-p170205/">文案</a> <a
								href="/c101110100-p170201/">广告创意</a> <a
								href="/c101110100-p170102/">编辑</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">媒体</p>
							<ul>
								<li>
									<h4>采编/写作/出版</h4>
									<div class="text">
										<a class="search_170199" href="/c101110100-p170199/">采编/写作/出版</a>
										<a class="search_170101" href="/c101110100-p170101/">记者</a> <a
											class="search_170102" href="/c101110100-p170102/">编辑</a> <a
											class="search_170103" href="/c101110100-p170103/">采编</a> <a
											class="search_170104" href="/c101110100-p170104/">撰稿人</a> <a
											class="search_170105" href="/c101110100-p170105/">出版发行</a> <a
											class="search_170106" href="/c101110100-p170106/">校对录入</a> <a
											class="search_170107" href="/c101110100-p170107/">总编</a> <a
											class="search_170108" href="/c101110100-p170108/">自媒体</a>
									</div>
								</li>
								<li>
									<h4>公关媒介</h4>
									<div class="text">
										<a class="search_170399" href="/c101110100-p170399/">公关媒介</a>
										<a class="search_170301" href="/c101110100-p170301/">媒介经理</a>
										<a class="search_170302" href="/c101110100-p170302/">媒介专员</a>
										<a class="search_170303" href="/c101110100-p170303/"
											class="cur">广告协调</a> <a class="search_170304"
											href="/c101110100-p170304/">品牌公关</a> <a class="search_170305"
											href="/c101110100-p170305/">活动策划执行</a> <a
											class="search_170306" href="/c101110100-p170306/">媒介策划</a>
									</div>
								</li>
								<li>
									<h4>会务会展</h4>
									<div class="text">
										<a class="search_170499" href="/c101110100-p170499/">会务会展</a>
										<a class="search_170401" href="/c101110100-p170401/">会议活动销售</a>
										<a class="search_170402" href="/c101110100-p170402/">会议活动策划</a>
										<a class="search_170403" href="/c101110100-p170403/">会议活动执行</a>
										<a class="search_170404" href="/c101110100-p170404/">会展活动销售</a>
										<a class="search_170405" href="/c101110100-p170405/">会展活动策划</a>
										<a class="search_170406" href="/c101110100-p170406/">会展活动执行</a>
									</div>
								</li>
								<li>
									<h4>广告</h4>
									<div class="text">
										<a class="search_170299" href="/c101110100-p170299/">广告</a> <a
											class="search_170201" href="/c101110100-p170201/">广告创意</a> <a
											class="search_170202" href="/c101110100-p170202/">美术指导</a> <a
											class="search_170203" href="/c101110100-p170203/">广告设计师</a> <a
											class="search_170204" href="/c101110100-p170204/">策划经理</a> <a
											class="search_170205" href="/c101110100-p170205/" class="cur">文案</a>
										<a class="search_170207" href="/c101110100-p170207/">广告制作</a>
										<a class="search_170208" href="/c101110100-p170208/">媒介投放</a>
										<a class="search_170209" href="/c101110100-p170209/">媒介合作</a>
										<a class="search_170210" href="/c101110100-p170210/">媒介顾问</a>
										<a class="search_170211" href="/c101110100-p170211/">广告审核</a>
									</div>
								</li>
								<li>
									<h4>影视媒体</h4>
									<div class="text">
										<a class="search_170699" href="/c101110100-p170699/">影视媒体</a>
										<a class="search_170617" href="/c101110100-p170617/">助理</a> <a
											class="search_170618" href="/c101110100-p170618/">统筹制片人</a> <a
											class="search_170619" href="/c101110100-p170619/">执行制片人</a> <a
											class="search_170601" href="/c101110100-p170601/">导演/编导</a> <a
											class="search_170602" href="/c101110100-p170602/">摄影/影像师</a>
										<a class="search_170603" href="/c101110100-p170603/">视频编辑</a>
										<a class="search_170604" href="/c101110100-p170604/">音频编辑</a>
										<a class="search_170605" href="/c101110100-p170605/">经纪人</a> <a
											class="search_170606" href="/c101110100-p170606/" class="cur">后期制作</a>
										<a class="search_170607" href="/c101110100-p170607/">影视制作</a>
										<a class="search_170608" href="/c101110100-p170608/">影视发行</a>
										<a class="search_170609" href="/c101110100-p170609/">影视策划</a>
										<a class="search_170610" href="/c101110100-p170610/">主持人/主播/DJ</a>
										<a class="search_170611" href="/c101110100-p170611/">演员/配音/模特</a>
										<a class="search_170612" href="/c101110100-p170612/">化妆/造型/服装</a>
										<a class="search_170613" href="/c101110100-p170613/">放映管理</a>
										<a class="search_170614" href="/c101110100-p170614/">录音/音效</a>
										<a class="search_170615" href="/c101110100-p170615/">制片人</a> <a
											class="search_170616" href="/c101110100-p170616/">编剧</a>
									</div>
								</li>
								<li>
									<h4>其他传媒职位</h4>
									<div class="text">
										<a class="search_170501" href="/c101110100-p170501/">其他传媒职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="">
						<dd>
							<i class="icon-arrow-right"></i> <b>金融</b> <a
								href="/c101110100-p180101/">投资经理</a> <a
								href="/c101110100-p180112/">投资总监</a> <a
								href="/c101110100-p180201/">风控</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">金融</p>
							<ul>
								<li>
									<h4>投融资</h4>
									<div class="text">
										<a class="search_180199" href="/c101110100-p180199/">投融资</a> <a
											class="search_180101" href="/c101110100-p180101/">投资经理</a> <a
											class="search_180103" href="/c101110100-p180103/">行业研究</a> <a
											class="search_180104" href="/c101110100-p180104/">资产管理</a> <a
											class="search_180112" href="/c101110100-p180112/">投资总监</a> <a
											class="search_180113" href="/c101110100-p180113/">投资VP</a> <a
											class="search_180114" href="/c101110100-p180114/">投资合伙人</a> <a
											class="search_180115" href="/c101110100-p180115/">融资</a> <a
											class="search_180116" href="/c101110100-p180116/">并购</a> <a
											class="search_180117" href="/c101110100-p180117/" class="cur">投后管理</a>
										<a class="search_180118" href="/c101110100-p180118/">投资助理</a>
										<a class="search_180111" href="/c101110100-p180111/">其他投融资职位</a>
										<a class="search_180119" href="/c101110100-p180119/">投资顾问</a>
									</div>
								</li>
								<li>
									<h4>风控</h4>
									<div class="text">
										<a class="search_180201" href="/c101110100-p180201/">风控</a> <a
											class="search_180202" href="/c101110100-p180202/">律师</a> <a
											class="search_180203" href="/c101110100-p180203/">资信评估</a> <a
											class="search_180204" href="/c101110100-p180204/" class="cur">合规稽查</a>
									</div>
								</li>
								<li>
									<h4>税务审计</h4>
									<div class="text">
										<a class="search_180301" href="/c101110100-p180301/">审计</a> <a
											class="search_180302" href="/c101110100-p180302/">法务</a> <a
											class="search_180303" href="/c101110100-p180303/">会计</a> <a
											class="search_180304" href="/c101110100-p180304/">清算</a>
									</div>
								</li>
								<li>
									<h4>银行</h4>
									<div class="text">
										<a class="search_180499" href="/c101110100-p180499/">银行</a> <a
											class="search_180401" href="/c101110100-p180401/">信用卡销售</a> <a
											class="search_180102" href="/c101110100-p180102/">分析师</a> <a
											class="search_180402" href="/c101110100-p180402/">柜员</a> <a
											class="search_180403" href="/c101110100-p180403/" class="cur">商务渠道</a>
										<a class="search_180404" href="/c101110100-p180404/">大堂经理</a>
										<a class="search_180105" href="/c101110100-p180105/">理财顾问</a>
										<a class="search_180405" href="/c101110100-p180405/">客户经理</a>
										<a class="search_180406" href="/c101110100-p180406/">信贷管理</a>
										<a class="search_180107" href="/c101110100-p180107/">风控</a>
									</div>
								</li>
								<li>
									<h4>互联网金融</h4>
									<div class="text">
										<a class="search_180599" href="/c101110100-p180599/">互联网金融</a>
										<a class="search_180501" href="/c101110100-p180501/">金融产品经理</a>
										<a class="search_180502" href="/c101110100-p180502/">风控</a> <a
											class="search_180503" href="/c101110100-p180503/">催收员</a> <a
											class="search_180504" href="/c101110100-p180504/">分析师</a> <a
											class="search_180505" href="/c101110100-p180505/">投资经理</a> <a
											class="search_180106" href="/c101110100-p180106/">交易员</a> <a
											class="search_180506" href="/c101110100-p180506/">理财顾问</a> <a
											class="search_180108" href="/c101110100-p180108/" class="cur">合规稽查</a>
										<a class="search_180109" href="/c101110100-p180109/">审计</a> <a
											class="search_180110" href="/c101110100-p180110/">清算</a>
									</div>
								</li>
								<li>
									<h4>保险</h4>
									<div class="text">
										<a class="search_180701" href="/c101110100-p180701/">保险业务</a>
										<a class="search_180702" href="/c101110100-p180702/">精算师</a> <a
											class="search_180703" href="/c101110100-p180703/">保险理赔</a>
									</div>
								</li>
								<li>
									<h4>证券</h4>
									<div class="text">
										<a class="search_180899" href="/c101110100-p180899/">证券</a> <a
											class="search_180801" href="/c101110100-p180801/">证券经纪人</a> <a
											class="search_180802" href="/c101110100-p180802/">证券分析师</a>
									</div>
								</li>
								<li>
									<h4>其他金融职位</h4>
									<div class="text">
										<a class="search_180601" href="/c101110100-p180601/">其他金融职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>

					<div class="show-all">显示全部职位</div>
					<dl class="all-box">
						<dd>
							<i class="icon-arrow-right"></i> <b>汽车</b> <a
								href="/c101110100-p230201/">汽车销售</a> <a
								href="/c101110100-p230204/">汽车维修</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">汽车</p>
							<ul>
								<li>
									<h4>汽车设计与研发</h4>
									<div class="text">
										<a class="search_230101" href="/c101110100-p230101/">汽车设计</a>
										<a class="search_230102" href="/c101110100-p230102/">车身设计</a>
										<a class="search_230103" href="/c101110100-p230103/">底盘设计</a>
										<a class="search_230104" href="/c101110100-p230104/">机械设计</a>
										<a class="search_230105" href="/c101110100-p230105/">动力系统设计</a>
										<a class="search_230106" href="/c101110100-p230106/">电子工程设计</a>
										<a class="search_230107" href="/c101110100-p230107/">零部件设计</a>
										<a class="search_230108" href="/c101110100-p230108/"
											class="cur">汽车工程项目管理</a> <a class="search_230110"
											href="/c101110100-p230110/">内外饰设计工程师</a>
									</div>
								</li>
								<li>
									<h4>汽车生产与制造</h4>
									<div class="text">
										<a class="search_230210" href="/c101110100-p230210/">总装工程师</a>
										<a class="search_230211" href="/c101110100-p230211/">焊接工程师</a>
										<a class="search_230212" href="/c101110100-p230212/">冲压工程师</a>
										<a class="search_230109" href="/c101110100-p230109/">质量工程师</a>
									</div>
								</li>
								<li>
									<h4>汽车销售与服务</h4>
									<div class="text">
										<a class="search_230299" href="/c101110100-p230299/">汽车销售与制造</a>
										<a class="search_230201" href="/c101110100-p230201/">汽车销售</a>
										<a class="search_230202" href="/c101110100-p230202/"
											class="cur">汽车配件销售</a> <a class="search_230203"
											href="/c101110100-p230203/">汽车售后服务</a> <a
											class="search_230204" href="/c101110100-p230204/">汽车维修</a> <a
											class="search_230205" href="/c101110100-p230205/">汽车美容</a> <a
											class="search_230206" href="/c101110100-p230206/">汽车定损理赔</a>
										<a class="search_230207" href="/c101110100-p230207/">二手车评估师</a>
										<a class="search_230208" href="/c101110100-p230208/">4S店管理</a>
										<a class="search_230209" href="/c101110100-p230209/"
											class="cur">汽车改装工程师</a>
									</div>
								</li>
								<li>
									<h4>其他汽车职位</h4>
									<div class="text">
										<a class="search_230301" href="/c101110100-p230301/">其他汽车职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="all-box">
						<dd>
							<i class="icon-arrow-right"></i> <b>教育培训</b> <a
								href="/c101110100-p190101/">课程设计</a> <a
								href="/c101110100-p190202/">教务管理</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">教育培训</p>
							<ul>
								<li>
									<h4>教育产品研发</h4>
									<div class="text">
										<a class="search_190199" href="/c101110100-p190199/">教育产品研发</a>
										<a class="search_190101" href="/c101110100-p190101/">课程设计</a>
										<a class="search_190102" href="/c101110100-p190102/">课程编辑</a>
										<a class="search_190103" href="/c101110100-p190103/">教师</a> <a
											class="search_190104" href="/c101110100-p190104/">培训研究</a> <a
											class="search_190105" href="/c101110100-p190105/" class="cur">培训师</a>
										<a class="search_190107" href="/c101110100-p190107/">培训策划</a>
										<a class="search_190106" href="/c101110100-p190106/">其他教育产品研发职位</a>
									</div>
								</li>
								<li>
									<h4>教育行政</h4>
									<div class="text">
										<a class="search_190299" href="/c101110100-p190299/">教育行政</a>
										<a class="search_190201" href="/c101110100-p190201/">校长</a> <a
											class="search_190202" href="/c101110100-p190202/" class="cur">教务管理</a>
										<a class="search_190203" href="/c101110100-p190203/">教学管理</a>
										<a class="search_190204" href="/c101110100-p190204/">班主任/辅导员</a>
									</div>
								</li>
								<li>
									<h4>教师</h4>
									<div class="text">
										<a class="search_190301" href="/c101110100-p190301/">教师</a> <a
											class="search_190302" href="/c101110100-p190302/">助教</a> <a
											class="search_190303" href="/c101110100-p190303/">高中教师</a> <a
											class="search_190304" href="/c101110100-p190304/">初中教师</a> <a
											class="search_190305" href="/c101110100-p190305/">小学教师</a> <a
											class="search_190306" href="/c101110100-p190306/" class="cur">幼教</a>
										<a class="search_190307" href="/c101110100-p190307/">理科教师</a>
										<a class="search_190308" href="/c101110100-p190308/">文科教师</a>
										<a class="search_190309" href="/c101110100-p190309/">外语教师</a>
										<a class="search_190310" href="/c101110100-p190310/">音乐教师</a>
										<a class="search_190311" href="/c101110100-p190311/">美术教师</a>
										<a class="search_190312" href="/c101110100-p190312/">体育教师</a>
										<a class="search_190313" href="/c101110100-p190313/">就业老师</a>
									</div>
								</li>
								<li>
									<h4>IT培训</h4>
									<div class="text">
										<a class="search_190499" href="/c101110100-p190499/">IT培训</a>
										<a class="search_190401" href="/c101110100-p190401/">JAVA培训讲师</a>
										<a class="search_190402" href="/c101110100-p190402/">Android培训讲师</a>
										<a class="search_190403" href="/c101110100-p190403/">ios培训讲师</a>
										<a class="search_190404" href="/c101110100-p190404/">PHP培训讲师</a>
										<a class="search_190405" href="/c101110100-p190405/">.NET培训讲师</a>
										<a class="search_190406" href="/c101110100-p190406/">C++培训讲师</a>
										<a class="search_190407" href="/c101110100-p190407/">Unity
											3D培训讲师</a> <a class="search_190408" href="/c101110100-p190408/">Web前端培训讲师</a>
										<a class="search_190409" href="/c101110100-p190409/">软件测试培训讲师</a>
										<a class="search_190410" href="/c101110100-p190410/">动漫培训讲师</a>
										<a class="search_190411" href="/c101110100-p190411/">UI设计培训讲师</a>
									</div>
								</li>
								<li>
									<h4>职业培训</h4>
									<div class="text">
										<a class="search_190501" href="/c101110100-p190501/">财会培训讲师</a>
										<a class="search_190502" href="/c101110100-p190502/">HR培训讲师</a>
										<a class="search_190503" href="/c101110100-p190503/"
											class="cur">培训师</a> <a class="search_190504"
											href="/c101110100-p190504/">拓展培训</a>
									</div>
								</li>
								<li>
									<h4>招生</h4>
									<div class="text">
										<a class="search_190601" href="/c101110100-p190601/">课程顾问</a>
										<a class="search_190602" href="/c101110100-p190602/">招生顾问</a>
										<a class="search_190603" href="/c101110100-p190603/">留学顾问</a>
									</div>
								</li>
								<li>
									<h4>教练</h4>
									<div class="text">
										<a class="search_190799" href="/c101110100-p190799/">教练</a> <a
											class="search_190701" href="/c101110100-p190701/">舞蹈教练</a> <a
											class="search_190702" href="/c101110100-p190702/" class="cur">瑜伽教练</a>
										<a class="search_190703" href="/c101110100-p190703/">瘦身顾问</a>
										<a class="search_190704" href="/c101110100-p190704/">游泳教练</a>
										<a class="search_190705" href="/c101110100-p190705/">健身教练</a>
										<a class="search_190706" href="/c101110100-p190706/">篮球/羽毛球教练</a>
										<a class="search_190707" href="/c101110100-p190707/">跆拳道教练</a>
									</div>
								</li>
								<li>
									<h4>其他教育培训职位</h4>
									<div class="text">
										<a class="search_190801" href="/c101110100-p190801/">其他教育培训职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<dl class="all-box">
						<dd>
							<i class="icon-arrow-right"></i> <b>运营</b> <a
								href="/c101110100-p130111/">新媒体运营</a> <a
								href="/c101110100-p130102/">产品运营</a>
						</dd>
						<div class="menu-line"></div>
						<div class="menu-sub">
							<p class="menu-article">运营</p>
							<ul>
								<li>
									<h4>运营</h4>
									<div class="text">
										<a class="search_130199" href="/c101110100-p130199/">运营</a> <a
											class="search_130101" href="/c101110100-p130101/">用户运营</a> <a
											class="search_130102" href="/c101110100-p130102/">产品运营</a> <a
											class="search_130103" href="/c101110100-p130103/">数据运营</a> <a
											class="search_130104" href="/c101110100-p130104/">内容运营</a> <a
											class="search_130105" href="/c101110100-p130105/">活动运营</a> <a
											class="search_130106" href="/c101110100-p130106/">商家运营</a> <a
											class="search_130107" href="/c101110100-p130107/">品类运营</a> <a
											class="search_130108" href="/c101110100-p130108/">游戏运营</a> <a
											class="search_130109" href="/c101110100-p130109/" class="cur">网络推广</a>
										<a class="search_130110" href="/c101110100-p130110/">网站运营</a>
										<a class="search_130111" href="/c101110100-p130111/">新媒体运营</a>
										<a class="search_130112" href="/c101110100-p130112/">社区运营</a>
										<a class="search_130113" href="/c101110100-p130113/">微信运营</a>
										<a class="search_130114" href="/c101110100-p130114/">微博运营</a>
										<a class="search_130115" href="/c101110100-p130115/">策略运营</a>
										<a class="search_130116" href="/c101110100-p130116/">线下拓展运营</a>
										<a class="search_130117" href="/c101110100-p130117/">电商运营</a>
										<a class="search_130118" href="/c101110100-p130118/">运营助理/专员</a>
										<a class="search_130120" href="/c101110100-p130120/">内容审核</a>
										<a class="search_130119" href="/c101110100-p130119/">销售运营</a>
									</div>
								</li>
								<li>
									<h4>编辑</h4>
									<div class="text">
										<a class="search_130299" href="/c101110100-p130299/">编辑</a> <a
											class="search_130201" href="/c101110100-p130201/">副主编</a> <a
											class="search_130202" href="/c101110100-p130202/">内容编辑</a> <a
											class="search_130203" href="/c101110100-p130203/">文案策划</a> <a
											class="search_130204" href="/c101110100-p130204/">网站编辑</a> <a
											class="search_130205" href="/c101110100-p130205/" class="cur">记者</a>
										<a class="search_130206" href="/c101110100-p130206/">采编</a>
									</div>
								</li>
								<li>
									<h4>客服</h4>
									<div class="text">
										<a class="search_130301" href="/c101110100-p130301/">售前咨询</a>
										<a class="search_130302" href="/c101110100-p130302/">售后咨询</a>
										<a class="search_130303" href="/c101110100-p130303/">网络客服</a>
										<a class="search_130304" href="/c101110100-p130304/">客服经理</a>
										<a class="search_130305" href="/c101110100-p130305/">客服专员/助理</a>
										<a class="search_130306" href="/c101110100-p130306/">客服主管</a>
										<a class="search_130307" href="/c101110100-p130307/">客服总监</a>
										<a class="search_130308" href="/c101110100-p130308/">电话客服</a>
										<a class="search_130309" href="/c101110100-p130309/">咨询热线/呼叫中心客服</a>
									</div>
								</li>
								<li>
									<h4>高端运营职位</h4>
									<div class="text">
										<a class="search_130499" href="/c101110100-p130499/">高端运营职位</a>
										<a class="search_130401" href="/c101110100-p130401/">主编</a> <a
											class="search_130402" href="/c101110100-p130402/" class="cur">运营总监</a>
										<a class="search_130403" href="/c101110100-p130403/">COO</a> <a
											class="search_130404" href="/c101110100-p130404/">客服总监</a> <a
											class="search_130405" href="/c101110100-p130405/">运营经理/主管</a>
									</div>
								</li>
								<li>
									<h4>其他运营职位</h4>
									<div class="text">
										<a class="search_130501" href="/c101110100-p130501/">其他运营职位</a>
									</div>
								</li>
							</ul>
						</div>
					</dl>
					<div class="all-box">
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>医疗健康</b> <a
									href="/c101110100-p210104/">药剂师</a> <a
									href="/c101110100-p210401/">营养师</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">医疗健康</p>
								<ul>
									<li>
										<h4>医生/医技</h4>
										<div class="text">
											<a href="/c101110100-p210199/">医生/医技</a> <a
												href="/c101110100-p210112/">医生助理</a> <a
												href="/c101110100-p210113/">医学影像</a> <a
												href="/c101110100-p210114/">B超医生</a> <a
												href="/c101110100-p210302/">中医</a> <a
												href="/c101110100-p210103/">医师</a> <a
												href="/c101110100-p210303/">心理医生</a> <a
												href="/c101110100-p210104/">药剂师</a> <a
												href="/c101110100-p210304/">牙科医生</a> <a
												href="/c101110100-p210305/">康复治疗师</a> <a
												href="/c101110100-p210109/">验光师</a> <a
												href="/c101110100-p210110/">放射科医师</a> <a
												href="/c101110100-p210111/" class="cur">检验科医师</a> <a
												href="/c101110100-p210301/">医师</a> <a
												href="/c101110100-p210107/">其他医生职位</a>
										</div>
									</li>
									<li>
										<h4>护士/护理</h4>
										<div class="text">
											<a href="/c101110100-p210202/">护士长</a> <a
												href="/c101110100-p210201/">护士/护理</a> <a
												href="/c101110100-p210503/">导医</a>
										</div>
									</li>
									<li>
										<h4>健康整形</h4>
										<div class="text">
											<a href="/c101110100-p210499/">健康整形</a> <a
												href="/c101110100-p210401/">营养师</a> <a
												href="/c101110100-p210402/">整形师</a> <a
												href="/c101110100-p210403/" class="cur">理疗师</a> <a
												href="/c101110100-p210404/">针灸推拿</a>
										</div>
									</li>
									<li>
										<h4>生物制药</h4>
										<div class="text">
											<a href="/c101110100-p210115/" class="cur">生物制药</a> <a
												href="/c101110100-p210116/">药品注册</a> <a
												href="/c101110100-p210117/">药品生产</a> <a
												href="/c101110100-p210118/">临床研究</a> <a
												href="/c101110100-p210119/">临床协调</a> <a
												href="/c101110100-p210120/">临床数据分析</a> <a
												href="/c101110100-p210106/">医学总监</a> <a
												href="/c101110100-p210108/">医药研发</a>
										</div>
									</li>
									<li>
										<h4>医疗器械</h4>
										<div class="text">
											<a href="/c101110100-p210121/">医疗器械注册</a> <a
												href="/c101110100-p210122/">医疗器械生产/质量管理</a> <a
												href="/c101110100-p210105/">医疗器械研究</a>
										</div>
									</li>
									<li>
										<h4>药店</h4>
										<div class="text">
											<a href="/c101110100-p210899/">药店</a> <a
												href="/c101110100-p210801/">店长</a> <a
												href="/c101110100-p210802/">执业药师/驻店药师</a> <a
												href="/c101110100-p210803/">店员/营业员</a>
										</div>
									</li>
									<li>
										<h4>市场营销/媒体</h4>
										<div class="text">
											<a href="/c101110100-p210599/">市场营销/媒体</a> <a
												href="/c101110100-p210506/">医疗器械销售</a> <a
												href="/c101110100-p210101/" class="cur">医学编辑</a> <a
												href="/c101110100-p210501/">医学总监</a> <a
												href="/c101110100-p210102/">药学编辑</a> <a
												href="/c101110100-p210502/">医药代表</a> <a
												href="/c101110100-p210504/">健康顾问</a> <a
												href="/c101110100-p210505/">医美咨询</a>
										</div>
									</li>
									<li>
										<h4>其他医疗健康类职位</h4>
										<div class="text">
											<a href="/c101110100-p210701/">其他医疗健康类职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>采购贸易</b> <a
									href="/c101110100-p250102/">采购经理</a> <a
									href="/c101110100-p250106/">采购主管</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">采购贸易</p>
								<ul>
									<li>
										<h4>采购</h4>
										<div class="text">
											<a href="/c101110100-p250199/">采购</a> <a
												href="/c101110100-p250101/">采购总监</a> <a
												href="/c101110100-p250102/">采购经理</a> <a
												href="/c101110100-p250103/">采购专员</a> <a
												href="/c101110100-p250104/">买手</a> <a
												href="/c101110100-p250105/" class="cur">采购工程师</a> <a
												href="/c101110100-p250106/">采购主管</a> <a
												href="/c101110100-p250107/">采购助理</a>
										</div>
									</li>
									<li>
										<h4>进出口贸易</h4>
										<div class="text">
											<a href="/c101110100-p250299/">进出口贸易</a> <a
												href="/c101110100-p250201/">外贸经理</a> <a
												href="/c101110100-p250202/" class="cur">外贸专员</a> <a
												href="/c101110100-p250203/">外贸业务员</a> <a
												href="/c101110100-p250204/">贸易跟单</a>
										</div>
									</li>
									<li>
										<h4>其他采购/贸易职位</h4>
										<div class="text">
											<a href="/c101110100-p250301/">其他采购/贸易类职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>供应链/物流</b> <a
									href="/c101110100-p240103/">物流专员</a> <a
									href="/c101110100-p240107/">贸易跟单</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">供应链/物流</p>
								<ul>
									<li>
										<h4>物流</h4>
										<div class="text">
											<a href="/c101110100-p240199/">物流</a> <a
												href="/c101110100-p240101/">供应链专员</a> <a
												href="/c101110100-p240102/">供应链经理</a> <a
												href="/c101110100-p240103/">物流专员</a> <a
												href="/c101110100-p240104/">物流经理</a> <a
												href="/c101110100-p240105/">物流运营</a> <a
												href="/c101110100-p240106/">物流跟单</a> <a
												href="/c101110100-p240107/">贸易跟单</a> <a
												href="/c101110100-p240108/">物仓调度</a> <a
												href="/c101110100-p240109/" class="cur">物仓项目</a> <a
												href="/c101110100-p240110/">运输经理/主管</a> <a
												href="/c101110100-p240111/">货运代理专员</a> <a
												href="/c101110100-p240112/">货运代理经理</a> <a
												href="/c101110100-p240113/">水/空/陆运操作</a> <a
												href="/c101110100-p240114/">报关员</a> <a
												href="/c101110100-p240115/">报检员</a> <a
												href="/c101110100-p240116/">核销员</a> <a
												href="/c101110100-p240117/">单证员</a>
										</div>
									</li>
									<li>
										<h4>仓储</h4>
										<div class="text">
											<a href="/c101110100-p240299/">仓储</a> <a
												href="/c101110100-p240201/">仓储物料经理</a> <a
												href="/c101110100-p240202/">仓储物料专员</a> <a
												href="/c101110100-p240203/">仓储物料项目</a> <a
												href="/c101110100-p240204/" class="cur">仓储管理</a> <a
												href="/c101110100-p240205/">仓库文员</a> <a
												href="/c101110100-p240206/">配/理/拣/发货</a>
										</div>
									</li>
									<li>
										<h4>运输</h4>
										<div class="text">
											<a href="/c101110100-p240399/">运输</a> <a
												href="/c101110100-p240301/">货运司机</a> <a
												href="/c101110100-p240302/" class="cur">集装箱管理</a> <a
												href="/c101110100-p240303/">配送</a> <a
												href="/c101110100-p240304/">快递</a>
										</div>
									</li>
									<li>
										<h4>高端供应链职位</h4>
										<div class="text">
											<a href="/c101110100-p240499/">高端供应链职位</a> <a
												href="/c101110100-p240401/">供应链总监</a> <a
												href="/c101110100-p240402/">物流总监</a>
										</div>
									</li>
									<li>
										<h4>其他供应链职位</h4>
										<div class="text">
											<a href="/c101110100-p240501/">其他供应链职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>房地产/建筑</b> <a
									href="/c101110100-p220401/">物业管理</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">房地产/建筑</p>
								<ul>
									<li>
										<h4>房地产规划开发</h4>
										<div class="text">
											<a href="/c101110100-p220199/">房地产规划开发</a> <a
												href="/c101110100-p220101/">房产策划</a> <a
												href="/c101110100-p220102/">地产项目管理</a> <a
												href="/c101110100-p220103/">地产招投标</a>
										</div>
									</li>
									<li>
										<h4>设计装修与市政建设</h4>
										<div class="text">
											<a href="/c101110100-p220299/">设计装修与市政建设</a> <a
												href="/c101110100-p220201/">高级建筑工程师</a> <a
												href="/c101110100-p220202/">建筑工程师</a> <a
												href="/c101110100-p220203/" class="cur">建筑设计师</a> <a
												href="/c101110100-p220204/">土木/土建/结构工程师</a> <a
												href="/c101110100-p220205/">室内设计</a> <a
												href="/c101110100-p220206/">园林设计</a> <a
												href="/c101110100-p220207/">城市规划设计</a> <a
												href="/c101110100-p220208/">工程监理</a> <a
												href="/c101110100-p220209/">工程造价</a> <a
												href="/c101110100-p220210/">预结算</a> <a
												href="/c101110100-p220211/">工程资料管理</a> <a
												href="/c101110100-p220212/">建筑施工现场管理</a>
										</div>
									</li>
									<li>
										<h4>房地产经纪</h4>
										<div class="text">
											<a href="/c101110100-p220399/">房地产经纪</a> <a
												href="/c101110100-p220301/">地产置业顾问</a> <a
												href="/c101110100-p220302/" class="cur">地产评估</a> <a
												href="/c101110100-p220303/">地产中介</a>
										</div>
									</li>
									<li>
										<h4>物业管理</h4>
										<div class="text">
											<a href="/c101110100-p220401/">物业管理</a> <a
												href="/c101110100-p220402/">物业租赁销售 </a> <a
												href="/c101110100-p220403/">物业招商管理</a>
										</div>
									</li>
									<li>
										<h4>高端房地产职位</h4>
										<div class="text">
											<a href="/c101110100-p220599/">高端房地产职位</a> <a
												href="/c101110100-p220501/">地产项目总监</a> <a
												href="/c101110100-p220502/">地产策划总监</a> <a
												href="/c101110100-p220503/" class="cur">地产招投标总监</a> <a
												href="/c101110100-p220504/">物业总监</a> <a
												href="/c101110100-p220505/">房地产销售总监</a>
										</div>
									</li>
									<li>
										<h4>其他房地产职位</h4>
										<div class="text">
											<a href="/c101110100-p220601/">其他房地产职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>咨询/翻译/法律</b> <a
									href="/c101110100-p260101/">企业管理咨询</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">咨询/翻译/法律</p>
								<ul>
									<li>
										<h4>咨询/调研</h4>
										<div class="text">
											<a href="/c101110100-p260199/">咨询/调研</a> <a
												href="/c101110100-p260101/">企业管理咨询</a> <a
												href="/c101110100-p260102/" class="cur">数据分析师</a> <a
												href="/c101110100-p260103/">财务咨询顾问</a> <a
												href="/c101110100-p260104/">IT咨询顾问</a> <a
												href="/c101110100-p260105/">人力资源顾问</a> <a
												href="/c101110100-p260106/">咨询项目管理</a> <a
												href="/c101110100-p260107/">战略咨询</a> <a
												href="/c101110100-p260108/">猎头顾问</a> <a
												href="/c101110100-p260109/">市场调研</a> <a
												href="/c101110100-p260110/">其他咨询顾问</a>
										</div>
									</li>
									<li>
										<h4>律师</h4>
										<div class="text">
											<a href="/c101110100-p260203/">知识产权</a> <a
												href="/c101110100-p260201/">事务所律师</a> <a
												href="/c101110100-p260202/" class="cur">公司法务</a>
										</div>
									</li>
									<li>
										<h4>翻译</h4>
										<div class="text">
											<a href="/c101110100-p260301/">英语翻译</a> <a
												href="/c101110100-p260302/">日语翻译</a> <a
												href="/c101110100-p260303/">韩语/朝鲜语翻译</a> <a
												href="/c101110100-p260304/">法语翻译</a> <a
												href="/c101110100-p260305/">德语翻译</a> <a
												href="/c101110100-p260306/">俄语翻译</a> <a
												href="/c101110100-p260307/">西班牙语翻译</a> <a
												href="/c101110100-p260308/">其他语种翻译</a>
										</div>
									</li>
									<li>
										<h4>高端咨询类职位</h4>
										<div class="text">
											<a href="/c101110100-p260499/">高端咨询类职位</a> <a
												href="/c101110100-p260401/">咨询总监</a> <a
												href="/c101110100-p260402/" class="cur">咨询经理</a> <a
												href="/c101110100-p260403/">高级翻译</a> <a
												href="/c101110100-p260404/">同声传译 </a>
										</div>
									</li>
									<li>
										<h4>其他咨询类职位</h4>
										<div class="text">
											<a href="/c101110100-p260501/">其他咨询/翻译类职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>实习生/管培生</b> <a
									href="/c101110100-p270101/">实习生</a> <a
									href="/c101110100-p270102/">管培生</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">实习生/管培生</p>
								<ul>
									<li>
										<h4>实习生/培训生/储备干部</h4>
										<div class="text">
											<a href="/c101110100-p270101/">实习生</a> <a
												href="/c101110100-p270102/">管理培训生</a> <a
												href="/c101110100-p270103/">储备干部</a>
										</div>
									</li>
									<li>
										<h4>其他实习/培训/储备职位</h4>
										<div class="text">
											<a href="/c101110100-p270201/">其他实习/培训/储备职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>旅游</b> <a
									href="/c101110100-p280103/">旅游顾问</a> <a
									href="/c101110100-p280104/">导游</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">旅游</p>
								<ul>
									<li>
										<h4>旅游服务</h4>
										<div class="text">
											<a href="/c101110100-p280199/">旅游服务</a> <a
												href="/c101110100-p280101/">计调</a> <a
												href="/c101110100-p280102/">签证</a> <a
												href="/c101110100-p280103/">旅游顾问</a> <a
												href="/c101110100-p280104/">导游</a> <a
												href="/c101110100-p280105/">预定票务</a>
										</div>
									</li>
									<li>
										<h4>旅游产品开发/策划</h4>
										<div class="text">
											<a href="/c101110100-p280299/">旅游产品开发/策划</a> <a
												href="/c101110100-p280201/">旅游产品经理</a> <a
												href="/c101110100-p280202/" class="cur">旅游策划师</a>
										</div>
									</li>
									<li>
										<h4>其他旅游职位</h4>
										<div class="text">
											<a href="/c101110100-p280301/">其他旅游职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>服务业</b> <a
									href="/c101110100-p290202/">酒店前台</a> <a
									href="/c101110100-p290103/">客房服务员</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">服务业</p>
								<ul>
									<li>
										<h4>安保/家政</h4>
										<div class="text">
											<a href="/c101110100-p290105/">保安</a> <a
												href="/c101110100-p290106/">保洁</a>
										</div>
									</li>
									<li>
										<h4>酒店</h4>
										<div class="text">
											<a href="/c101110100-p290199/">酒店</a> <a
												href="/c101110100-p290101/">收银</a> <a
												href="/c101110100-p290102/">酒店前台</a> <a
												href="/c101110100-p290103/">客房服务员</a> <a
												href="/c101110100-p290104/" class="cur">酒店经理</a>
										</div>
									</li>
									<li>
										<h4>餐饮</h4>
										<div class="text">
											<a href="/c101110100-p290208/">后厨</a> <a
												href="/c101110100-p290209/">配菜打荷</a> <a
												href="/c101110100-p290210/">茶艺师</a> <a
												href="/c101110100-p290211/">西点师</a> <a
												href="/c101110100-p290299/">餐饮</a> <a
												href="/c101110100-p290201/">收银</a> <a
												href="/c101110100-p290202/">服务员</a> <a
												href="/c101110100-p290203/">厨师</a> <a
												href="/c101110100-p290204/">咖啡师</a> <a
												href="/c101110100-p290205/">送餐员</a> <a
												href="/c101110100-p290206/">餐饮店长</a> <a
												href="/c101110100-p290207/">领班</a>
										</div>
									</li>
									<li>
										<h4>零售</h4>
										<div class="text">
											<a href="/c101110100-p290305/">督导/巡店</a> <a
												href="/c101110100-p290306/">陈列员</a> <a
												href="/c101110100-p290307/">理货员</a> <a
												href="/c101110100-p290399/">零售</a> <a
												href="/c101110100-p290301/">收银</a> <a
												href="/c101110100-p290302/" class="cur">导购</a> <a
												href="/c101110100-p290303/">店员/营业员</a> <a
												href="/c101110100-p290304/">门店店长</a>
										</div>
									</li>
									<li>
										<h4>美容/健身</h4>
										<div class="text">
											<a href="/c101110100-p210607/">发型师</a> <a
												href="/c101110100-p210608/">美甲师</a> <a
												href="/c101110100-p210609/">化妆师</a> <a
												href="/c101110100-p210699/">健身</a> <a
												href="/c101110100-p210601/">瑜伽教练</a> <a
												href="/c101110100-p210602/">瘦身顾问</a> <a
												href="/c101110100-p210603/" class="cur">游泳教练</a> <a
												href="/c101110100-p210604/">美体教练</a> <a
												href="/c101110100-p210405/">美容师/顾问</a> <a
												href="/c101110100-p210605/">舞蹈教练</a> <a
												href="/c101110100-p210606/">健身教练</a>
										</div>
									</li>
									<li>
										<h4>其他服务业职位</h4>
										<div class="text">
											<a href="/c101110100-p290401/">其他服务业职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
						<dl>
							<dd>
								<i class="icon-arrow-right"></i> <b>生产制造</b> <a
									href="/c101110100-p300102/">生产总监</a> <a
									href="/c101110100-p300105/">安全员</a>
							</dd>
							<div class="menu-line"></div>
							<div class="menu-sub">
								<p class="menu-article">生产制造</p>
								<ul>
									<li>
										<h4>生产营运</h4>
										<div class="text">
											<a href="/c101110100-p300199/">生产营运</a> <a
												href="/c101110100-p300101/">厂长/工厂经理</a> <a
												href="/c101110100-p300102/">生产总监</a> <a
												href="/c101110100-p300103/">生产经理/车间主任</a> <a
												href="/c101110100-p300104/">生产组长/拉长</a> <a
												href="/c101110100-p300105/">生产员</a> <a
												href="/c101110100-p300106/">生产设备管理</a> <a
												href="/c101110100-p300107/">生产计划/物料控制</a> <a
												href="/c101110100-p300108/" class="cur">生产跟单</a>
										</div>
									</li>
									<li>
										<h4>质量安全</h4>
										<div class="text">
											<a href="/c101110100-p300201/">质量管理/测试</a> <a
												href="/c101110100-p300202/">可靠度工程师</a> <a
												href="/c101110100-p300203/">故障分析师</a> <a
												href="/c101110100-p300204/">认证工程师</a> <a
												href="/c101110100-p300205/">体系工程师</a> <a
												href="/c101110100-p300206/">审核员</a> <a
												href="/c101110100-p300207/">安全员</a>
										</div>
									</li>
									<li>
										<h4>机械设计/制造</h4>
										<div class="text">
											<a href="/c101110100-p300399/">机械设计/制造</a> <a
												href="/c101110100-p300301/">机械工程师</a> <a
												href="/c101110100-p300302/">机械设计师</a> <a
												href="/c101110100-p300303/">机械设备工程师</a> <a
												href="/c101110100-p300304/">机械维修/保养</a> <a
												href="/c101110100-p300305/">机械制图</a> <a
												href="/c101110100-p300306/">机械结构工程师</a> <a
												href="/c101110100-p300307/" class="cur">工业工程师</a> <a
												href="/c101110100-p300308/">工艺/制程工程师</a> <a
												href="/c101110100-p300309/">材料工程师</a> <a
												href="/c101110100-p300310/">机电工程师</a> <a
												href="/c101110100-p300311/">CNC/数控</a> <a
												href="/c101110100-p300312/">冲压工程师</a> <a
												href="/c101110100-p300313/">夹具工程师</a> <a
												href="/c101110100-p300314/">模具工程师</a> <a
												href="/c101110100-p300315/">焊接工程师</a> <a
												href="/c101110100-p300316/">注塑工程师</a> <a
												href="/c101110100-p300317/">铸造/锻造工程师</a>
										</div>
									</li>
									<li>
										<h4>化工</h4>
										<div class="text">
											<a href="/c101110100-p300499/">化工</a> <a
												href="/c101110100-p300401/">化工工程师</a> <a
												href="/c101110100-p300402/">实验室技术员</a> <a
												href="/c101110100-p300403/">化学分析</a> <a
												href="/c101110100-p300404/" class="cur">涂料研发</a> <a
												href="/c101110100-p300405/">化妆品研发</a> <a
												href="/c101110100-p300406/">食品/饮料研发</a>
										</div>
									</li>
									<li>
										<h4>服装/纺织/皮革</h4>
										<div class="text">
											<a href="/c101110100-p300501/">服装设计</a> <a
												href="/c101110100-p300502/">女装设计</a> <a
												href="/c101110100-p300503/">男装设计</a> <a
												href="/c101110100-p300504/">童装设计</a> <a
												href="/c101110100-p300505/">内衣设计</a> <a
												href="/c101110100-p300506/">面料设计</a> <a
												href="/c101110100-p300507/">面料辅料开发</a> <a
												href="/c101110100-p300508/" class="cur">面料辅料采购</a> <a
												href="/c101110100-p300509/">打样/制版</a> <a
												href="/c101110100-p300510/">服装/纺织/皮革跟单</a>
										</div>
									</li>
									<li>
										<h4>技工/普工</h4>
										<div class="text">
											<a href="/c101110100-p300601/">普工/操作工</a> <a
												href="/c101110100-p300602/">叉车</a> <a
												href="/c101110100-p300603/">铲车</a> <a
												href="/c101110100-p300604/">焊工</a> <a
												href="/c101110100-p300605/">氩弧焊工</a> <a
												href="/c101110100-p300606/">电工</a> <a
												href="/c101110100-p300608/">木工</a> <a
												href="/c101110100-p300609/">漆工</a> <a
												href="/c101110100-p300610/">车工</a> <a
												href="/c101110100-p300611/">磨工</a> <a
												href="/c101110100-p300612/">铣工</a> <a
												href="/c101110100-p300613/">钳工</a> <a
												href="/c101110100-p300614/">钻工</a> <a
												href="/c101110100-p300615/">铆工</a> <a
												href="/c101110100-p300616/">钣金</a> <a
												href="/c101110100-p300617/" class="cur">抛光</a> <a
												href="/c101110100-p300618/">机修工</a> <a
												href="/c101110100-p300619/">折弯工</a> <a
												href="/c101110100-p300620/">电镀工</a> <a
												href="/c101110100-p300621/">喷塑工</a> <a
												href="/c101110100-p300622/">注塑工</a> <a
												href="/c101110100-p300623/">组装工</a> <a
												href="/c101110100-p300624/">包装工</a> <a
												href="/c101110100-p300625/">空调工</a> <a
												href="/c101110100-p300626/">电梯工</a> <a
												href="/c101110100-p300627/">锅炉工</a> <a
												href="/c101110100-p300628/">学徒工</a>
										</div>
									</li>
									<li>
										<h4>其他生产制造职位</h4>
										<div class="text">
											<a href="/c101110100-p300701/">其他生产制造职位</a>
										</div>
									</li>
								</ul>
							</div>
						</dl>
					</div>
				</div>
				<!--<div class="promotion-img"><a href="#"><img src="http://172.16.0.44/v2/web/geek/images/promotion-1.png" alt="" /></a></div>-->
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
													深圳<span class="vline"></span>5-10年<span class="vline"></span>本科
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
									<a class="btn btn-outline" href="/c101110100/"
										class="open_joblist">查看更多</a>
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
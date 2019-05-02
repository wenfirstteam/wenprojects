<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>汉中人才网-搜索职位</title>
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
</style>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
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
<div id="wrap" class="search-job-list-wrap">
<div id="header">
    <div class="inner home-inner">
    <div class="logo">
				<font size="6" face="微软雅黑" color="#00d7c6"><B>汉中人才网</B></font>
			</div>
        <div class="nav">
				<ul>
					<li class=""><a class="header-home"
						href="../index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></li>
					<li class="cur"><a class="header-job"
						href="https://www.zhipin.com/job_detail/">职位</a></li>
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
			</div>
		</div>
	</div>
	 <div id="filter-box">
        <div class="inner home-inner">
            <div class="box-shadow-box"></div>
            <div class="filter-select-box">
                <div class="dropdown-wrap">
                    
                    <span class="dropdown-select">
                        <input type="text" ka="sel-exp" value="工作经验" class="ipt" readonly>
                        <i class="icon-select-arrow"></i>
                        <div class="dropdown-menu">
                            <ul>
                                        <li><a href="/c101010100/" ka="sel-exp-0">不限</a></li>
                                        <li><a href="/c101010100/e_102/" ka="sel-exp-102">应届生</a></li>
                                        <li><a href="/c101010100/e_103/" ka="sel-exp-103">1年以内</a></li>
                                        <li><a href="/c101010100/e_104/" ka="sel-exp-104">1-3年</a></li>
                                        <li><a href="/c101010100/e_105/" ka="sel-exp-105">3-5年</a></li>
                                        <li><a href="/c101010100/e_106/" ka="sel-exp-106">5-10年</a></li>
                                        <li><a href="/c101010100/e_107/" ka="sel-exp-107">10年以上</a></li>
                            </ul>
                        </div>
                    </span>
                </div>
                <div class="dropdown-wrap">
                    
                    <span class="dropdown-select">
                            <input type="text" value="学历要求" ka="sel-degree" class="ipt" readonly>
                        <i class="icon-select-arrow"></i>
                        <div class="dropdown-menu">
                            <ul>
                                        <li><a href="/c101010100/" ka="sel-degree-0">不限</a></li>
                                        <li><a href="/c101010100/d_209/" ka="sel-degree-209">初中及以下</a></li>
                                        <li><a href="/c101010100/d_208/" ka="sel-degree-208">中专/中技</a></li>
                                        <li><a href="/c101010100/d_206/" ka="sel-degree-206">高中</a></li>
                                        <li><a href="/c101010100/d_202/" ka="sel-degree-202">大专</a></li>
                                        <li><a href="/c101010100/d_203/" ka="sel-degree-203">本科</a></li>
                                        <li><a href="/c101010100/d_204/" ka="sel-degree-204">硕士</a></li>
                                        <li><a href="/c101010100/d_205/" ka="sel-degree-205">博士</a></li>
                            </ul>
                        </div>
                    </span>
                </div>
                <div class="dropdown-wrap">
                    
                    <span class="dropdown-select">
                            <input type="text" ka="sel-salary" value="薪资要求" class="ipt" readonly>
                        <i class="icon-select-arrow"></i>
                        <div class="dropdown-menu">
                            <ul>
                                        <li><a href="/c101010100/" ka="sel-salary-0">不限</a></li>

                                        <li><a href="/c101010100/y_1/" ka="sel-salary-1">3k以下</a></li>

                                        <li><a href="/c101010100/y_2/" ka="sel-salary-2">3-5k</a></li>

                                        <li><a href="/c101010100/y_3/" ka="sel-salary-3">5-10k</a></li>

                                        <li><a href="/c101010100/y_4/" ka="sel-salary-4">10-15k</a></li>

                                        <li><a href="/c101010100/y_5/" ka="sel-salary-5">15-20k</a></li>

                                        <li><a href="/c101010100/y_6/" ka="sel-salary-6">20-30k</a></li>

                                        <li><a href="/c101010100/y_7/" ka="sel-salary-7">30-50k</a></li>

                                        <li><a href="/c101010100/y_8/" ka="sel-salary-8">50k以上</a></li>

                            </ul>
                        </div>
                    </span>
                </div>
                <div class="dropdown-wrap">
                    <span class="dropdown-select">
                            <input type="text" ka="sel-scale" value="公司规模" class="ipt" readonly>
                        <i class="icon-select-arrow"></i>
                        <div class="dropdown-menu">
                            <ul>
                                       <li><a href="/c101010100/" ka="sel-scale-0">不限</a></li>
                                       <li><a href="/c101010100/s_301/" ka="sel-scale-301">1~50</a></li>
                                       <li><a href="/c101010100/s_302/" ka="sel-scale-302">50~100</a></li>
                                       <li><a href="/c101010100/s_303/" ka="sel-scale-303">100~400</a></li>
                                       <li><a href="/c101010100/s_304/" ka="sel-scale-304">400~1000</a></li>
                                       <li><a href="/c101010100/s_305/" ka="sel-scale-305">1000~10000</a></li>
                                       <li><a href="/c101010100/s_306/" ka="sel-scale-306">10000以上</a></li>
                            </ul>
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
                <div class="job-tab" style="display: none" data-filter="" data-keyword="" data-l3code="" data-rescount="433618" data-page="1" data-source="1">
                    <a href="javascript:;" class="cur" ka="recommend-job-list">热门职位</a><a href="javascript:;" ka="new-job-list">最新职位</a>
                </div>

                    <div class="company-list">
                    </div>
                    <ul>
                            <li>
                                <div class="job-primary">
                                    <div class="info-primary">
                                        <h3 class="name">
                                            <a href="/job_detail/c2cf94a2b99762eb1H1z3N21FFA~.html" data-jid="c2cf94a2b99762eb1H1z3N21FFA~" data-itemid="1" data-lid="1sD6k6heEGM.search" data-jobid="39970842" data-index="0" ka="search_list_1" target="_blank">
                                                <div class="job-title">Java</div>
                                                <span class="red">25k-50k·13薪</span>
                                                <div class="info-detail"></div>
                                            </a>
                                        </h3>
                                        <p>北京 昌平区 昌平<em class="vline"></em>1-3年<em class="vline"></em>本科</p>
                                    </div>
                                    <div class="info-company">
                                        <div class="company-text">
                                            <h3 class="name"><a href="/gongsi/c1acbe1a3a26267703Z63d-_EA~~.html" ka="search_list_company_1_custompage" target="_blank">北京小小海星科技...</a></h3>
                                            <p>互联网<em class="vline"></em>不需要融资<em class="vline"></em>100-499人</p>
                                        </div>
                                    </div>
                                    <div class="info-publis">
                                        <h3 class="name"><img src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190423/43905cc666a4dbc44a880899075c1c94d9e824b51e42adfc975a55adf240dabd_s.png?x-oss-process=image/resize,w_40,limit_0" />杨家浩<em class="vline"></em>HR</h3>
                                        <p>发布于04月22日</p>
                                    </div>
                                    <a href="javascript:;" data-url="/gchat/addRelation.json?jobId=c2cf94a2b99762eb1H1z3N21FFA~&lid=1sD6k6heEGM.search" redirect-url="/geek/new/index/chat?id=96302df5d741f82f0XRy2dy7FlA~" class="btn btn-startchat">立即沟通
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="job-primary">
                                    <div class="info-primary">
                                        <h3 class="name">
                                            <a href="/job_detail/102e9175881212ab1Hxz3dm5FVI~.html" data-jid="102e9175881212ab1Hxz3dm5FVI~" data-itemid="2" data-lid="1sD6k6heEGM.search" data-jobid="38964450" data-index="1" ka="search_list_2" target="_blank">
                                                <div class="job-title">后台开发工程师</div>
                                                <span class="red">18k-26k</span>
                                                <div class="info-detail"></div>
                                            </a>
                                        </h3>
                                        <p>北京 朝阳区 国贸<em class="vline"></em>1-3年<em class="vline"></em>本科</p>
                                    </div>
                                    <div class="info-company">
                                        <div class="company-text">
                                            <h3 class="name"><a href="/gongsi/eac4304fba31df8d1XB63Nu4.html" ka="search_list_company_2_custompage" target="_blank">用友网络</a></h3>
                                            <p>互联网<em class="vline"></em>已上市<em class="vline"></em>10000人以上</p>
                                        </div>
                                    </div>
                                    <div class="info-publis">
                                        <h3 class="name"><img src="https://img2.bosszhipin.com/mcs/useravatar/20150409/3b6bcb86467dfd97a76a4f044ee7f65f8c7dd922ad47494fc02c388e12c00eac_s.jpg?x-oss-process=image/resize,w_40,limit_0" />范昕<em class="vline"></em>HR</h3>
                                        <p>发布于04月17日</p>
                                    </div>
                                    <a href="javascript:;" data-url="/gchat/addRelation.json?jobId=102e9175881212ab1Hxz3dm5FVI~&lid=1sD6k6heEGM.search" redirect-url="/geek/new/index/chat?id=33de58fec6fe26350nB83t0~" class="btn btn-startchat">立即沟通
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="job-primary">
                                    <div class="info-primary">
                                        <h3 class="name">
                                            <a href="/job_detail/341b48d9de838e381H1y29q9GFc~.html" data-jid="341b48d9de838e381H1y29q9GFc~" data-itemid="3" data-lid="1sD6k6heEGM.search" data-jobid="39807085" data-index="2" ka="search_list_3" target="_blank">
                                                <div class="job-title">Java实习生</div>
                                                <span class="red">1k-2k</span>
                                                <div class="info-detail"></div>
                                            </a>
                                        </h3>
                                        <p>北京 朝阳区 东大桥<em class="vline"></em>经验不限<em class="vline"></em>大专</p>
                                    </div>
                                    <div class="info-company">
                                        <div class="company-text">
                                            <h3 class="name"><a href="/gongsi/ce552c696dfb13d40XV90ty-.html" ka="search_list_company_3_custompage" target="_blank">上玄</a></h3>
                                            <p>互联网<em class="vline"></em>天使轮<em class="vline"></em>20-99人</p>
                                        </div>
                                    </div>
                                    <div class="info-publis">
                                        <h3 class="name"><img src="https://img2.bosszhipin.com/boss/avatar/avatar_14.png?x-oss-process=image/resize,w_40,limit_0" />王胜<em class="vline"></em>人事</h3>
                                        <p>发布于04月22日</p>
                                    </div>
                                    <a href="javascript:;" data-url="/gchat/addRelation.json?jobId=341b48d9de838e381H1y29q9GFc~&lid=1sD6k6heEGM.search" redirect-url="/geek/new/index/chat?id=97e28d17193f9b301XV90tS_F1M~" class="btn btn-startchat">立即沟通
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="job-primary">
                                    <div class="info-primary">
                                        <h3 class="name">
                                            <a href="/job_detail/18f8d56e4a5e94511HFz3d24EFc~.html" data-jid="18f8d56e4a5e94511HFz3d24EFc~" data-itemid="4" data-lid="1sD6k6heEGM.search" data-jobid="35960505" data-index="3" ka="search_list_4" target="_blank">
                                                <div class="job-title">Java开发工程师</div>
                                                <span class="red">20k-40k</span>
                                                <div class="info-detail"></div>
                                            </a>
                                        </h3>
                                        <p>北京  <em class="vline"></em>1-3年<em class="vline"></em>本科</p>
                                    </div>
                                    <div class="info-company">
                                        <div class="company-text">
                                            <h3 class="name"><a href="/gongsi/92e05e7431035db003Jz29U~.html" ka="search_list_company_4_custompage" target="_blank">新橙科技</a></h3>
                                            <p>计算机软件<em class="vline"></em>不需要融资<em class="vline"></em>100-499人</p>
                                        </div>
                                    </div>
                                    <div class="info-publis">
                                        <h3 class="name"><img src="https://img.bosszhipin.com/beijin/mcs/useravatar/20190102/66b765b040fe4a11fa53e59efdf73d1acfcd208495d565ef66e7dff9f98764da_s.jpg?x-oss-process=image/resize,w_40,limit_0" />步秋焦<em class="vline"></em>招聘者</h3>
                                        <p>发布于03月08日</p>
                                    </div>
                                    <a href="javascript:;" data-url="/gchat/addRelation.json?jobId=18f8d56e4a5e94511HFz3d24EFc~&lid=1sD6k6heEGM.search" redirect-url="/geek/new/index/chat?id=6c8b4debc0bbb52a1XV_2tW5EVY~" class="btn btn-startchat">立即沟通
                                    </a>
                                </div>
                            </li>
                         </ul>
        <div class="page">
            <a href="/c101010100/?page=0" ka="page-prev" class="prev"></a>
        <a href="javascript:;" class="cur" ka="page-cur">1</a>
        <a href="/c101010100/?page=2" ka="page-2">2</a>
        <a href="/c101010100/?page=3" ka="page-3">3</a>
        <span>...</span>
            <a href="/c101010100/?page=2" ka="page-next" class="next"></a>
        </div>
            </div>
        </div>
    </div>
<script src="../../js/main.js"></script>
<input type="hidden" id="page_key_name" value="cpc_job_list" />
</body>
</html>

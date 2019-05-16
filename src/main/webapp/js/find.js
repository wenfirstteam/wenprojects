function findPosition(){
	$.ajax({
		async : false,
		url : "/rcw/position/findPositionFormUser.action",
		data : {"publish":1},
		type : "GET",
		success : function(msg) {
			findShow();
		},
		error : function(msg) {
			alert("系统异常！");
		}
	});
}
function findCompany(){
	$.ajax({
		async : false,
		url : "/rcw/introduction/findIntroductionUser.action",
		data : {},
		type : "GET",
		success : function(msg) {
			findShow();
		},
		error : function(msg) {
			alert("系统异常！");
		}
	});
}
function resume(){
	$.ajax({
		async : false,
		url: "/rcw/resume/findResumeByUser.action",
		data:{},
		type:"GET",
		success:function(msg){
			findShow();
		},
		error:function(msg){
			alert("系统异常！");
		}
	});
}

function findPositionByCompany(){
	$(function(){
		$.ajax({
			async : false,
			url: "/rcw/position/findPositionFromCompany.action",
			data:{},
			type:"GET",
			success:function(msg){
				findShow();
			},
			error:function(msg){
				alert("系统异常！");
			}
		});
	});
}

function findPeople(){
	$.ajax({
		async : false,
		url : "/rcw/resume/findResumeByCompany.action",
		data : {},
		type : "GET",
		success : function(msg) {
			findShow();
		},
		error : function(msg) {
			alert("系统异常！");
		}
	});
}

function findInfo(){
	$.ajax({
		async : false,
		url: "/rcw/introduction/findIntroduction.action",
		data:{},
		type:"GET",
		success:function(msg){
			findShow();
		},
		error:function(msg){
			alert("系统异常！");
		}
	});
}

function show(position) {
	$.ajax({
		async : false,
		url : "/rcw/position/findPositionFormUser.action",
		data : {
			"position" : position,
			"publish"  : 1
		},
		type : "GET",
		success : function(msg) {
			if(msg.status == 200){
				findShow();
				window.location.href="";
			}
		},
		error : function(msg) {
			alert("系统异常！");
		}
	});
}

//解决Ajax异步请求 springMvc 不跳转页面的问题
$.ajaxSetup( {
	//设置ajax请求结束后的执行动作
    complete :
        function(XMLHttpRequest, textStatus) {
			// 通过XMLHttpRequest取得响应头，sessionstatus
            var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
            if (sessionstatus == "TIMEOUT") {
                var win = window;
                while (win != win.top){
                    win = win.top;
                }
                win.location.href= XMLHttpRequest.getResponseHeader("CONTEXTPATH");
            }
        }
});
//管理员查询未审核的信息
function findWaitInfo(){
	$.ajax({
		async : false,
		url : "/rcw/position/findPositionFormUser.action",
		data : {
			"publish":2
		},
		type : "GET",
		success : function(msg) {},
		error : function(msg) {
			alert("系统异常！");
		}
	});
}

function updatePublish(publish,id){
		$.ajax({
			async : false,
			url:"/rcw/position/updatePosition.action", 
			type:"POST",
			data:{
				"id":id,
				"publish":publish
				},
			success : function(msg) {
				findWaitInfo();
				window.location.href="manager.jsp";
			}
		});
}
//查找显示的新闻
function findShow(){
	$.ajax({
		async : false,
		url:"/rcw/news/findNews.action", 
		type:"Get",
		data:{"flag":0},
		success : function(msg) {
		}
	});
}
//查找所有新闻
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

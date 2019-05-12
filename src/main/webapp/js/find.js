function findPosition(){
	$.ajax({
		async : false,
		url : "/rcw/position/findPositionFormUser.action",
		data : {"publish":1},
		type : "GET",
		success : function(msg) {
			if(msg.status != 200)
			{
				alert("查询载入出现错误，请刷新网页重试！");
			}
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
			if(msg.status != 200)
			{
				alert("查询载入出现错误，请刷新网页重试！");
			}
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
			if(msg.status != 200)
			{
				alert("查询出现错误，请刷新网页重试！");
			}
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
				if(msg.status != 200)
				{
					alert("查询出现错误，请刷新网页重试！");
				}
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
			if (msg.status != 200) {
				alert("查询载入出现错误，请刷新网页重试！");
			}
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
			if(msg.status != 200)
			{
				alert("查询出现错误，请刷新网页重试！");
			}
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
			if(msg.status != 200)
			{
				alert("查询出现错误，请刷新网页重试！");
			}else{
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

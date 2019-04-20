<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>汉中人才网</title>
    <link href="https://static.zhipin.com/zhipin/v149/web/geek/css/main.css" type="text/css" rel="stylesheet">
    <script>
        var positionList = [];
    </script>
    <link rel="canonical" href="https://www.zhipin.com/">
    <meta name="applicable-device" content="pc">
    <meta name="mobile-agent" content="format=html5;url=https://m.zhipin.com/">
</head>
<body class="home-body promotion-five zhipin-v2">
<!--<img src="images/homg-demo-bg.jpg" style="display: block; display: none; position: absolute; z-index: 9999; top:49px; opacity: 0.8; left: 50%; transform: translateX(-50%)" alt="">-->
<div id="header">
    <div class="inner home-inner">
        <div class="logo">
            < a href="https://www.zhipin.com/" class="header-home-logo" title="汉中人才网"><span>汉中人才网</span></ a>
        </div>
            <div class="nav-city">
                <div class="city-box">
                    <div class="dorpdown-city"></div>
                </div>
            </div>
        <div class="nav">
            <ul>
                <li class="cur"><a class="header-home" href="https://www.zhipin.com/">首页</ a></li>
                <li class=""><a class="header-job" href="https://www.zhipin.com/job_detail/">职位</ a></li>
                <li class=""><a class="header_brand" href="https://www.zhipin.com/gongsi/">公司</ a></li>
                <li class=""><a class="header-article" href="https://news.zhipin.com/">资讯</ a></li>
            </ul>
        </div>
        <!-- 判断是否登录-->
       <%--  <div class="user-nav">
                <ul>
                	<li class="">
                	<c:if test="#{user == null }">
                	
                	</c:if>
                    <a class="header-message" href="https://www.zhipin.com/geek/new/index/chat">登录<span c --%>
                    
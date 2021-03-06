<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<!-- 禁用电话号码检测功能，禁止对数字随便可以拨号 -->
		<meta name="format-detection" content="telephone=no">
		<!-- 禁用地址检测功能，禁止跳转到地图 -->
		<meta name="format-detection" content="address=no">
		<!-- 在苹果设备上以全屏方式打开本网页 -->
		<meta name="apple-mobile-web-app-capable" content="yes">
		<!-- 设置在苹果设备上状态的颜色，默认白色，要设置成什么颜色以Web颜色的风格而定 -->
		<meta name="apple-mobile-web-app-status-bar-style" content="white">
		<title>微信商城-用户中心</title>
		<link rel="stylesheet" type="text/css" href="vendor/normalize.min.css"/>
		<!-- 可选 -->
		<link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css" />
		<!-- 可选 -->
		<link rel="stylesheet" href="vendor/swiper/swiper.min.css" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/userinfo.css" />
		<!-- 苹果设备在桌面上生成的快捷图标 -->
		<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
		<link rel="icon" href="img/favicon.ico">
	</head>
	
	<body>
		<header class="header-wrapper">
			<ul class="header-list">
				<li>
					<a href="index.html">
						<i class="fa fa-2x fa-home"></i>
						<p>首页</p>
					</a>
				</li>
				<li>
					<a href="productlist.html">
						<i class="fa fa-2x fa-th"></i>
						<p>商品分类</p>
					</a>
				</li>
				<li>
					<a href="shopcar.html">
						<i class="fa fa-2x fa-shopping-cart"></i>
						<p>购物车</p>
					</a>
				</li>
				<li class="list-active">
					<a href="userinfo.html">
						<i class="fa fa-2x fa-user"></i>
						<p>用户中心</p>
					</a>
				</li>
			</ul>
		</header>
		<section style="width: 100%; height: .6rem;"></section>
		
		<section class="user-main">
			<div class="main-personMessage">
				<div class="personMessage-img">
					<img src="img/morenhead.jpg"/>
				</div>
				<div class="personMessage-right">
					<p class="nick-name">${user.userName } </p>
					<p><span>邮箱：</span>${user.email }</p>
				   	<p><span>待付款：</span>0</p>
				    <p><span>待收货：</span>0</p>
				</div>
			</div>
			
			<div class="main-list">
				<ul class="list-item">
					<a href="">
						<li>
							<span>我的订单</span>
							<img src="img/goforword.png"/>
						</li>
					</a>
					<a href="<%=request.getContextPath() %>/toAddress">
						<li>
							<span>收货地址</span>
							<img src="img/goforword.png"/>
						</li>
					</a>
					<a href="">
						<li>
							<span>退出登录</span>
							<img src="img/goforword.png"/>
						</li>
					</a>
				</ul>
			</div>
		</section>
		
		<script src="js/resize.js"></script>
	</body>
</html>

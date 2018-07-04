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
		<title>微信商城-产品详细</title>
		<link rel="stylesheet" type="text/css" href="vendor/normalize.min.css" />
		<!-- 可选 -->
		<link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css" />
		<!-- 可选 -->
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/info.css" />
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
				<li>
					<a href="<%=request.getContextPath() %>/toUserInfo">
						<i class="fa fa-2x fa-user"></i>
						<p>用户中心</p>
					</a>
				</li>
			</ul>
		</header>
		<section style="width: 100%; height: .6rem;"></section>

		<section class="info-wrapper">
			<div class="content">
				<div class="content-top">
					<div class="top-left">
						<img src="img/product1.png" />
					</div>
					<div class="top-right">
						<p class="title">广联达变更算量</p>
						<p class="details">菜鸟教程(www.runoob.com)提供了最全的编程技术基础教程, 介绍了HTML、CSS、Javascript、Python,Java,Ruby,C,PHP , MySQL等各种编程语言的基础知识</p>
						<p class="price">价格:<span>￥235</span></p>
					</div>
				</div>

				<div class="content-bottom">
					<div class="bottom-text">
						<span>购买数量:</span>
					</div>
					<div class="bottom-inner">
						<div class="inner-Reduction">
							-
						</div>
						<input class="input" type="text" style="width: 1.2rem;height: .3rem;border: none;text-align: center;color: #990000;font-size: .16rem;font-weight: bold;position: absolute;top: 0;left: 21%;" value="1" />
						<div class="inner-plus">
							+
						</div>
					</div>
				</div>
			</div>

			<div class="container">

				<p class="container-title">详细说明</p>
				<p class="container-details">沪江英语网是免费的英语学习网站,提供白加得151的英文怎么说信息,包含白加得151的英文怎么说的相关学习资料、单词测试、评论、学习推荐等信息。</p>
				<div class="container-img">
					<img src="img/product1.png" style="width: 9rem;max-height: 7.5rem;" />
				</div>

			</div>

			<div style="width: 100%; height: .5rem;"></div>
			<div class="plus-shopcar">
				<a href="">加入购物车</a>
			</div>
		</section>

		<script src="js/resize.js"></script>
	</body>

</html>
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
		<title>微信商城-地址</title>
		<link rel="stylesheet" type="text/css" href="vendor/normalize.min.css" />
		<!-- 可选 -->
		<link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css" />
		<!-- 可选 -->
		<link rel="stylesheet" href="vendor/swiper/swiper.min.css" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/address.css" />
		<!-- 苹果设备在桌面上生成的快捷图标 -->
		<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
		<link rel="icon" href="img/favicon.ico">
		
		<script type="text/javascript" src="<%=request.getContextPath() %>/static/vendor/jquery.min.js" ></script>
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
					<a href="userinfo.html">
						<i class="fa fa-2x fa-user"></i>
						<p>用户中心</p>
					</a>
				</li>
			</ul>
		</header>
		<section style="width: 100%; height: .6rem;"></section>

		<section class="address-container">
			<div class="container-message" id="div-info">
				<div class="message-inner">
					<input type="text" placeholder="请填写你的真实姓名" name="receiver"/>
					<select name="privence">
		    			<option value="">--请选择所在省市--</option>
		    			<option value="001">北京市</option>
		    			<option value="002">上海市</option>
		    			<option value="003">重庆市</option>
		    		</select>&nbsp;&nbsp;
					<select name="city">
		    			<option value="privence">--请选择所在城市--</option>
		    			<option value="001">长沙</option>
		    			<option value="002">武汉</option>
		    			<option value="003">昆明</option>
		    		</select>&nbsp;&nbsp;
					<select name="area">
		    			<option value="privence">--请选择所在地区--</option>
		    			<option value="001">沙坪坝区</option>
		    			<option value="002">呈贡区</option>
		    			<option value="003">五华区</option>
		    		</select>
					<input type="text" placeholder="详细地址（不必重复填写地址）" name="address"/>
					<input type="text" placeholder="手机或者电话" name="phone"/>
					<input type="submit" value="保存" id="submit" onclick="save(${user.id})" />
				</div>
			</div>
			
			<c:forEach items="${addressList }" var="userAddress">
				<div class="container-address">
				<p>${userAddress.receiver }(${userAddress.phone })</p>
				<p>${userAddress.province } ${userAddress.city }${userAddress.area } ${userAddress.address }</p>
				<div class="p-line"></div>
				<div class="address-editor">
					<div class="editor-left">
						<i class="fa fa-edit"></i>
						<span>编辑</span>
					</div>
					<div class="editor-right">
						<i class="fa fa-trash-o"></i>
						<span>删除</span>
					</div>
				</div>
			</div>
			</c:forEach>
			
			
			<!-- <div class="container-address">
				<p>张三(15788888888)</p>
				<p>天津市 市辖县 静海县 qwe</p>
				<div class="p-line"></div>
				<div class="address-editor">
					<div class="editor-left">
						<i class="fa fa-edit"></i>
						<span>编辑</span>
					</div>
					<div class="editor-right">
						<i class="fa fa-trash-o"></i>
						<span>删除</span>
					</div>
				</div>
			</div> -->
		</section>

		<script >
			function save(){
				var url = "<%=request.getContextPath()%>/save";

				 $.get(url, {
					 sysUserId : o,
						
					}, function(shopReceiveAddress) {
					
						if (shopReceiveAddress != null) {
							var html = [];
		        			html.push('<div class="container-address">');
		        			html.push('  <p>'+shopReceiveAddress.receiver+'('+shopReceiveAddress.phone+')'+'</p>');
		        			html.push('    	<p>'+shopReceiveAddress.province+' '+shopReceiveAddress.city+' '+shopReceiveAddress.area+' '+shopReceiveAddress.address+'</p>');
		        			html.push('		 <div class="p-line"></div>');
		        			html.push('    <div class="address-editor">');
		        			html.push('    <div class="editor-left">');
		        			html.push('  	 <i class="fa fa-edit"></i>');
		        			html.push('  	 <span>编辑</span>');
		        			html.push('  	 </div>');
		        			html.push('			<div class="editor-right">');
		        			html.push('			<i class="fa fa-trash-o"></i>');
		        			html.push('			<span>删除</span>');
		        			html.push('    </div>');
		        			html.push('	 </div>');
		        			html.push('</div>');
		        			$('#div-info').after(html.join(''));
							
						}
					})
			}
		
		</script>
	</body>

</html>
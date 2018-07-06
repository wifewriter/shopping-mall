<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
		<title>微信商城-购物车</title>
		<%@include file="../../static/import.jsp" %>
		<link rel="stylesheet" type="text/css" href="${ctx }/static/vendor/normalize.min.css"/>
		<!-- 可选 -->
		<link rel="stylesheet" href="${ctx }/static/vendor/font-awesome/css/font-awesome.min.css" />
		<!-- 可选 -->
		<link rel="stylesheet" href="${ctx }/static/vendor/swiper/swiper.min.css" />
		<link rel="stylesheet" href="${ctx }/static/css/common.css" />
		<link rel="stylesheet" href="${ctx }/static/css/shopcar.css" />
		<!-- 苹果设备在桌面上生成的快捷图标 -->
		<link rel="apple-touch-icon" href="${ctx}/static/img/apple-touch-icon.png">
		<link rel="icon" href="${ctx}/static/img/favicon.ico">
	</head>
<body>
	<%@include file="../../static/nav.jsp" %>

		<section style="width: 100%; height: .6rem;"></section>
        <section class="shopcar-container">
        <c:forEach items="${shopProductList }" var="shopProduct">
        
        
        	<div class="container-item ssm">
        		<a href="">
        			<div class="item-top">
	        			<img src="${ctx }/static/img/product1.png"/>
	        			<div class="top-right">
	        				<span>${shopProduct.name }</span>
	        			</div>
	        		</div>
        		</a>
        		<div class="item-center">
        			<div class="center-span">
        				<span>数量:</span>
        			</div>
        			<div class="center-inner">
						<div class="inner-Reduction subtract" >
					    	-
					    </div>
					    <input id="univalence" type="hidden" value="${shopProduct.price }">
					    <input class="shopcar-value" id="quantity" type="text" style="width: 1.2rem;height: .3rem;border: none;text-align: center;color: #990000;font-size: .16rem;font-weight: bold;position: absolute;top: 0;left: 21%;" value="${shopProduct.cartCount }"/>
					    <div class="inner-plus augment">
					    	+
					    </div>
					    <input id="repertory" type="hidden" value="${shopProduct.number }">
					</div>
        		</div>
        		<div class="item-bottom">
        			<div class="bottom-span">
        				<span>小计：</span>
        			</div>
        			<div class="bottom-right">
        				<span class="price subtotal">${shopProduct.subtotal}</span>&nbsp;&nbsp;&nbsp;&nbsp;
        				<a class="fa fa-trash-o fa-1x right-delete del" href="javascript:void(0)"></a>
        				<input type="hidden" value="${shopProduct.cartId }">	
        			</div>
        		</div>
        	</div>
        	
		
		</c:forEach>
    
	
				
	
	
        	<div class="container-inner">
        		<div class="inner-car">
        			<img src="${ctx }/static/img/cart_pic.png"/>
        		</div>
        		<p>您还没有宝贝，赶快去逛逛吧!</p>
        		<div class="inner-now">
        			<a href="productlist.html">马上去逛逛</a>
        		</div>
        	</div>
        </section>
        
       <section style="width: 100%;height: .5rem;"></section>
        <footer class="shopcar-footer">
        	<div class="footer-left">
        		<i class="fa fa-trash-o fa-2x clear"></i>
        		<span>清空</span>&nbsp;&nbsp;&nbsp;&nbsp;
        		<span class="left-price">总价： <span>￥79743</span></span>
        	</div>
        	<div class="footer-right">
        		<a href="orderlist.html">结算</a>
        	</div>
        </footer>
		
		<script src="${ctx }/static/js/resize.js"></script>
		
		<script>
		$(function(){
			//点击'+'数量加一
			$('.augment').click(function() {
				var initial = Number($(this).prev().val());
				var  inventory = $(this).next().val();
				if(initial<inventory){
				var ultimately = (initial+1);
				$(this).prev().val(ultimately);
				var univalence = Number($(this).prev().prev().val());
				
				var subtotal=univalence*ultimately;

				$(this).parent().parent().next().find(".subtotal").html(subtotal);
				}
			}) 
			
			//点击'-'数量减一
			$('.subtract').click(function() {
				var initial =Number($(this).next().next().val());
				
				if(initial>0){
				var ultimately = (initial-1);
				$(this).next().next().val(ultimately);
				
				var univalence =Number($(this).next().val());
				var subtotal=univalence*ultimately;
				$(this).parent().parent().next().find(".subtotal").html(subtotal);
				}
			});
			//点击'删除'删除当前商品
			$('.del').click(function(){
				var $this = $(this)
				var cartId = $(this).next().val();
				$.post('${ctx}/shopcar/deleteShopCart',{'cartId':cartId},function(row){
					if(row>0){
						$this.parents('.ssm').remove();
					}
				});
			});
			
			
		});
		</script>
		
	</body>
</html>
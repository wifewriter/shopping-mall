<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<!-- 禁用电话号码检测功能，禁止对数字随便可以拨号 -->
<meta name="format-detection" content="telephone=no">
<!-- 禁用地址检测功能，禁止跳转到地图 -->
<meta name="format-detection" content="address=no">
<!-- 在苹果设备上以全屏方式打开本网页 -->
<meta name="apple-mobile-web-app-capable" content="yes">
<!-- 设置在苹果设备上状态的颜色，默认白色，要设置成什么颜色以Web颜色的风格而定 -->
<meta name="apple-mobile-web-app-status-bar-style" content="white">
<title>微信商城-购物车</title>
<%@include file="../../static/import.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctx }/static/vendor/normalize.min.css" />
<!-- 可选 -->
<link rel="stylesheet"
	href="${ctx }/static/vendor/font-awesome/css/font-awesome.min.css" />
<!-- 可选 -->
<link rel="stylesheet"
	href="${ctx }/static/vendor/swiper/swiper.min.css" />
<link rel="stylesheet" href="${ctx }/static/css/common.css" />
<link rel="stylesheet" href="${ctx }/static/css/shopcar.css" />
<!-- 苹果设备在桌面上生成的快捷图标 -->
<link rel="apple-touch-icon"
	href="${ctx}/static/img/apple-touch-icon.png">
<link rel="icon" href="${ctx}/static/img/favicon.ico">

<link rel="stylesheet"
	href="${ctx }/static/vendor/layer/mobile/need/layer.css" />
</head>
<body>
	<%@include file="../../static/nav.jsp"%>
	<div style="height: 80px;"></div>
	<section id="shopCar" class="shopcar-container">
		<c:if test="${empty shopProductList }">
			<div class="container-inner" style="display: block;">
				<div class="inner-car">
					<img src="${ctx }/static/img/cart_pic.png" />
				</div>
				<p>您还没有宝贝，赶快去逛逛吧!</p>
				<div class="inner-now">
					<a href="/page/toMainPage">马上去逛逛</a>
				</div>
			</div>
		</c:if>

		<c:forEach items="${shopProductList }" var="shopProduct">


			<div  class="container-item ssm">
				<a href="/page/info/${shopProduct.id }">
					<div class="item-top">
						<img src="${ctx }/static/img/product1.png" />
						<div class="top-right">
							<span>${shopProduct.name }</span>
						</div>
					</div>
				</a>
				<div class="item-center">
					<div class="center-span">
						<span>数量:</span>
					</div>
					<input type="hidden" value="${shopProduct.number }">
					<div class="center-inner">
						<div class="inner-Reduction subtract">-</div>
						<input id="univalence" type="hidden" value="${shopProduct.price }">
						<input class="shopcar-value quantity" type="text"
							style="width: 1.2rem; height: .3rem; border: none; text-align: center; color: #990000; font-size: .16rem; font-weight: bold; position: absolute; top: 0; left: 21%;" value="${shopProduct.cartCount }" />
						<div class="inner-plus augment">+</div>

						<input id="repertory" type="hidden" value="${shopProduct.number }">

					</div>
					<div class="center-span">
						<span></span>
					</div>
				</div>
				<div class="item-bottom">
					<div class="bottom-span">
						<span>小计：</span>
					</div>
					<div class="bottom-right">
						<span class="price subtotal">${shopProduct.subtotal}</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="fa fa-trash-o fa-1x right-delete del" href="javascript:void(0)"></a>
						<input class="cartId" type="hidden" value="${shopProduct.cartId }">
					</div>
				</div>
			</div>


		</c:forEach>
	</section>

	<section style="width: 100%; height: .5rem;"></section>
	<footer class="shopcar-footer">
		<div class="footer-left">
			<a id="cleanShopCar" class="fa fa-trash-o fa-1x" href="javascript:void(0)"></a>
			<span>清空</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="left-price" >总价：￥ <span id="totalPrices">${totalPrices }</span></span>
		</div>
		<div class="footer-right">
			<a href="/page/${sessionScope.sysUserId}/toOrderList">结算</a>
		</div>
	</footer>

	<script src="${ctx }/static/js/resize.js"></script>
	<script src="${ctx }/static/vendor/layer/layer.js"></script>
	<script>
		$(function() {
			//点击'+'数量加一
			$('.augment')
					.click(
							function() {
								var initial = Number($(this).prev().val());
								var inventory = $(this).next().val();
								var totalPrices = Number($('#totalPrices').html());
								var cartId =$(this).parent().parent().next().find('.cartId').val();

								if (initial < inventory) {
									var ultimately = (initial + 1);

									$(this).prev().val(ultimately);
									var univalence = Number($(this).prev().prev().val());

									var subtotal = univalence * ultimately;
									$.post('${ctx}/shopcar/updateShopCart', {'id' : cartId,'count':ultimately},function(){

									});

									$(this).parent().parent().next().find(
									".subtotal").html(subtotal);
								$('#totalPrices').html(totalPrices+univalence);

								} else {
									$(this).parent().next().html('库存不足');
								}
							})

			//点击'-'数量减一
			$('.subtract').click(
					function() {
						var initial = Number($(this).next().next().val());
						var totalPrices = Number($('#totalPrices').html());
						var cartId =$(this).parent().parent().next().find('.cartId').val();
						if (initial > 0) {
							var ultimately = (initial - 1);
							$(this).next().next().val(ultimately);

							var univalence = Number($(this).next().val());
							var subtotal = univalence * ultimately;
							$(this).parent().parent().next().find(".subtotal")
									.html(subtotal);
							$.post('${ctx}/shopcar/updateShopCart', {'id' : cartId,'count':ultimately},function(){

							});
							$('#totalPrices').html(totalPrices-univalence);
							$(this).parent().next().html('');
						}
					});

			//输入框中输入购买数量
			$('.quantity').blur(
					function() {
						var values = Number($(this).parent().prev().val());

						var value = Number($(this).val());

						var num = Number($(this).prev().val());
						var nums = value * num;
						//alert(nums);
						if (value > 0 && value <= values) {
                            $(this).parent().parent().next().find(".subtotal").html(nums);
							$(this).parent().next().html('');
						} else {
							$(this).parent().next().html('库存不足');
						}
					});

			//点击'删除'删除当前商品
			$('.del').click(function() {
				var $this = $(this)
				var cartId = $(this).next().val();
				$.post('${ctx}/shopcar/deleteShopCart', {
					'cartId' : cartId
				}, function(row) {
					if (row > 0) {
						$this.parents('.ssm').remove();
					}
				});
			});

			//点击'清空'删除所有商品
			$('#cleanShopCar').click(function() {
				layer.confirm('确认清空购物车？', {
					btn : ['确认','取消']
				}, function() {
					$.post("/shopcar/prugeShopCart",function(msg){
						if(msg=="success"){
							$("#shopCar").html('<div class="container-inner" style="display: block;">'+
									'<div class="inner-car">'+
									'<img src="${ctx }/static/img/cart_pic.png" />'+
								'</div>'+
								'<p>您还没有宝贝，赶快去逛逛吧!</p>'+
								'<div class="inner-now">'+
									'<a href="">马上去逛逛</a>'+
								'</div>'+
							'</div>');
							$('#totalPrices').html('￥ 0');
						}
					})
				});
			});

		});
	</script>

</body>
</html>
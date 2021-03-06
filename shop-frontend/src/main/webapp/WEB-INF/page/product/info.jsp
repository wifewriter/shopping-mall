<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <!-- 禁用电话号码检测功能，禁止对数字随便可以拨号 -->
    <meta name="format-detection" content="telephone=no">
    <!-- 禁用地址检测功能，禁止跳转到地图 -->
    <meta name="format-detection" content="address=no">
    <!-- 在苹果设备上以全屏方式打开本网页 -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!-- 设置在苹果设备上状态的颜色，默认白色，要设置成什么颜色以Web颜色的风格而定 -->
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <title>微信商城-产品详细</title>
    <%@include file="../../../static/import.jsp" %>
    <link rel="stylesheet" href="${ctx}/static/vendor/layer.css">
    <script src="/static/vendor/layer/layer.js"></script>
    <!-- 苹果设备在桌面上生成的快捷图标 -->
    <link rel="apple-touch-icon" href="${ctx}/static/img/apple-touch-icon.png">
    <link rel="icon" href="${ctx}/static/img/favicon.ico">
</head>

<body>
<%@include file="../../../static/nav.jsp" %>
<section style="width: 100%; height: .6rem;"></section>
<section class="info-wrapper">
    <div class="content">
        <div class="content-top">
            <div class="top-left">
                <img id="picUrl" src="/static/img/product1.png"/>
            </div>
            <div class="top-right">
                <p id="name" class="title"></p>
                <p id="introduction" class="details"></p>
                <p class="price">价格:<span id="price"></span></p>
                <p class="number">库存:<span id="number"></span></p>
            </div>
        </div>

        <div class="content-bottom">
            <div class="bottom-text">
                <span>购买数量:</span>
            </div>
            <div class="bottom-inner">
                <div id="buyCountSub" class="inner-Reduction">
							-
						</div>
                <input id="buyCount" class="input" type="text"
                       style="width: 1.2rem;height: .3rem;border: none;text-align: center;color: #990000;font-size: .16rem;font-weight: bold;position: absolute;top: 0;left: 21%;"
                       value="1"/>
                <div id="buyCountPlu" class="inner-plus">
							+
						</div>
            </div>
            <span id="buyCountMsg" class="center-span"></span>
        </div>
    </div>

    <div class="container">
        <p class="container-title">详细说明</p>
        <p id="description" class="container-details">
        <div class="container-img">
            <img src="/static/img/product1.png" style="width: 9rem;max-height: 7.5rem;"/>
        </div>

    </div>

    <div style="width: 100%; height: .5rem;"></div>
    <div class="plus-shopcar">
        <%--<a id="plusShopcar" data-placement="top" tabindex="0" class="btn btn-lg " role="button" data-toggle="popover"--%>
        <%--data-trigger="focus" title="Dismissible popover"--%>
        <%--data-content="And here's some amazing content. It's very engaging.?">加入购物车</a>--%>

        <a id="plusShopcar" href="javascript:void(0)">加入购物车</a>
    </div>
</section>
<script src="${ctx}/static/js/resize.js"></script>
<script>

    $(function () {
        $("[data-toggle='popover']").popover();
    });

    var $buyCountMsg = $("#buyCountMsg");
    var productId = "";

    /**
     *加入商品到购物车
     */
    $('#plusShopcar').click(function () {
        var buyCount = $('#buyCount').val();
        var number = $("#number").html();// 库存
        if (number == 0) {
            layer.msg("很抱歉，该宝贝已经卖光了")
        } else {
            $.post("/ShopCar/addToShopCar", {'shopProductId': productId, 'count': buyCount}, function (msg) {
                if (msg == "success") {
                    layer.msg('添加成功');
                } else if (msg == "userNoLogin") {
                    layer.msg('请先登录');
                }
            });
        }
    });

    /**
     * 获取商品信息
     */
    function getInfo() {
        $.ajax(
            {
                url: "/product/info",
                type: "post",
                data: {
                    "productId": "${productId}"
                },
                dataType: "json",
                success: function (info) {
                    addInfo(info);
                }
            }
        );
    }

    /**
     * 添加数据
     * @param info
     */
    function addInfo(info) {
        $("#picUrl").attr("src", info.picUrl);
        $("#name").html(info.name);
        $("#introduction").html(info.introduction);
        $("#price").html(info.price);
        $("#number").html(info.number);
        $("#description").html(info.description);
        productId = info.id;
    }

    $("#buyCountSub").click(function () {
        var buyCount = parseInt($("#buyCount").val());
        if (buyCount > 0) {
            cleanBuyCountMsg();
            $("#buyCount").val(buyCount - 1);
        } else {
            $buyCountMsg.html("你已经没有购买商品了~~~")
        }
    });

    $("#buyCountPlu").click(function () {
        var buyCount = parseInt($("#buyCount").val());
        var number = $("#number").html();// 库存
        if (buyCount < number) {
            cleanBuyCountMsg();
            $("#buyCount").val(buyCount + 1);
        } else {
            $buyCountMsg.html("土豪！你已经把东西买光了~~~")
        }
    });

    function cleanBuyCountMsg() {
        $buyCountMsg.html("");
    }

    getInfo();
</script>
</body>

</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
    <link rel="stylesheet" type="text/css" href="${ctx}/static/vendor/normalize.min.css"/>
    <!-- 可选 -->
    <link rel="stylesheet" href="${ctx}/static/vendor/font-awesome/css/font-awesome.min.css"/>
    <!-- 可选 -->
    <link rel="stylesheet" href="${ctx}/static/css/common.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/info.css"/>
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
            <span id="buyCountMsg"></span>
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
        <a href="">加入购物车</a>
    </div>
</section>

<script src="${ctx}/static/js/resize.js"></script>
<script>

    var $buyCountMsg = $("#buyCountMsg");

    /**
     * 获取取数据
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
        var number = $("#number").html();
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
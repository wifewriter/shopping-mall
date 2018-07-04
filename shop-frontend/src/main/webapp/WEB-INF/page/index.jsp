<%--
  Created by IntelliJ IDEA.
  User: 8poko
  Date: 2018/7/3
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>微信商城-首页</title>
    <%@include file="../../static/import.jsp" %>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/vendor/normalize.min.css"/>
    <!-- 可选 -->
    <link rel="stylesheet" href="${ctx}/static/vendor/font-awesome/css/font-awesome.min.css"/>
    <!-- 可选 -->
    <link rel="stylesheet" href="${ctx}/static/vendor/swiper/swiper.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/common.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/index.css"/>
    <!-- 苹果设备在桌面上生成的快捷图标 -->
    <link rel="apple-touch-icon" href="${ctx}/static/img/apple-touch-icon.png">
    <link rel="icon" href="${ctx}/static/img/favicon.ico">
</head>

<body>
<%@include file="../../static/nav.jsp" %>
<section class="index-banner swiper-container">
    <div class="swiper-wrapper">
        <c:forEach items="${pageInfo.list}" var="prod">
            <div class="swiper-slide">
                <img src="${prod.picUrl}"/>
                <div class="slide-layer">
                    <div class="layer-inner">
                        <p>微信价<span>${prod.price}</span></p>
                        <p>微信商城</p>
                        <div class="inner-right">
                            <a href="info.html">立即购买</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>

<section class="index-main">
    <div id="index-main"></div>


    <c:forEach items="${pageInfo.list}" var="prod">
        <a href="info.html">
            <div class="main-list">
                <img src="${prod.picUrl}"/>
                <div class="list-right">
                    <p class="title">${prod.name}</p>
                    <p class="details">${prod.introduction}</p>
                    <p class="price">价格:<span>${prod.price}</span></p>
                </div>
            </div>
        </a>
    </c:forEach>
</section>

<script src="${ctx}/static/js/resize.js"></script>
<script src="${ctx}/static/vendor/zepto.min.js"></script>
<script src="${ctx}/static/vendor/swiper/swiper-3.4.0.jquery.min.js"></script>
<script src="${ctx}/static/vendor/swiper/swiper.animate1.0.2.min.js"></script>
<script>

    var pageNo = 0;
    var pageSize = 5;

    $(function () {
            var mySwiper = new Swiper('.swiper-container', {
                loop: true,
                autoplay: 5000,
            });
        }
    );


    function addIndexMain(products) {
        var html = [];
        for (var i = 0; i < products.length; i++) {
            html.push("<div class=\"main-list\">");
            switch (products[i].flag) {
                case 1:
                    html.push("<div class=\"trangle-hot\">");
                    html.push("<div class=\"trangle-text\">");
                    html.push("<span>热销</span>");
                    html.push("</div>");
                    html.push("</div>");
                    break;
                case 2:
                    html.push("<div class=\"trangle-exclusive\">");
                    html.push("<div class=\"trangle-text\">");
                    html.push("<span>专属</span>");
                    html.push("</div>");
                    html.push("</div>");
                    break;
                default:
                    break;
            }

            html.push("<img src=\"" + products[i].picUrl + "\"/>");
            html.push("<div class=\"list-right\">");
            html.push("<p class=\"title\">" + products[i].name + "</p>");
            html.push("<p class=\"details\">" + products[i].introduction + "</p>");
            html.push("<p class=\"price\">价格:<span>" + products[i].price + "</span></p>");
            html.push("</div>");
            html.push("</div>");
            html.push("</a>");
        }
        console.info($('#index-main'));
        $('#index-main').html(html);
    }

    function ajaxMainPage() {
        $.ajax(
            {
                url: "${ctx}/page/mainPage",
                type: "post",
                dateType: "json",
                date: {
                    "pageNo": pageNo + 1,
                    "pageSize": pageSize
                },
                success: function (result) {
                    var products = result.list;
                    addIndexMain(products);
                }
            });
    }

    ajaxMainPage();

</script>
</body>


</html>

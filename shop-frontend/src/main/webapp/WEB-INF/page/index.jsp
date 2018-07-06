<!DOCTYPE html>
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
<div id="recommendProducts"></div>
<div class="loadding" id="loadding">
    <span><i class="fa fa-spinner fa-pulse"></i> 正在加载数据...</span>
</div>
<script src="../../static/js/resize.js"></script>
<script src="../../static/vendor/zepto.min.js"></script>
<script src="../../static/vendor/swiper/swiper-3.4.0.jquery.min.js"></script>
<script src="../../static/vendor/swiper/swiper.animate1.0.2.min.js"></script>
<script>
    window.onload = function () {
        getRecommendProducts();
        ajaxMainPage();
    };

    var pageNo = 0;
    var pageSize = 5;
    var toMainPageFlag = true;

    /**
     * 滚动加载
     */
    $(window).scroll(function () {
        var documentHigh = $(document).height();
        var scrollTop = $(document).scrollTop();
        var windowHigh = $(window).height();
        if (documentHigh - (scrollTop + windowHigh) <= 50) {
            if (toMainPageFlag) {
                ajaxMainPage();
            }
        }
    });

    /**
     * 列表添加数据
     *
     * @param products 需要添加的产品信息
     */
    function addIndexMain(products) {
        var html = [];
        html.push("<section class=\"index-main\">")
        for (var i = 0; i < products.length; i++) {
            html.push("<a href=\"info/" + products[i].id + "\">")
            html.push("<div class=\"main-list\">");
            html.push("<img src=\"" + products[i].picUrl + "\"/>");
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
            html.push("<div class=\"list-right\">");
            html.push("<p class=\"title\">" + products[i].name + "</p>");
            html.push("<p class=\"details\">" + products[i].introduction + "</p>");
            html.push("<p class=\"price\">价格:<span>" + products[i].price + "</span></p>");
            html.push("</div>");
            html.push("</div>");
            html.push("</a>");
        }
        html.push("</section>");
        $('#loadding').before(html.join(""));
    }

    /**
     * 发送ajax请求产品数据
     */
    function ajaxMainPage() {
        // 取消异步，处理完一个请求后才再次请求
        $.ajaxSetup({
            async: false
        });
        $.ajax(
            {
                url: "${ctx}/product/products",
                type: "post",
                dataType: "json",
                data: {
                    "pageNo": pageNo = pageNo + 1,
                    "pageSize": pageSize
                },
                success: function (result) {
                    var products = result.list;
                    addIndexMain(products);
                    // 判断加载到末尾
                    if (products.length < pageSize) {
                        $('#loadding').html('已全部加载完成~');
                        toMainPageFlag = false;
                    } else {
                        toMainPageFlag = true;
                    }
                }
            });
    }

    /**
     * 获取推荐商品
     */
    function getRecommendProducts() {
        $.ajax({
            url: "${ctx}/product/recommendProducts",
            dateType: "json",
            success: function (data) {
                addrecommendProducts(data);
            }
        })
    }

    /**
     * 添加推荐商品到页面
     *
     * @param recommendProducts
     */
    function addrecommendProducts(recommendProducts) {
        var html = ["<section class=\"index-banner swiper-container\">"];
        html.push("<div class=\"swiper-wrapper\">");
        for (var i = 0; i < recommendProducts.length; i++) {
            html.push("<div class=\"swiper-slide\">");
            html.push("<img src=\"" + recommendProducts[i].picUrl + "\"/>");
            html.push("<div class=\"slide-layer\">");
            html.push("<div class=\"layer-inner\">");
            html.push("<p>微信价<span>" + recommendProducts[i].price + "</span></p>");
            html.push("<p>微信商城</p>");
            html.push("<div class=\"inner-right\">");
            html.push("<a href=\"info/" + recommendProducts[i].id + "\">立即购买</a>");
            html.push("</div>");
            html.push("</div>");
            html.push("</div>");
            html.push("</div>");
        }
        html.push("</div>");
        html.push("</section>");
        $("#recommendProducts").replaceWith(html.join(''));

        var mySwiper = new Swiper('.swiper-container', {
            loop: true,
            autoplay: 5000,
        });
    }

    /**
     *  动态加载 js/css
     */
    function loadjscssfile(filename, filetype) {
        if (filetype == "js") { //判定文件类型
            var fileref = document.createElement('script')//创建标签
            fileref.setAttribute("type", "text/javascript")//定义属性type的值为text/javascript
            fileref.setAttribute("src", filename)//文件的地址
        }
        else if (filetype == "css") { //判定文件类型
            var fileref = document.createElement("link")
            fileref.setAttribute("rel", "stylesheet")
            fileref.setAttribute("type", "text/css")
            fileref.setAttribute("href", filename)
        }
        if (typeof fileref != "undefined")
            document.getElementsByTagName("head")[0].appendChild(fileref)
    }
</script>
</body>

</html>
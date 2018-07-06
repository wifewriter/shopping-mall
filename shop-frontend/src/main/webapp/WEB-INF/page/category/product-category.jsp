<%--
  Created by IntelliJ IDEA.
  User: 8poko
  Date: 2018/7/5
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品分类</title>
    <%@include file="../../../static/import.jsp" %>
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
<%@include file="../../../static/nav.jsp"%>
<div style="height: 80px;"></div>
<div class="container-fluid">
    <div id="categoryMenu" class="col-lg-3"></div>
    <div id="rightBox" class="col-lg-9">
        <div class="loadding" id="loadding">
            <span><i class="fa fa-spinner fa-pulse"></i> 正在加载数据...</span>
        </div>
    </div>
</div>
<script src="../../static/js/resize.js"></script>
<script src="../../static/vendor/zepto.min.js"></script>
<script src="../../static/vendor/swiper/swiper-3.4.0.jquery.min.js"></script>
<script src="../../static/vendor/swiper/swiper.animate1.0.2.min.js"></script>
<script src="${ctx}/static/vendor/template.js"></script>

<script id="leftMenu" type="text/html">
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        {{each menus}}
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="heading{{$value.mainMenu}}">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse{{$value.mainMenu}}"
                       aria-expanded="true" aria-controls="collapse{{$value.mainMenu}}">
                        {{$value.mainMenu}}
                    </a>
                </h4>
            </div>
            <div id="collapse{{$value.mainMenu}}" class="panel-collapse collapse" role="tabpanel"
                 aria-labelledby="heading{{$value.mainMenu}}">
                <div class="panel-body">
                    <ul class="list-group">
                        {{each $value.subMenus}}
                        <li class="list-group-item">
                            <a class="leftSubMenu" href="javascript:void(0)" value="{{$value.categoryId}}">{{$value.categoryName}}</a>
                        </li>
                        {{/each}}
                    </ul>
                </div>
            </div>
        </div>
        {{/each}}
    </div>
</script>
<script>
    var pageNo = 0;
    var pageSize = 5;
    var toMainPageFlag = true;
    var categoryId = {};

    /**
     * 初始化页面
     */
    $(function () {
        getCategory();
        var hotSell = '1';
        getProducts("/product/products", {
            "pageNo": pageNo = 1,
            "pageSize": pageSize,
            "flag" : hotSell
        });
    });

    /**
     * 滚动加载事件，发送ajax请求products数据
     */
    $(window).scroll(function () {
        var documentHigh = $(document).height();
        var scrollTop = $(document).scrollTop();
        var windowHigh = $(window).height();
        if (documentHigh - (scrollTop + windowHigh) <= 50) {
            if (toMainPageFlag) {
                getProducts("/product/products", {
                    "pageNo": pageNo = pageNo + 1,
                    "pageSize": pageSize,
                    "categoryId": categoryId
                });
            }
        }
    });

    /**
     * 添加元素到左侧菜单
     *
     * @param categorys
     */
    function addMenu(categorys) {
        var menus = [];
        $.each(categorys, function (key, values) {
            var subMenus = [];
            $.each(values, function () {
                var params = {
                    'categoryId': this.id,
                    'categoryName': this.categoryName
                };
                subMenus.push(params)
            });
            var obj = {'mainMenu': key, 'subMenus': subMenus};
            menus.push(obj);
        });
        var data = {
            menus: menus
        };
        var html = template("leftMenu", data);
        $("#categoryMenu").html(html);
    }

    /**
     * 添加数据展示
     *
     * @param products list类型的参数为需要展示的数据
     */
    function addRightBox(products) {
        var html = [];
        html.push("<section class=\"index-main\">")
        if (products.length <= 0) {
            // 写入数据
            html.push('<li class="list clearfix" style="justify-content:center;">');
            html.push('数据为空~');
            html.push('</li>');
        }
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
        if (products.length < pageSize) {
            $('#loadding').html('已全部加载完成~');
            toMainPageFlag = false;
        } else {
            toMainPageFlag = true;
        }
    }

    /**
     *  获取产品
     */
    function getProducts(url, data) {
        // 取消异步
        $.ajaxSetup({
            async: false
        });
        $.ajax({
            url: url,
            type: "post",
            data: data,
            dataType: "json",
            success: function (pageInfo) {
                var products = pageInfo.list;
                addRightBox(products);
            }
        })
    }

    /**
     * 为二级菜单添加点击事件
     */
    function addEvent() {
        $(".leftSubMenu").click(function () {
            //清空右侧展示
            $('#rightBox').html(' <div class="loadding" id="loadding">\n' +
                '            <span>已全部加载完成~ </span>\n' +
                '        </div>');
            // 初始化条件
            pageNo = 0;
            var categoryId = $(this).attr("value");
            categoryId = categoryId,
                $.post("/product/products", {
                    "pageNo": pageNo = pageNo + 1,
                    "pageSize": pageSize,
                    "categoryId": categoryId
                }, function (data) {
                    var products = data.list;
                    addRightBox(products);
                }, 'json');
        });
    }

    /**
     * 获取分类
     */
    function getCategory() {
        $.ajax({
            url: "/category/getCategorys",
            dataType: "json",
            success: function (categorys) {
                addMenu(categorys);
                addEvent();
            }
        });
    }
</script>
</body>
</html>

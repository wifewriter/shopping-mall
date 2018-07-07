<%--
  Created by IntelliJ IDEA.
  User: 8poko
  Date: 2018/7/7
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>微信商城-结算</title>
    <%@include file="../../../static/import.jsp" %>
    <link rel="stylesheet" type="text/css" href="/static/vendor/normalize.min.css"/>
    <!-- 可选 -->
    <link rel="stylesheet" href="${ctx}/static/vendor/font-awesome/css/font-awesome.min.css"/>
    <!-- 可选 -->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/vendor/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/vendor/swiper/swiper.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/common.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/orderlist.css"/>
    <!-- 苹果设备在桌面上生成的快捷图标 -->
    <link rel="apple-touch-icon" href="${ctx}/static/img/apple-touch-icon.png">
    <link rel="icon" href="${ctx}/static/img/favicon.ico">
</head>
<body>
<%@include file="../../../static/nav.jsp" %>
<div style="height: 80px;"></div>
<section class="orderlist-main">
    <div class="main-goods">
        <h3>收货人地址</h3>
        <div class="goods-form">
            <form id="shopReceiveAddressesFrom" action="javascript:void(0)">
                <div class="form-solid"></div>
                <input type="radio" value="address3" name="address" id="new-address"
                       style="cursor: pointer;"/>&nbsp;<label for="new-address" class="form-label">使用新的收货地址</label>
                <div class="form-new-address">
                    <div class="address-inner">
                        <span>收货人姓名:</span><br/>
                        <input type="text" class="input"/>
                        <span>所在地区：</span><br/>
                        <select name="privence" style="width: 1.3rem;height: .4rem;">
                            <option value="">--请选择所在省市--</option>
                            <option value="">北京市</option>
                            <option value="">上海市</option>
                            <option value="">重庆市</option>
                        </select>&nbsp;&nbsp;
                        <select name="city" style="width: 1.3rem;height: .4rem;">
                            <option value="privence">--请选择所在城市--</option>
                            <option value="">长沙</option>
                            <option value="">武汉</option>
                            <option value="">昆明</option>
                        </select>&nbsp;&nbsp;
                        <select name="area" style="width: 1.3rem;height: .4rem;">
                            <option value="privence">--请选择所在地区--</option>
                            <option value="">沙坪坝区</option>
                            <option value="">呈贡区</option>
                            <option value="">五华区</option>
                        </select><br/>
                        <span>详细地址:</span><br/>
                        <input type="text" class="input"/><br/>
                        <span>手机号码:</span><br/>
                        <input type="text" class="input"/><br/>
                        <input type="checkbox" id="address" checked="checked"/>&nbsp;<label for="address" class="text">自动保存收货地址（选择后该地址将会保存到你的收货地址列表）</label>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="main-goods">
        <h3>发票信息</h3>
        <div class="goods-form">
            <form action="">
                <input type="checkbox" id="invoice"/>&nbsp;<label for="invoice" class="text1">是否开发票</label>
                <div class="form-invoice">
                    <div class="invoice-inner">
                        <span>发票抬头：</span><br/>
                        <select name="" class="inner-title">
                            <option value="">个人</option>
                            <option value="">单位</option>
                        </select>
                        <input type="text"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="main-goods-list">
        <h3>商品清单</h3>
        <div id="goodListTable"></div>
    </div>

    <div class="main-message">
        <h3>给卖家留言</h3>
        <input type="text" id="messageInput"/>
    </div>
</section>

<section style="width: 100%;height: .5rem;"></section>
<footer class="orderlist-footer">
    <div class="footer-left">
        <span class="left-price">总价： <span>￥79743</span></span>
    </div>
    <div class="footer-right">
        <a href="">提交订单</a>
    </div>
</footer>

<script src="${ctx}/static/js/resize.js"></script>
<script src="${ctx}/static/vendor/jquery.min.js"></script>
<script src="/static/vendor/template.js"></script>

<script id="goodList" type="text/html">
    <table class="table table-bordered">
        <tr>
            <th>商品名称</th>
            <th>数量</th>
            <th>小计</th>
        </tr>
        {{each goodList }}
        <tr>
            <td>{{$value.name}}</td>
            <td>{{$value.cartCount}}</td>
            <td>{{$value.cartCount*$value.price}}</td>
        </tr>
        {{/each}}
    </table>
</script>

<script id="shopReceiveAddresses" type="text/html">
    {{each shopReceiveAddresses as v i}}
    <input type="radio" value="address{{i}}" name="address" id="address{{i}}" class="address"
           style="cursor: pointer;" {{if v.isDefault== 1}}checked{{/if}}/>&nbsp;
    <label for="address{{i}}" class="form-label">{{v.province}} {{v.city}} {{v.area}} {{ v.address}}</label>
    <p><span>姓名：</span>{{v.receiver}} &nbsp;&nbsp;<span>手机号码:</span>{{v.phone}}</p>
    {{/each}}
</script>

<script>

    function


    // 添加地址列表
    function createAddressList() {
        $.post('/shopReceiveAddress/getShopReceiveAddressByUserId', {'userId': "${sessionScope.sysUserId}"}, function (shopReceiveAddresses) {
            var data = {
                "shopReceiveAddresses": shopReceiveAddresses
            };
            var html = template("shopReceiveAddresses", data);
            console.info(html);
            $('#shopReceiveAddressesFrom').prepend(html);
        });
    }

    /**
     *添加goodList
     */
    function createGoodsList() {
        $.post("/order/getShopProductsByUserId", {'userId': "${sessionScope.sysUserId}"}, function (ShopProducts) {
            var data = {
                "goodList": ShopProducts
            };
            var html = template("goodList", data);
            $('#goodListTable').append(html);
        });
    }


    $(function () {
        $('#new-address').click(function () {
            if (this.checked) {
                $('.form-new-address').show();
            } else {
                $('.form-new-address').hidden();
            }
        });

        $('#invoice').click(function () {
            if (this.checked) {
                $('.form-invoice').show();
            } else {
                $('.form-invoice').hidden();
            }
        });

        createGoodsList();
        createAddressList();
    });
</script>
</body>
</html>

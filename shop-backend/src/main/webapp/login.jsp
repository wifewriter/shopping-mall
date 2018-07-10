<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>西西弗微商城后台-登录</title>
    <%@ include file="/WEB-INF/view/common/import.jsp" %>
    <link href="${ctx }/static/vendor/uimaker/pages/css/base.css" rel="stylesheet"/>
    <link href="${ctx }/static/vendor/uimaker/pages/css/login/login.css" rel="stylesheet"/>
</head>
<body class="white">
<div class="login-hd">
    <div class="left-bg"></div>
    <div class="right-bg"></div>
    <div class="hd-inner">
        <span class="logo"></span>
        <span class="split"></span>
        <span class="sys-name">西西弗微商城后台</span>
    </div>
</div>
<div class="login-bd">
    <div class="bd-inner">
        <div class="inner-wrap">
            <div class="lg-zone">
                <div class="lg-box">
                    <div class="lg-label"><h4>用户登录</h4></div>
                    <div class="alert alert-error">
                        <i class="iconfont">&#xe62e;</i>
                        <span>请输入用户名</span>
                    </div>
                    <form>
                        <div class="lg-username input-item clearfix">
                            <i class="iconfont">&#xe60d;</i>
                            <input type="text" placeholder="账号/邮箱" name="email" autocomplete="off">
                        </div>
                        <div class="lg-password input-item clearfix">
                            <i class="iconfont">&#xe634;</i>
                            <input type="password" placeholder="请输入密码" name="password">
                        </div>
                        <div class="lg-check clearfix">
                            <div class="input-item">
                                <i class="iconfont">&#xe633;</i>
                                <input type="text" placeholder="验证码">
                            </div>
                            <span class="check-code"><img src="${ctx }/kaptcha.jpg"/></span>
                        </div>
                        <div class="tips clearfix">
                            <label><input type="checkbox" checked="checked">记住用户名</label>
                            <a href="javascript:;" class="register">立即注册</a>
                            <a href="javascript:;" class="forget-pwd">忘记密码？</a>
                        </div>
                        <div class="enter">
                            <a href="javascript" class="purchaser">商家登录</a>
                            <a href="javascript:;" class="supplier" >管理员登录</a>
                        </div>
                    </form>
                    <div class="line line-y"></div>
                    <div class="line line-g"></div>
                </div>
            </div>
            <div class="lg-poster"></div>
        </div>
    </div>
</div>
<div class="login-ft">
    <div class="ft-inner">
        <div class="about-us">
            <a href="javascript:;">关于我们</a>
            <a href="javascript:;">法律声明</a>
            <a href="javascript:;">服务条款</a>
            <a href="javascript:;">联系方式</a>
        </div>
        <div class="address">地址：江苏省南京市雨花台区软件园&nbsp;邮编：210019&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2015&nbsp;-&nbsp;2016&nbsp;uimaker-专注于ui设计&nbsp;版权所有</div>
        <div class="other-info">建议使用IE8及以上版本浏览器&nbsp;苏ICP备&nbsp;09003078号&nbsp;E-mail：admin@uimaker.com</div>
    </div>
</div>

<script>

</script>
</body>
</html>
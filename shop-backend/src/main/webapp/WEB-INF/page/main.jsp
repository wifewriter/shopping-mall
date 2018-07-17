<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>西西弗微商城后台-主页</title>
    <%@ include file="/static/common/import.jsp" %>
    <link href="${ctx }/static/vendor/uimaker/pages/css/base.css" rel="stylesheet"/>
    <link href="${ctx }/static/vendor/uimaker/pages/css/platform.css" rel="stylesheet">
    <style>
        #pf-bd #pf-page .panel-body {
            overflow: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <div id="pf-hd">
        <div class="pf-logo">
            <img src="${ctx }/static/vendor/uimaker/pages/images/main/main_logo.png" alt="logo">
        </div>

        <div class="pf-nav-wrap">
            <div class="pf-nav-ww">
                <ul class="pf-nav">
                    <li class="pf-nav-item home current" data-menu="sys-manage">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe63f;</span>
                            <span class="pf-nav-title">系统管理</span>
                        </a>
                    </li>
                    <li class="pf-nav-item project" data-menu="org-manage">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe60d;</span>
                            <span class="pf-nav-title">组织管理</span>
                        </a>
                    </li>
                    <li class="pf-nav-item static" data-menu="main-data">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe61e;</span>
                            <span class="pf-nav-title">主数据</span>
                        </a>
                    </li>
                    <li class="pf-nav-item manger" data-menu="supplier-mange">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe620;</span>
                            <span class="pf-nav-title">供应商管理</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="supplier-dev">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe625;</span>
                            <span class="pf-nav-title">供应商开发</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="pur-source">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe64b;</span>
                            <span class="pf-nav-title">采购寻源</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="contract-mange">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe64c;</span>
                            <span class="pf-nav-title">合同管理</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="pf-user">
            <div class="pf-user-photo">
                <img src="${ctx }/static/vendor/uimaker/pages/images/main/user.png" alt="">
            </div>
            <h4 class="pf-user-name ellipsis">${sessionScope.username}</h4>
            <i class="iconfont xiala">&#xe607;</i>

            <div class="pf-user-panel">
                <ul class="pf-user-opt">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe60d;</i>
                            <span class="pf-opt-name">用户信息</span>
                        </a>
                    </li>
                    <li class="pf-modify-pwd">
                        <a href="http://www..com">
                            <i class="iconfont">&#xe634;</i>
                            <span class="pf-opt-name">修改密码</span>
                        </a>
                    </li>
                    <li class="pf-logout">
                        <a href="/user/logout">
                            <i class="iconfont">&#xe60e;</i>
                            <span class="pf-opt-name">退出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div id="pf-bd">
        <div id="pf-sider">
            <h2 class="pf-model-name">
                <span class="iconfont">&#xe64a;</span>
                <span class="pf-name">功能菜单</span>
                <span class="toggle-icon"></span>
            </h2>
            <ul id="leftNav"></ul>
        </div>

        <div id="pf-page">
            <div title="首页" style="padding:10px;" data-options="
			    iconCls:'icon-tip'">
				  Welcome...
			   </div>
        </div>
    </div>

    <div id="rightTabMenu" class="easyui-menu">
        <div data-options="
		    name:'refresh'">
		    	刷新
		    </div>
        <div data-options="
		    name:'closeCurrent'">
		    	关闭当前
		    </div>
        <div data-options="
		    	name:'closeOther'">
		    	关闭其它
		    </div>
        <div data-options="
		    name:'closeAll'">
		    	关闭全部
		    </div>
    </div>

    <div id="pf-ft">
        <div class="system-name">
            <i class="iconfont">&#xe6fe;</i>
            <span>信息管理系统&nbsp;v1.0</span>
        </div>
        <div class="copyright-name">
            <span>CopyRight&nbsp;2016&nbsp;&nbsp;uimaker.com&nbsp;版权所有</span>
            <i class="iconfont">&#xe6ff;</i>
        </div>
    </div>
</div>

<script>
    var main = {
        init: function () {
            main.nav = $('#leftNav');
            main.tabs = $('#pf-page');
            main.tabMenu = $('#rightTabMenu');

            // 左侧菜单收起
            $(document).on('click', '.toggle-icon', function () {
                $(this).closest("#pf-bd").toggleClass("toggle");
                setTimeout(function () {
                    $(window).resize();
                }, 300)
            });

            // 请求tree数据
            main.nav.tree({
                url: '/menu/mainMenu',
                lines: false,
                onLoadSuccess: function (node, data) {
                    var that = this;
                    $(that).tree('expandAll');
                },
                onClick: function (node) {
                    if (node.url) {
                        if (main.tabs.tabs('exists', node.text)) {
                            main.tabs.tabs('select', node.text)
                        } else {
                            main.tabs.tabs('add', {
                                title: node.text,
                                iconCls: node.iconCls,
                                closable: true,
                                href: node.url
                            });
                        }
                    }
                }
            });

            // 初始化tab，并创建右键菜单
            main.tabs.tabs({
                border: false,
                fit: true,
                onContextMenu: function (e, title, index) {
                    e.preventDefault();
                    if (index > 0) {
                        main.tabMenu.menu('show', {
                            left: e.pageX,
                            top: e.pageY
                        }).data("tabTitle", title);
                    }
                }
            });

            // 右键菜单click
            main.tabMenu.menu({
                onClick: function (item) {
                    var allTabs = main.tabs.tabs('tabs');
                    var allTabtitle = [];
                    $.each(allTabs, function (i, v) {
                        var opt = $(v).panel('options');
                        if (opt.closable) {
                            allTabtitle.push(opt.title);
                        }
                    });
                    var curTabTitle = $(this).data("tabTitle");
                    var curTabIndex = main.tabs.tabs("getTabIndex", main.tabs.tabs("getTab", curTabTitle));
                    switch (item.name) {
                        case 'refresh':
                            var panel = main.tabs.tabs("getTab", curTabTitle).panel("refresh");
                            break;
                        case 'closeCurrent':
                            main.tabs.tabs("close", curTabIndex);
                            break;
                        case 'closeOther':
                            $.each(allTabtitle, function (i, v) {
                                if (curTabTitle != allTabtitle[i]) {
                                    main.tabs.tabs('close', allTabtitle[i]);
                                }
                            });
                            main.tabs.tabs('select', curTabTitle);
                            break;
                        case 'closeAll':
                            $.each(allTabtitle, function (i, v) {
                                main.tabs.tabs('close', allTabtitle[i]);
                            });
                            break;
                    }
                }
            });
        }
    };

    $(function () {
        main.init();
    });
</script>
</body>
</html>

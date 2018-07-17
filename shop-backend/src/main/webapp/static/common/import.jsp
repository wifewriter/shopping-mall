<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="<%=request.getContextPath() %>"></c:set>

<link href="${ctx }/static/vendor/uimaker/custom/uimaker/easyui.css" rel="stylesheet"/>
<link href="${ctx }/static/vendor/uimaker/custom/uimaker/icon.css" rel="stylesheet"/>
<script src="${ctx }/static/vendor/uimaker/custom/jquery.min.js"></script>
<script src="${ctx }/static/vendor/uimaker/custom/jquery.easyui.min.js"></script>
<script src="${ctx }/static/vendor/uimaker/custom/easyui-lang-zh_CN.js"></script>

<script>
    /**
     * 在window上自定义一个属性ctx
     */
    window.ctx = '${ctx}';

    /**
     * AJAX全局配置
     */
    $.ajaxSetup({
        dataType: 'json',
        cache: false,
        timeout: 15000,
        error: function () {
            alert('服务器内部错误~');
        }
    });

    /**
     * 自定义验证，继承$.fn.validatebox.defaults.rules，扩展新的验证类型
     */
    $.extend($.fn.validatebox.defaults.rules, {
        minLength: {
            validator: function (value, param) {
                return value.length >= param[0];
            },
            message: '请至少输入{0}个字符.'
        },
        mobile: {
            validator: function (value, param) {
                return /^(?:13\d|15\d|18\d)-?\d{5}(\d{3}|\*{3})$/.test(value);
            },
            message: '手机号码格式不正确'
        },
    });

    /**
     *  EasyUI提示
     */
    var EasyUI = {
        show: function (msg) {
            $.messager.show({
                title: '系统提示',
                msg: msg,
                timeout: 2000,
                showType: 'slide'
            });
        },
        confirm: function (msg, callback) {
            $.messager.confirm('系统提示', msg, callback);
        },
        progress: function () {
            $.messager.progress({
                text: '正在处理...'
            });
        },
        closeProgress: function (text) {
            $.messager.progress('close');
        },
        alertError: function (msg) {
            $.messager.alert('系统提示', msg, 'error')
        },
    }
</script>
<%--
  Created by IntelliJ IDEA.
  User: 8poko
  Date: 2018/7/5
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试用</title>
    <%@include file="static/import.jsp" %>
</head>
<body>
<a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus"
   title="Dismissible popover" data-content="And here's some amazing content. It's very engaging. Right?">可消失的弹出框</a>

<script>
    $(function () {
        $('[data-toggle="popover"]').popover()
    })
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 8poko
  Date: 2018/5/19
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
</head>
<body>
<p>index</p>
<%--location = '<%=request.getContextPath()%>/page/mainPage';--%>
<a href="<%=request.getContextPath()%>/page/toMainPage">toMainPage</a>
<a href="<%=request.getContextPath()%>/user/toLogin">toLogin</a>
<a href="<%=request.getContextPath()%>/user/toRegister">toRegister</a>
</body>
</html>

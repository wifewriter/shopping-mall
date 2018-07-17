<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="ctx" value="<%=request.getContextPath() %>"></c:set>

<link rel="stylesheet" href="<%=request.getContextPath() %>/static/vendor/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/vendor/normalize.min.css"/>
<!-- 可选 -->
<link rel="stylesheet" href="${ctx}/static/vendor/font-awesome/css/font-awesome.min.css"/>
<!-- 可选 -->
<link rel="stylesheet" href="${ctx}/static/css/common.css"/>
<link rel="stylesheet" href="${ctx}/static/css/info.css"/>
<script src="${ctx}/static/vendor/jquery.min.js"></script>
<script src="${ctx }/static/vendor/bootstrap.min.js"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<%@ include file="/WEB-INF/page/common/import.jsp"%>
</head>
<body>

<div class="container">
	<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
		  Launch demo modal
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">登录</h4>
		      </div>
		      <div class="modal-body">
		             <div class="container">
			<form class="form-horizontal" action="${ctx }/login?myuser=login" method="post">
			  <input type="hidden" name="count" id="count">
	
	<c:if test="${not empty param.msg }">		  
		<div class="alert alert-warning alert-dismissible fade in" role="alert">
	      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
		      <strong>
		     	<c:if test="${param.msg == 1 }">用户名或密码错误！</c:if> 
		     	<c:if test="${param.msg == 2 }">验证码错误！</c:if> 
		      </strong> 
	    </div>
    </c:if>
			  <div class="form-group">
			    <label for="email" class="col-sm-2 control-label">邮箱：</label>
			    <div class="col-sm-4">
			      <input type="text"  class="form-control " id="email" name="email"  placeholder="请输入登录邮箱帐号"  autofocus="autofocus" required="required" >
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="password" class="col-sm-2 control-label">密码：</label>
			    <div class="col-sm-4">
			      <input type="password" class="form-control" id="password" name="password" placeholder="请输入对应的密码"  required="required">
			    </div>
			  </div>
			  <div class="form-group" id="validateCodeGroup">
			    <label for="validateCode" class="col-sm-2 control-label">验证码：</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control validate-code" id="validateCode" name="validateCode" placeholder="请输入右侧的验证码" maxlength="4">
			      <img src="${ctx }/kaptcha.jpg" width="90" height="34" title="看不清？点击换一张" onclick="change(this)" style="cursor: pointer;" >
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-4">
			      <div class="checkbox">
			        <label>
			          <input type="checkbox" id="remember" name="remember" value="remember" > 记住帐号
			        </label>
			      </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-4">
			      <button type="submit" class="btn btn-primary btn-block" onclick="loginCheck()">
				     	登录
				  </button>
			    </div>
			  </div>
			</form>
	    </div>
	</div>
		    
	</div>
	 </div>
		</div>
</div>
		
		<script>
		
		/**
    	 * 验证码切换
    	 */
    	function change(o) {
    		// 由于浏览器对相同地址的请求有缓存，因此我们在这里添加了一个随机参数
    		o.src = '${ctx }/kaptcha.jpg?v=' + Math.random();
    	}
		
		</script>
		
</body>
</html>
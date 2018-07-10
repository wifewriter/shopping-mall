<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
	<%@ include file="/WEB-INF/page/common/import.jsp"%>


</head>
<body>
    <div class="container">
		<form class="form-horizontal" action="${ctx }/user/register" method="post" onsubmit="return validate()">
		  <div class="form-group">
		    <label for="email" class="col-sm-2 control-label">邮箱：</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱" onblur="validateUsername()" autocomplete="off">
		      <span id="emailMsg"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="password" class="col-sm-2 control-label">密码：</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="password" name="password" placeholder="请输出密码" >
		      <span id="passwordMsg"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="username" class="col-sm-2 control-label">姓名：</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="username" name="username" placeholder="请输入姓名">
		      <span id="usernameMsg"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-primary btn-block" id="submitBtn" >
			     	注册
			  </button>
			  <button type="button" class="btn btn-default btn-block" onclick="history.back()">
			     	返回
			  </button>
		    </div>
		  </div>
		</form>
    </div>
    <script>
    

    
    
    function validateUsername() {
		var $email = $('#email');
		var $emailMsg = $('#emailMsg');
		 var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if ($.trim($email.val()) == '') {
			$emailMsg.css('color', '#c33').html('邮箱不能为空!');
		} else if (!myreg.test($.trim($email.val()))){
			$emailMsg.css('color', '#c33').html('请输入正确的邮箱');
		} else {
			$.get("${ctx}/user/validateEmail", {	
  	 			email: $.trim($email.val()),
  	 			v: Math.random()
  	 		}, function(ruslet) {
		  		 var $submitBtn = $('#submitBtn');
		  		 if ($.trim(ruslet) == 1) {
		  			$emailMsg.css('color', 'green').html('帐号可用!');
			  		$submitBtn.prop('disabled', false);	 
		  		 } else {
			  		$emailMsg.css('color', '#c33').html('账号不可用');
		    	 	$submitBtn.prop('disabled', true);
		  		 }
  	 		});
		}
	}
    	function validate() {
    		var flag = true;
    		var $email = $('#email');
    		var $emailMsg = $('#emailMsg');
    		if ($.trim($email.val()) == '') {
    			$emailMsg.css('color', '#c33').html('帐号不能为空!');
    			flag = false;
    		} else if ($.trim($email.val()).length > 20) {
    			$emailMsg.css('color', '#c33').html('帐号的长度不能超过20个字符!');
    			flag = false;
    		} else {
    			$emailMsg.html('');
    		}
    		
    		// 密码
    		var $password = $('#password');
    		var $passwordMsg = $('#passwordMsg');
    		if ($.trim($password.val()) == '') {
    			$passwordMsg.css('color', '#c33').html('密码不能为空!');
    			flag = false;
    		} else if ($.trim($password.val()).length < 6 || $.trim($password.val()).length > 12) {
    			$passwordMsg.css('color', '#c33').html('密码必须在6~12位之位!');
    			flag = false;
    		} else {
    			$passwordMsg.html('');
    		}
    		
    		
    		// 帐号
    		var $username = $('#username');
    		var $usernameMsg = $('#usernameMsg');
    		if ($.trim($username.val()) == '') {
    			$usernameMsg.css('color', '#c33').html('姓名不能为空!');
    			flag = false;
    		} else if ($.trim($username.val()).length > 10) {
    			$usernameMsg.css('color', '#c33').html('姓名的长度不能超过10个字符!');
    			flag = false;
    		} else {
    			$usernameMsg.html('');
    		}
    		return flag;
    	}
    </script>
    
    
</body>
</html>
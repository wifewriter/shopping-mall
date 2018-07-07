<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="header-wrapper ">
    <ul class="header-list">
        <li class="list-active"><a href="/page/toMainPage">
            <i class="fa fa-2x fa-home"></i>
            <p>首页</p>
        </a></li>
        <li><a href="/page/productCategory"> <i class="fa fa-2x fa-th"></i>
            <p>商品分类</p>
        </a></li>
        <li><a href="${ctx }/shopcar/toShopCar"> <i
                class="fa fa-2x fa-shopping-cart"></i>
            <p>购物车</p>
        </a></li>
        <c:if test="${not empty sessionScope.username }">
            <li><a href="userinfo.html"> <i class="fa fa-2x fa-user"></i>
                <p>用户中心</p>
            </a>
            
            <a href="${ctx }/user/logout">注销</a>
            </li>        
        </c:if>
        <c:if test="${empty sessionScope.username }">
            <li><a id="loginButton" href="javascript:(0)"> <i class="fa fa-2x fa-user"></i>
                <p>登录</p>
            </a>
            
            </li>
        </c:if>
    </ul>

    <div class="container">
        <!-- Button trigger modal -->

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" onclick="closeForm()"
                                data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">登录</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <form class="form-horizontal" action="javascript:submitChang()"
                                  method="post" id="loginForm">
                                <span id="msg"></span>
                                <input type="hidden" name="count" id="count" value="">

                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">邮箱：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control " id="email"
                                               name="email" placeholder="请输入登录邮箱帐号" autofocus="autofocus"
                                               required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">密码：</label>
                                    <div class="col-sm-4">
                                        <input type="password" class="form-control" id="password"
                                               name="password" placeholder="请输入对应的密码" required="required">
                                    </div>
                                </div>
					  			<div class="form-group" style="display:none;" id="validateCodeGroup">
								    <label for="validateCode" class="col-sm-2 control-label">验证码：</label>
								    <div class="col-sm-4">
								      <input type="text" class="form-control validate-code" id="validateCode" name="validateCode" placeholder="请输入右侧的验证码" maxlength="4">
								      <img src="${ctx }/kaptcha.jpg" width="90" height="32" title="看不清？点击换一张" onclick="change(this)" style="cursor: pointer;">
								    </div>
								  </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-4">
                                        <div class="checkbox">
                                            <label> <input type="checkbox" id="remember"
                                                           name="remember" value="remember"> 记住帐号
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-4">
                                        <button type="submit" class="btn btn-primary btn-block">登录</button>
                                        <a href="<%=request.getContextPath()%>/user/toRegister"
                                           class="btn btn-primary btn-block">注册</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

	<script src="${ctx }/static/vendor/jquery.cookie.js"></script>
    <script>
        $(function () {
            $('#loginButton').click(function () {
                $('#myModal').modal({
                    keyboard: false,
                    backdrop: 'static'
                });
            })
            
            // 在当前登录页面时，就检查在Cookie中是否有email信息，如果有就显示到帐号的输入框上，并选中记住帐号的复选框。
			var email = $.cookie('email');
	    	if (email != null && email != '') {
	    		$('#email').val(email);
	    		$('#remember').prop('checked', true);
	    	}
	    	// 打开登录页面时的初始化操作
	    	var count = $.cookie('count');
	    	 if (!count) {
		    		$('#count').val('0');
		    	} else {
		    		$('#count').val(count);
		    	}
            
            /**
             * 验证码切换
             */
            function change(o) {
                // 由于浏览器对相同地址的请求有缓存，因此我们在这里添加了一个随机参数
                o.src = '${ctx }/kaptcha.jpg?v=' + Math.random();
            }

            /**
             * 登录
             */

            function closeForm() {
                $('#loginForm')[0].reset();
            }


        })

        function submitChang() {
        	var count = $.cookie('count');
            var $msg = $('#msg');
            var loginForm = $('#loginForm');
            var params = loginForm.serialize();
            var url = "${ctx}/user/login";
            $.post(url, params, function (data) {
                if (data == 4) {
                    $msg.css('color', 'green').html('登录成功');
                    $('#myModal').modal('hide');
                    location="/page/toMainPage";
                    
					//登录成功后把账号存到cookie                    
                    var checked= $("input[type='checkbox']").prop("checked");  
                    if(checked){
                    	var value = $('#email').val();
                    	alert(value);
                    	$.cookie('email', value , {expires: 15 });
                    }else{
                    	$.cookie('email', '', {expires: 0});
                    } 
                    count = '1';
                    $.cookie('count', count, {expires: 15 });
                    $('#count').val(count);
                } else if (data == 1) {  
                    count = parseInt(count) + 1 + '';
                    $.cookie('count', count, {expires: 15 });
                    $('#count').val(count);   
                    $msg.css('color', '#c33').html('账号或密码错误');
                    if (count >= 3) {
        	    		$('#validateCode').prop('required', true);
        	    		$('#validateCodeGroup').show();
        	    	}
                } else if (data == 2) {
                	count = parseInt(count) + 1 + '';
                    $.cookie('count', count, {expires: 15 });
                    $('#count').val(count); 
                   
                    layer.alert("账号被禁用请联系客服");
                    $msg.css('color', '#c33').html('账号被禁用请联系客服');
                    if (count >= 3) {
        	    		$('#validateCode').prop('required', true);
        	    		$('#validateCodeGroup').show();
        	    	}
                } else if (data == 3) {
                	count = parseInt(count) + 1 + '';
                    $.cookie('count', count, {expires: 15 });
                    $('#count').val(count); 
                    $msg.css('color', '#c33').html('验证码错误');
                    if (count >= 3) {
        	    		$('#validateCode').prop('required', true);
        	    		$('#validateCodeGroup').show();
        	    	}
                }
            });
        }

    </script>

</header>

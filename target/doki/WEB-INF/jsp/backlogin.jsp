<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String path=request.getContextPath(); %>
<title>后台登录界面</title>

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>



<script type="text/javascript">
	function refresh() {
		document.getElementById('captcha_img').src = "kaptcha.jpg?"
				+ Math.random();
	}
</script>

</head>

<body><h3>欢迎来到后台管理登录系统</h3>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<form action="${pageContext.request.contextPath}/back/login">
				<div class="form-group">
					<label for="exampleInputEmail1">用户名</label> <input type="text"
						class="form-control" id="username" name="username" placeholder="请输入用户名">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="password" name="password"
						placeholder="请输入密码">
				</div>
				
				<div class="form-group">
					<label>验证码(不区分大小写)</label> <input
						type="text" class="form-control" id="verifyCodeActual" name="kaptcha"
						placeholder="请输入验证码">
					<div class="item-input">
                   <img id="captcha_img" alt="点击更换" title="点击更换"
                        onclick="refresh()" src="kaptcha.jpg" />
                   </div>	
						
				</div>
				  
                
				<div class="checkbox">
					<label> <input type="checkbox" name="checkboxNum" id="checkboxNum"> 记住密码
					</label>
				</div>
				<div class="row">
				
				<div class="col-md-12">
				<button type="submit" class="btn btn-info btn-lg" id="login">登录</button>
				</div>
				</div>
				<h4 style="color:red">${errmsg}</h4>
			</form>
		</div>
		<div class="col-md-4"></div>
	</div>

<script src="<%=path%>/js/cookie/getcookie.js"></script>
<script type="text/javascript">
$(function(){
	var cookiestr=getCookie("back");
	if(cookiestr!=""){
		$("#checkboxNum").prop("checked",true);
		cookiestr=cookiestr.substring(0,cookiestr.length-1);
		var username=cookiestr.split("#")[0];
		username=decodeURIComponent(username);
		var password=cookiestr.split("#")[1];
		$("#username").val(username);
		$("#password").val(password);
	}	
});

$("#register").click(function(){
	window.location.href="${pageContext.request.contextPath}/user/toregister";
	
	
	
});


</script>


</body>
</html>
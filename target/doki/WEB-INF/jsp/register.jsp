<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%String path=request.getContextPath(); %>
<title>管理系统-注册页</title>
<!--  <link rel="stylesheet" href="../../css/register.css">-->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
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
</head>
<body>

	<div class="row">
		<div class="col-md-4">
			<h5></h5>
		</div>
		<div class="col-md-4">
			<form class="mt-4" method="post" id="RegisterForm">

				<div class="form-group mb-4">
					<label>请输入您的用户名</label><em style="color: red;">*</em> <input type="text" name="username"
						placeholder="输入您的用户名" id="username"
						class="form-control border-0 shadow form-control-lg form-required">
						<h5 style="color: red">${errmsg}</h5>
				</div>

				<div class="form-group mb-4">
				<label>请输入您的密码</label>
					<em style="color: red;">*</em> <input type="password"
						name="password" placeholder="输入您的密码，密码需要6-16位" id="password"
						class="form-control border-0 shadow form-control-lg text-violet form-required">
						<label id="err" style="color:red"></label>
				</div>
				<div class="form-group mb-4">
				<label>请再次输入您的密码</label>
					<em style="color: red;">*</em> <input type="password"
						name="password1" placeholder="请再次输入您的密码，密码需要6-16位" id="password1"
						class="form-control border-0 shadow form-control-lg text-violet form-required">
				</div>

				<div class="form-group mb-4">
				<label>请输入您的角色</label>
					<em style="color: red;">*</em> <input type="text" name="roleid"
						placeholder="输入您的角色" id="roleid"
						class="form-control border-0 shadow form-control-lg form-required"
						list="rolelist">
					<datalist id="rolelist">
						<option>管理员</option>
						<option>用户</option>
					</datalist>
					<label id="err1" style="color:red"></label>
				</div>
				<div class="form-group mb-4">
				<label>请输入您的性别</label>
					<input type="text" name="sex" placeholder="输入您的性别" id="sex"
						class="form-control border-0 shadow form-control-lg"
						list="sexlist">
					<datalist id="sexlist">
						<option>男</option>
						<option>女</option>
					</datalist>
				</div>
				<div class="form-group mb-4">
				<label>请输入您的年龄</label>
					<input type="text" name="sex" placeholder="输入您的年龄" id="age"
						class="form-control border-0 shadow form-control-lg">

				</div>




				<div class="form-group mb-4">
				<label>请输入您的生日</label>
					<input type="date" name="birthday" placeholder="输入您的生日"
						id="birthday" class="form-control border-0 shadow form-control-lg">
				</div>
				<div class="form-group mb-4">
				<label>请输入您的电话</label>
					<input type="text" name="tel" placeholder="输入您的电话" id="tel"
						class="form-control border-0 shadow form-control-lg">
						<label id="err2" style="color:red"></label>
				</div>
				<div class="form-group mb-4">
				<label>请输入您的个人签名</label>
					<input type="text" name="signature" placeholder="输入您的个人签名"
						id="signature"
						class="form-control border-0 shadow form-control-lg">
				</div>


				
			</form>
			<button class="btn btn-primary" id="reg_btn">注册</button>
			<button class="btn btn-default" id="return_btn">返回</button>


		</div>
		<div class="col-md-4"></div>
	</div>


	<script src="<%=path%>/js/cookie/getcookie.js"></script>
	<script type="text/javascript">
		$("#reg_btn").click(function() {
		var username=$("#username").val();
		var password=$("#password").val();
		var password1=$("#password1").val();
		var roleid=$("#roleid").val();
		var sex=$("#sex").val();
		var age=$("#age").val();
		var birthday=$("#birthday").val();
		var tel=$("#tel").val()
		var signature=$("#signature").val();
		//username不可重复，从后端获取所有username匹配
		
		
		//两次密码输入一致
		if(password!=password1){
			$("#err").html("两次密码不一致");
			return false;
		}	
		//密码要在6-16位
		if(password.length<6 || password.length>16){
			$("#err").html("密码需要在6-16位之间");
			return false;
		}
		//防止篡改用户角色
		if(roleid!="管理员" && roleid!="用户"){
			$("#err1").html("您的角色必须填入管理员或用户");
			return false;
		}
		//检测电话是否为11位
		if(tel.length!=11){
			$("#err2").html("您的电话号码需要填入11位");
			return false;
		}
		if(roleid=="用户"){
			roleid=2;
		}
		if(roleid=="管理员"){
			roleid=1;
			
		}
		
		
		
		var data={
				"username":username,
				"password":password,
				"roleid":roleid,
				"sex":sex,
				"age":age,
				"birthday":birthday,
				"telephone":tel,
				"signature":signature
		};
		$.ajax({
			url : '${pageContext.request.contextPath}/user/register',
			type : 'POST',
			data : JSON.stringify(data),
			contentType : 'application/json',
			success : function() {
				var err='${errmsg1}';
			
				if (err==null ||err.length==0){
				alert("注册成功,即将跳转到登录界面");
				window.location.href = "${pageContext.request.contextPath}/user/tologin";
				}
				else{alert(err);}
				
				},
		});
		
		
		
			
			
		});
		
		$("#return_btn").click(function(){
			window.location.href="${pageContext.request.contextPath}/user/tologin"
		});
		
		
	</script>








</body>
</html>

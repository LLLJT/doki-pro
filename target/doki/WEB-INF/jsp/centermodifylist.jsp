<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%
	String path = request.getContextPath();
%>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>个人中心</title>

<!-- Bootstrap core CSS -->
<script src="<%=path%>/js/jquery-3.5.0.min.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<!-- Custom fonts for this template -->
<link href="<%=path%>/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="<%=path%>/css/clean-blog.min.css" rel="stylesheet">

</head>

<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<img alt="Brand" src="<%=path%>/images/logo1.png" width="65px"
					height="100%">
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="<%=path%>/user/toindex">首页 <span class="sr-only">(current)</span></a></li>
					<li><a href="<%=path%>/user/toclassify">分类</a></li>
					<li class="dropdown"><a href="<%=path%>/user/toabout">关于Doki百科 </a></li>
					<li><a href="${pageContext.request.contextPath}/blog/getAll">用户论坛</a></li>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="搜索"
							id="search_content">
					</div>
					<button type="button" class="btn btn-default" id="search_btn">
						<span class="glyphicon glyphicon-search" aria-hidden="true">搜索</span>
					</button>
				</form>



				<ul class="nav navbar-nav navbar-right">
					<li><img src="<%=path%>/images/user/ljt.jpg" alt="..."
						class="img-circle" width="55px" height="55px">欢迎登陆，<label
						id="getuser"></label></li>
					<li><a href="#" id="history">搜索历史</a></li>
					<li><a href="<%=path%>/center/mycenter">个人中心</a></li>
					<li><a href="" id="notify">通知</a></li>
					
						<li><a href="${pageContext.request.contextPath}/user/tologin" id="login">登录|注册</a></li>
					
					
						<li><a href="${pageContext.request.contextPath}/user/logout" id="logout">登出</a></li>
					

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- Page Header -->
	<header class="masthead" style="background-color: green;">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 mx-auto">
					<div class="row">
						<div class="col-md-2">
							<button type="button" class="btn btn-default btn-lg"
								id="home_btn">个人主页</button>
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-danger btn-lg"
								id="collect_btn">收藏列表</button>
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-warning btn-lg"
								id="fanlist_btn">粉丝列表</button>
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-primary btn-lg"
								id="watchlist_btn">关注列表</button>
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-success btn-lg"
								id="modifylist_btn">修改个人信息</button>
						</div>
					</div>


					<div class="site-heading">
						<h1>修改个人信息</h1>


					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<h1>修改个人信息</h1>
		<form class="form-horizontal" id="saveList" method="post">
			<div class="modal-body">

				<div class="form-group">
					<label class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="username"
							name="username" placeholder="请输入用户名"
							value="${userlist.username }">
					</div>
				</div>


				<div class="form-group">
					<label for="password1" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">

						<input type="text" id="sex" name=sex placeholder="请输入性别"
							class="form-control border-0 shadow form-control-lg"
							list="typelist3" value="${userlist.sex }">
						<datalist id="typelist3">
							<option>男</option>
							<option>女</option>

						</datalist>

					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-2 control-label">电话</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="telephone"
							name="telephone" placeholder="请输入电话"
							value="${userlist.telephone }">
					</div>
				</div>
				<div class="form-group">
					<label for="password1" class="col-sm-2 control-label">角色</label>
					<div class="col-sm-10">

						<input type="text" name="roleid" id="roleid" placeholder="请输入角色"
							value="${userlist.roleid==1?'管理员':'用户' }"
							class="form-control border-0 shadow form-control-lg"
							list="typelist4">
						<datalist id="typelist4">
							<option value=1>管理员</option>
							<option value=2>用户</option>

						</datalist>

					</div>
				</div>
				<div class="form-group">
					<label for="birthday" class="col-sm-2 control-label">生日</label>
					<div class="col-sm-10">
						<input type="date" name="birthday" placeholder="输入您的生日"
							id="birthday" value="${userlist.birthday }"
							class="form-control border-0 shadow form-control-lg">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">个性签名</label>
					<div class="col-sm-10">

						<textarea class="form-control" rows="6" id="signature"
							name="signature">${userlist.signature }</textarea>
					</div>
				</div>




			</div>

			<div class="modal-footer">
				
				<button type="button" class="btn btn-primary" id="info_btn">提交</button>

			</div>
		</form>
		<h1>修改密码</h1>
		<form class="form-horizontal" id="saveList" method="post">
			<div class="modal-body">


				<div class="form-group">
					<label for="password" class="col-sm-2 control-label">请输入原密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="oldpassword"
							name="oldpassword" placeholder="原密码" value="">
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-2 control-label">请输入新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="newpassword"
							name="password" placeholder="新密码" value="">
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-2 control-label">请再次输入一遍新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="newpassword2"
							name="password2" placeholder="新密码" value="">
					</div>
				</div>
			</div>

			<div class="modal-footer">
				
				<button type="button" class="btn btn-primary" id="psd_btn">提交${errmsg }</button>

			</div>
		</form>
		<h1>修改头像</h1>
		
		<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
			<div class="modal-body">


				<div class="form-group">
					<label for="exampleInputFile">文件上传</label> <input type="file"
						id="pic" name="pic">
					<p class="help-block">请上传jpg/png/jpeg/gif等格式的图片文件</p>
				</div>

			</div>

			<div class="modal-footer">
				
				<button type="submit" class="btn btn-primary" id="pic_btn">提交</button>

			</div>
		</form>
	</div>








	<hr>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 mx-auto">

					<p class="copyright text-muted">Copyright &copy; Doki 2019</p>
				</div>
			</div>
		</div>
	</footer>


	<!-- Custom scripts for this template -->
	<script src="<%=path%>/js/clean-blog.min.js"></script>
	<script src="<%=path%>/js/cookie/getcookie.js"></script>
	<script src="<%=path%>/js/md5.js"></script>


	<script type="text/javascript">
		$(function() {
			var cookiestr = getCookie("user");
			var cookiename = cookiestr.split("#")[0];
			cookiename=decodeURIComponent(cookiename);
			//该用户未登录
			if (cookiename == null) {
				$("#login").show();
				$("#logout").hide();
				$("#history").hide();
			} else {
				$("#history").show();
				$("#login").hide();
				$("#logout").show();
			}
			$("#getuser").text(cookiename);
			
			var id=parseInt(getCookie("user").split("#")[2]);
			$("#notify").attr('href','<%=path%>/notify/tonotify?userid='+id);
			/* $.ajax({
				url:"${pageContext.request.contextPath}/hotword/indexlist",
				type:'GET',
				success:function(){
					alert('success');
					
				}
				
			}); */

		});
		//搜索按钮
		$("#search_btn")
				.click(
						function() {
							var str = getCookie("user");
							var strid = str.split("#")[2];
							var id = parseInt(strid);
							var search = $("#search_content").val();

							var data = {
								"searchtitle" : search,
								"userid" : id
							}

							window.location.href = "${pageContext.request.contextPath}/search/indexsearch?searchtitle="
									+ search + "&userid=" + id;
							/* $.ajax({
								url:'${pageContext.request.contextPath}/search/indexsearch',
								type : 'POST',
								data : JSON.stringify(data),
								contentType : 'application/json',
								success : function(){
									alert("搜索成功，跳转到搜索界面");
									window.location.href="${pageContext.request.contextPath}/user/tosearch"
									
								}
								
								
							}); */

						});

		//搜索历史按钮
		$("#history")
				.click(
						function() {
							var str = getCookie("user");
							var strid = str.split("#")[2];
							strid = parseInt(strid);

							window.location.href = '${pageContext.request.contextPath}/user/history?userid='
									+ strid;

						});
	
		
		$("#home_btn").click(function(){
		
			window.location.href="<%=path%>/center/mycenter";
			
		})
		
		
		$("#collect_btn").click(function(){
			var id=parseInt(getCookie("user").split("#")[2]);
			
			window.location.href="<%=path%>/center/tocollect?userid="+id;
			
		});
		$("#fanlist_btn").click(function(){
			var id=parseInt(getCookie("user").split("#")[2]);
			
			window.location.href="<%=path%>/center/tofanlist?userid="+id;
		})
		$("#watchlist_btn").click(function(){
			var id=parseInt(getCookie("user").split("#")[2]);
			
			window.location.href="<%=path%>/center/towatchlist?userid="+id;
			
		})
		$("#modifylist_btn").click(function(){
			var id=parseInt(getCookie("user").split("#")[2]);
			
			window.location.href="<%=path%>/center/centermodify?userid="+id;
			
		});
		
		$("#info_btn").click(function(){
			var id=parseInt(getCookie("user").split("#")[2]);
			var username=$("#username").val();
			var sex=$("#sex").val();
			var telephone=$("#telephone").val();
			var roleid=$("#roleid").val()=="管理员"?1:2;
			var birthday=$("#birthday").val();
			var signature=$("#signature").val();
			var data={
					"id":id,
					"username":username,
					"sex":sex,
					"telephone":telephone,
					"roleid":roleid,
					"birthday":birthday,
					"signature":signature		
			}
			alert("修改成功");
			$.ajax({
				url : "<%=path%>/center/modifyinfo",
				type : 'POST',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					
				}
			});
		});
		
		$("#psd_btn").click(function(){
			var id=parseInt(getCookie("user").split("#")[2]);
			var psd='${userlist.password}';
			var oldpassword=$("#oldpassword").val();
			var newpassword=$("#newpassword").val();
			var newpassword2=$("#newpassword2").val();
			if(newpassword!=newpassword2){
				alert("两次密码输入不一致");
				return false;
			}
			var oldmd5 = hex_md5(encodeURIComponent(oldpassword));
			if(oldmd5!=psd){
				alert("原密码不正确，请重新输入");
		    	return false;
			
			}
			
			
			alert("该用户已修改密码，请重新登录");
			window.location.href="<%=path%>/center/modifypsd?id="+id+"&password="+newpassword;
		});
		
		
		
	</script>
</body>

</html>

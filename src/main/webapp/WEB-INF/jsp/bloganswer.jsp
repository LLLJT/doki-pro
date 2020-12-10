<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>回复界面</title>

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
	<header class="masthead"
		style="background-image: url('<%=path%>/images/about-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
			
				<div class="col-md-2">
				<h2 style="color:white"><a href="<%=path%>/blog/detail?blogid=${answerlist[0].blogid}">返回</a></h2>
				</div>
				<div class="col-md-8 mx-auto">
					<div class="page-heading">
						<h1>评论</h1>
						<span class="subheading">${answerlist[0].comment }</span>
						<input type="text" id="userid1" hidden="true" value="${answerlist[0].userid }">
						
						<label id="commenttime1"><fmt:formatDate value="${answerlist[0].commentTime }" pattern="yyyy-MM-dd"/></label>
						

					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->


	<hr>
	<!-- 回复区 -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-2">
				
				</div>
				<div class="col-md-10 mx-auto">
					<h2>回复区</h2>
					<c:forEach items="${answerlist }" var="list" varStatus="i">


						<div class="row">
							<div class="col-md-12">
								<h3>${list.comment2 }</h3>
								
							</div>

						</div>


						<div class="row">
							<div class="col-md-8">用户：${list.username2 }</div>
							
							<div class="col-md-4">
								创建时间：
								<fmt:formatDate pattern="yyyy-MM-dd"
									value="${list.commentTime2 }" />
							</div>
						</div>
						<br>
						<br>




					</c:forEach>
					<h4>添加回复</h4>
					<textarea rows="3" style="width: 95%; height: auto"
						onscroll="this.rows++;" id="ins_comment"></textarea>
					<br><br>
					<div class="row">
					<br>
						<div class="col-md-10"></div>
						<div class="col-md-2">


							<button type="button" id="submit-btn" class="btn btn-info">回复</button>
							
						</div>


					</div>
				</div>
			</div>
			<br>

		</div>
		</div>

	</footer>
	<!-- 评论区结束 -->
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

	<!-- Bootstrap core JavaScript -->


	<!-- Custom scripts for this template -->
	<script src="<%=path%>/js/clean-blog.min.js"></script>



	<script src="<%=path%>/js/cookie/getcookie.js"></script>
	
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
		
		//添加回復
		$("#submit-btn").click(function(){
			var textarea=$("#ins_comment").val();
			var blogid='${answerlist[0].blogid}'
			var str = getCookie("user");
			var strid = str.split("#")[2];
			var userid2 = parseInt(strid);
			var userid=parseInt('${answerlist[0].userid}');
			var comment1='${answerlist[0].comment}';
			var commenttime1=$("#commenttime1").text();
			if(textarea==''){
				alert("评论不能为空");
				return false;
				
			}
			alert("评论成功");
			window.location.href="<%=path%>/blog/answer?id="+blogid+"&userid2="+userid2+"&comment2="+textarea+"&userid="+userid+"&comment="+comment1+"&commentTime1="+commenttime1;
				
					
				});
	</script>
</body>
</html>

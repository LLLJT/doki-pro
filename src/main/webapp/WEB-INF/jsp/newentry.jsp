<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta charset="utf-8">
<link rel="stylesheet" href="<%=path%>/css/re.css" />
<link rel="stylesheet" href="<%=path%>/css/entry.css" />


<script src="<%=path%>/js/jquery-3.5.0.min.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css" />
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<title>新建词条</title>

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
	<div class="row">
		<div class="col-md-3">
			<div class="container">
				<div class="row">
					<div class="span2">
						<ul class="nav nav-pills nav-stacked">

							<li class="active"><a href="#">词条列表</a></li>
							<li>.</li>
							<li>
								<button type="button" class="btn btn-default" id="cre_btn">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新建词条
								</button>
							</li>

							<!-- foreach，输出所有词条title -->
							<c:forEach items="${wordlist }" var="list">
								<li><a href="<%=path%>/user/toentry?id=${list.id}">
										<h4 style="color: white">${list.wordtitle }</h4>
								</a></li>

							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<div class="col-md-9">
			<div class="block">
				<div class="row">
					<div class="col-md-2">
						<h1>新建词条</h1>
					</div>
					<div class="col-md-8">
						<br>
						<br>
						<br>
						<br>
						<form class="form-horizontal">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">词条标题</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="wordtitle"
										placeholder="请输入词条标题">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">词条简介</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="5" placeholder="请输入词条简介"
										id="wordcontent"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">词条分类</label>
								<div class="col-sm-10">
									<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios1" value="1" > 词条分类1
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios2" value="2"> 词条分类2
								</label>
							</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">词条副标题1</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="title1"
										placeholder="请输入词条副标题">
								</div>
							</div>
							
							
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">词条内容1</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="5" placeholder="请输入词条内容1"
										id="content1"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">词条副标题2</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="title2"
										placeholder="请输入词条副标题2">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">词条内容2</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="5" placeholder="请输入词条内容2"
										id="content2"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">词条副标题3</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="title3"
										placeholder="请输入词条副标题3">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">词条内容3</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="5" placeholder="请输入词条内容3"
										id="content3"></textarea>
								</div>
							</div>

						</form>
						<div class="row">
							<div class="col-md-10"></div>

							<div class="col-md-2">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-info" id="sub_btn">提交</button>
							</div>
						</div>


					</div>

				</div>

			</div>
		</div>

	</div>
	<div class="down">
		<div class="down1">doki百科</div>
		<div class="down2">虚拟主播图鉴百科</div>
		<div class="down3">隐私政策</div>
		<div class="down4">联系我们</div>
		<div class="down5">免责声明</div>
		<div class="down6">公司招聘</div>
	</div>

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
		$("#cre_btn").click(function(){
				window.location.href="<%=path%>/user/tocreatehotword";
		});
		
		$("#sub_btn").click(function(){
			var cookiestr = getCookie("user");
			var id=parseInt(cookiestr.split("#")[2]);
			var typeid=parseInt($("input:radio:checked").val());
			if(typeid==null){
				alert("您必须选择一个分类");
				return false;
			}
			
			var wordtitle=$("#wordtitle").val();
			var title1=$("#title1").val();
			var title2=$("#title2").val();
			var title3=$("#title3").val();
			var wordcontent=document.getElementById("wordcontent").value;
			var content1=document.getElementById("content1").value; 
			var content2=document.getElementById("content2").value; 
			var content3=document.getElementById("content3").value; 
			var data={
					"wordtitle":wordtitle,
					"wordcontent":wordcontent,
					"typeid":typeid,
					"title1":title1,
					"content1":content1,
					"title2":title2,
					"content2":content2,
					"title3":title3,
					"content3":content3,
					"userid":id
			};
	
			$.ajax({
				url : "<%=path%>/user/createhotword",
				type : 'POST',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					alert("成功新增词条，等待后台审核");
					$("#insModal").modal('hide');
					 window.location.reload();
				}

			});
			
			
		});
	</script>

</body>
</html>

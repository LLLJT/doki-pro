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
<link rel="stylesheet" href="<%=path%>/css/doki.css" />
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
<title>doki百科</title>

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
					<li><img src="<%=path%>${pic}" alt="..."
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



	<div class="block1">
		<table>
			<tr>
				<td><img src="<%=path%>/images/hy.jpg"></td>
				<td>
					<h3 id="hitokoto" style="color: white"></h3>
					
					出自：<h4 style="color: white" id="hitokoto1"></h4>
				</td>
			</tr>
		</table>




	</div>
	<div class="block2">
		<%-- <div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="<%=path %>/images/1.jpg" width="100%" height="100%" alt="First slide" class="img-thumbnail">
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img src="<%=path %>/images/2.jpg" width="100%" height="100%" alt="Second slide" class="img-thumbnail">
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img src="<%=path %>/images/3.jpg" width="100%" height="100%" alt="Third slide" class="img-thumbnail">
					<div class="carousel-caption"></div>
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div> --%>

		<script language=javascript>
				var curIndex = 0;
				var timeInterval = 3000;
				var arr = new Array();
				arr[0] = "<%=path%>/images/1.jpg";
				arr[1] = "<%=path%>/images/2.jpg";
				arr[2] = "<%=path%>/images/3.jpg";
				setInterval(changeImg, timeInterval);

				function changeImg() {
					var obj = document.getElementById("obj");
					if (curIndex == arr.length - 1) {
						curIndex = 0;
					} else {
						curIndex += 1;
					}
					obj.src = arr[curIndex];
				}
			</script>
			<img id=obj src="<%=path %>/images/1.jpg" width=500px height=330px border=0>


	</div>
	<div class="centerlnb">
		<div class="lnb1">热搜词条</div>
		<div class="lnb2">

			<span class="s3"><a
				href="${pageContext.request.contextPath}/hotword/list">更多&gt;</a></span>
		</div>
	</div>
	<div class="centerrnb">
		虚拟主播排行榜 <span><a href="<%=path%>/vtuber/getAll">更多&gt;</a></span>
	</div>
	<div class="block3">
		<div class="R1">

			<ul>
				<c:forEach items="${indexlist }" var="indexlist" varStatus="i"
					begin="0" end="4">
					<li><a href="#">${i.index+1 }.${indexlist.wordtitle }</a></li>
				</c:forEach>
			</ul>


		</div>

	</div>
	<div class="block4">
		<div class="R2">
			<ul>
				<c:forEach items="${vtuberlist }" var="list" varStatus="i"
					begin="0" end="4">
					<li><a href="#">${i.index+1 }.${list.name }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="lowlnb">
	
		doki用户 
		<a style="color: white"
			href="${pageContext.request.contextPath}/user/donatelist">
			
			更多</a>
	</div>


	<div class="d1">
	
		<div class="t1">
		
			<div class="t11">doki第一贡献者</div>
			<div class="t12">
				<img src="<%=path%>${donatelist[0].img}">
			</div>
			<div class="t13">${donatelist[0].username }</div>
			<div class="t14">发帖数：${donatelist[0].count }</div>
		</div>
		<div class="t2">
			<div class="t21">doki第二贡献者</div>
			<div class="t22">
				<img src="<%=path%>${donatelist[1].img}">
			</div>
			<div class="t23">${donatelist[1].username }</div>
			<div class="t24">发帖数：${donatelist[1].count }</div>
		</div>
		<div class="t3">
			<div class="t31">doki第三贡献者</div>
			<div class="t32">
				<img src="<%=path%>${donatelist[2].img}">
			</div>
			<div class="t33">${donatelist[2].username }</div>
			<div class="t34">发帖数：${donatelist[2].count }</div>
		</div>
		
	</div>
	<div class="lowrnb">用户动态</div>
	<div class="d2">
		<ul>
			<li><a href="#">${notifylist[0].username }成功编辑了"${notifylist[0].notifytitle }"</a></li>
			<li><a href="#">${notifylist[1].username }成功编辑了"${notifylist[1].notifytitle }"</a></li>
			<li><a href="#">${notifylist[2].username }成功编辑了"${notifylist[2].notifytitle }"</a></li>
			
		</ul>
		<div class="d3">
			<h4 style="color:black">我来试试</h4>
			<h4 style="color:black">doki百科是众人参与可协作的 tuber百科网站。无论是创建词条,编辑现有词条,
				您都可以亲手为doki百科作出贡献。</h4>
			<div class="d4">
				<div class="ssrm"><a href="<%=path%>/user/tostartedit">编辑入门</a></div>
				<div class="ssws"><a href="<%=path%>/user/toentry?id=11">词条库</a></div>
			</div>
		</div>

	</div>
	<div class="row">

		<div class="col-md-8"></div>
		<div class="col-md-4"></div>
	</div>

	<label id="hitokoto" style="color: white"></label>
	<div class="down">
		<div class="down1">doki百科</div>
		<div class="down2">虚拟主播图鉴百科</div>
		<div class="down3">隐私政策</div>
		<div class="down4">联系我们</div>
		<div class="down5">免责声明</div>
		<div class="down6">公司招聘</div>
	</div>




	<script src="<%=path%>/js/cookie/getcookie.js"></script>
	<script src="<%=path%>/js/hitokoto.js"></script>
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
		
	</script>

</body>
</html>

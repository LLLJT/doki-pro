<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta charset="utf-8">

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
<link rel="stylesheet" href="<%=path%>/css/re.css" />
<link rel="stylesheet" href="<%=path%>/css/about.css" />
<title>关于doki百科</title>
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
				<div class="col-md-2"></div>
				<div class="col-md-10"><div class="block">
		<div class="doki">

			

			<span style="color: black">&nbsp&nbsp&nbsp&nbspdoki百科</span>
			<p style="text-indent: 2em;">Doki百科是以虚拟主播为主题的在线百科全书。
				因为创始人们秉持着“想要把虚拟主播的有趣之处传递给更多人”的想法，
				所以本百科主要是收录虚拟主播以及与虚拟主播相关的信息与同人作品。虽然看上去doki百科偏向于收集女性虚拟主播，
				这只是因为目前虚拟主播行业女性虚拟主播数量确实多于男性，实际上对于doki百科来说，只要是有些名气的虚拟主播，
				基本都会有所收录。同时，doki百科是非盈利计划，任何人均可在遵守服务器所在地法律、doki百科规定的前提下，
				自由地创建条目、添加内容。</p>
		</div>
		<div class="jianjie">
			<span>&nbsp&nbsp&nbsp&nbsp网站简介</span>
			<p style="text-indent: 2em;">百科是一个以虚拟主播为主题，兼具百科和论坛功能的网站。
				尽管“doki”看上去与虚拟主播这一主题无关，实际上却是按照这一主题而命名的。简单来说，
				就是将DD和“心跳”这两个与虚拟主播有所关联的元素结合起来，由此得名。 Doki百科以“想要把虚拟主播的有趣之处传递给更多人”为初心，
				以虚拟主播为主题目标收集虚拟主播以及与虚拟主播相关的信息与同人作品， 以让更多人发现并感受到虚拟主播带来的乐趣。</p>
		</div>
		<div class="xuni">
			<span>&nbsp&nbsp&nbsp&nbsp虚拟主播</span>
			<p style="text-indent: 2em;">虚拟主播是指使用虚拟形象在视频网站上进行投稿活动的主播，
				以虚拟YouTuber最为人所知。在中国，虚拟主播普遍被称为虚拟UP主，Virtual UP（VUP）。
				在中国以外的地区，虚拟主播由于普遍活跃于YouTube被称为Virtual YouTuber（VTuber）。
				虽然虚拟主播最先在日本大火，但是目前由于近两年迅速的发展， 虚拟主播的存在也逐渐走入国内观众的视野。</p>
		</div>
		<div class="tese">
			<span>&nbsp&nbsp&nbsp&nbsp网站特色</span>
			<p style="text-indent: 2em;">Doki百科虽然名义上是百科，实际上它也包含了论坛的功能。
				不论是百科和论坛，都是围绕着虚拟主播这一主题展开的。百科用以介绍虚拟主播的个人信息以及其趣闻与梗，
				在词条中一定程度上进行neta的同时会给出出处，以此让人们更好地认识这些虚拟主播。
				论坛则是为了让观众们有一个友好的交流环境以提高用户体验。总的来说，
				doki百科的全部功能基本都是为了让用户更好地享受虚拟主播带来的乐趣。</p>
		</div>
	</div></div>

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
		</script>
</body>
</html>

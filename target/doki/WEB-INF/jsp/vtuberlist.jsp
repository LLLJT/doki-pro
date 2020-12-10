<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta charset="utf-8">
<link rel="stylesheet" href="<%=path%>/css/re.css" />
<link rel="stylesheet" href="<%=path%>/css/hotwordlist.css" />

<script src="<%=path%>/js/jquery-3.5.0.min.js"></script>
<link rel="stylesheet" href="<%=path %>/css/bootstrap-vtuberlist.css" />
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	<script src="<%=path %>/js/back.js"></script>
    
    <link rel="stylesheet" href="<%=path %>/css/back-vtuberlist.css" />
<!-- 引入样式 -->
<!-- <link rel="stylesheet"
	href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
引入组件库
<script src="https://unpkg.com/element-ui/lib/index.js"></script> -->
<style>
#intro{
text-align:left;
margin-top:80px;}
</style>
<title>vtuber列表</title>
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
	<div class="navbar  navbar-inverse" role="navigation">
     

  <div id="wrapper">
         <div class="overlay"></div>

        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                       目录
                    </a>
                </li>
                <c:forEach items="${vlist }" var="list" >
                 <li>
                    <a href="<%=path%>/vtuber/tovtuber?id=${list.id}">${list.name }</a>
                </li>
                
                </c:forEach>
            </ul>
        </nav>
        <!-- /#sidebar-wrapper -->
        

        <!-- Page Content -->
         
        <div id="page-content-wrapper">
       
          <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
          </button>
       

         
        </div>
        
        <!-- /#page-content-wrapper -->

    </div>
    </div>
	
	
	
	<!-- 导航栏结束 -->
  <div class="block">
		<h1></h1>


		<c:forEach items="${vtuberlist }" var="list" varStatus="i" begin="0" end="3" step="1">
			<div class="row">
				<div class="col-md-10"><h3> <a href="<%=path%>/vtuber/tovtuber?id=${list.id}">${i.index+1}${list.name }</a></h3></div>
				<div class="col-md-2"><h3>粉丝数：${list.fannum }万</h3></div>
			</div>
			<div class="row">
				<div class="col-md-2">
					<img src="<%=path%>${list.address1}" width="200" height="200">
				</div>
				<div class="col-md-6" id="intro"><h4>&nbsp&nbsp&nbsp&nbsp${list.mengpoint}</h4></div>
				
			</div>

________________________________________________________________________________________________________________________________________________________________
		</c:forEach>

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


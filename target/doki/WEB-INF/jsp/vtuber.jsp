<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
	<%
	String path = request.getContextPath();
%>
		<meta charset="utf-8">
		<link rel="stylesheet" href="<%=path %>/css/re.css" />
		
		<script src="<%=path%>/js/jquery-3.5.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	<link href="<%=path%>/css/vtuberdetail.css" rel="stylesheet">
		<title>vtuber详细信息</title>
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
	<div class="col-md-1"></div>
  <div class="col-md-1">
<a class="btn btn-default" href="<%=path %>/vtuber/getAll" role="button">返回</a>
  </div>
  <div class="col-md-8">
 <div class="panel panel-default">
  <div class="panel-body">
    <h1>${vtuber.name }</h1>
    <hr>
    
    <div class="row">
  <div class="col-md-6">
   <h4>pid:${vtuber.pid }</h4><br>
    <h4>发色:${vtuber.haircolor }</h4><br>
    <h4>身高:${vtuber.height }厘米</h4><br>
    <h4>体重:${vtuber.weight }</h4><br>
    <h4>年龄:${vtuber.age }</h4><br>
    <h4>生日:${vtuber.birth }</h4><br>
    <h4>星座:${vtuber.xingzuo }</h4><br>
    <h4>所属团体:${vtuber.group }</h4><br>
    <h4>萌点:</h4>
    <h4>${vtuber.mengpoint }</h4>
  </div>
  <div class="col-md-6">
<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>   
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
           <img src="<%=path %>${vtuber.address1}" alt="..." height="100" width="auto" class="img-rounded">
        </div>
        <div class="item">
           <img src="<%=path %>${vtuber.address2}" alt="..." height="100" width="auto" class="img-rounded">
        </div>
        <div class="item">
           <img src="<%=path %>${vtuber.address3}" alt="..." height="100" width="auto" class="img-rounded">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
             <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
             <span class="sr-only">Previous</span>
         </a>
         <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
             <span class="sr-only">Next</span>
         </a>
</div>
  
  
  </div>
</div>
    
    <hr>
    <hr>
    <h1>个人介绍</h1>
    <h4 style="line-height:30px">
   <textarea rows="40" id="textarea" style="border: none; width: 100%; height: auto" onscroll="this.rows++;" disabled="disabled">${vtuber.intro }</textarea></h4>
  </div>
</div>
  
  
  </div>
  <div class="col-md-2"></div>
</div>
<hr>
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
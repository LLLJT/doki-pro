<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%
	String path = request.getContextPath();
%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
  <link href="<%=path %>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="<%=path %>/css/clean-blog.min.css" rel="stylesheet">

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
  <header class="masthead" style="background-color:#0099cc">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
       <div class="col-md-2"></div>
        <div class="col-md-8 mx-auto">
        <div class="row">
  <div class="col-md-2"><button type="button" class="btn btn-default btn-lg" id="home_btn">个人主页</button></div>
  <div class="col-md-2"><button type="button" class="btn btn-danger btn-lg" id="collect_btn">收藏列表</button></div>
  <div class="col-md-2"><button type="button" class="btn btn-warning btn-lg" id="fanlist_btn">粉丝列表</button></div>
  <div class="col-md-2"><button type="button" class="btn btn-primary btn-lg" id="watchlist_btn">关注列表</button></div>
  <div class="col-md-2"><button type="button" class="btn btn-success btn-lg" id="modifylist_btn">修改个人信息</button></div>
</div>
        
        
          <div class="site-heading">
            <h1>关注列表</h1>
            
            
          </div>
        </div>
         <div class="col-md-2"></div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
     <h1>关注列表</h1>  
    
     
        
			
        <!-- Pager -->
 <c:forEach items="${watchlist }" var="list" varStatus="i">
			<div class="row">
				<div class="col-md-10"><h3><a href="<%=path%>/center/tocenter?userid2=${list.userid2}">${i.index+1}.${list.username }</a></h3>
			
				
				<img src="<%=path%>${list.img}" alt="..."
						class="img-circle" width="55px" height="55px">
						<h4><small>签名：${list.signature }</small></h4>
						</div>
				<div class="col-md-2"><button type="button" style="width:100px;height:50px" class="btn btn-success btn-sub" id="sub" name="${list.userid2 }">${subinfo[i.index] }</button></div>
			</div>
			<hr>
		</c:forEach>      
      </div>
   
   
   
   
   
    
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
  <script src="<%=path %>/js/clean-blog.min.js"></script>
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
			
		//关注按钮
		$(".btn-sub").click(function(){
			//要关注的id
			var userid2=$(this).attr("name");
			var userid1=parseInt(getCookie("user").split("#")[2]);
			var buttonValue= $(this).html();
			if(buttonValue=='已关注'){
				//取消关注
				//取消关注成功
				alert("取消关注成功");
				window.location.href="<%=path%>/center/deletewatch1?userid1="+userid1+"&userid2="+userid2;
				$(this).html('未关注');
			}
			else{
				
				window.location.href="<%=path%>/center/insertwatch1?userid1="+userid1+"&userid2="+userid2;
				$(this).html('已关注');
			}
			
			
			
		});
		

		
	</script>
</body>

</html>

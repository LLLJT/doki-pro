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

  <title>博客主页</title>

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
  <header class="masthead" style="background-image: url('<%=path%>/images/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
       <div class="col-md-2"></div>
        <div class="col-md-8 mx-auto">
          <div class="site-heading">
            <h1>欢迎来到doki论坛</h1>
            <span class="subheading">年轻人聚集讨论的地方</span>
            <h3>
             <div class="clearfix">
             <a class="btn btn-primary " data-toggle="modal" data-target="#myModal" href="#" id="ins-btn">新建博客 &rarr;</a>
          
        </div>
        </h3>
          </div>
        </div>
         <div class="col-md-2"></div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
    <div class="col-md-2"></div>
      <div class="col-md-8 mx-auto">
      <c:forEach items="${bloglist.list}" var="bloglist">
        <div class="post-preview">
          <a href="<%=path %>/blog/detail?blogid=${bloglist.id }">
            <h2 class="post-title">
              ${bloglist.blogtitle }
            </h2></a>
            <h5>分类：${bloglist.typename}</h5>
            <c:if test="${not empty bloglist.pic}">
           
            <img src="<%=path %>/${bloglist.pic }" width="100px" height="100px" name="image"  class="img-rounded img_btn">
            </c:if>
            <c:if test="${empty bloglist.pic }">
        
            
            </c:if>
          
          <p class="post-meta">作者：
            <a href="#">${bloglist.username }</a>
            </p>
        </div>
        <hr>
        </c:forEach>
        <hr>
        <nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a
						href="${pageContext.request.contextPath}/blog/getAll?pn=1"
						aria-label="Previous">首页 </a></li>

					<c:if test="${bloglist.hasPreviousPage}">
						<li><a
							href="${pageContext.request.contextPath}/blog/getAll?pn=${bloglist.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:if test="${!bloglist.hasPreviousPage }">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach items="${bloglist.navigatepageNums}" var="pNum">
						<c:if test="${pNum==bloglist.pageNum}">
							<li class="active"><a href="#">${pNum}</a></li>
						</c:if>
						<c:if test="${pNum!=bloglist.pageNum}">
							<li><a
								href="${pageContext.request.contextPath}/blog/getAll?pn=${pNum}">${pNum}</a>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${bloglist.hasNextPage }">
						<li><a
							href="${pageContext.request.contextPath}/blog/getAll?pn=${bloglist.pageNum+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<c:if test="${!bloglist.hasNextPage }">
						<li><a href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a
						href="${pageContext.request.contextPath}/blog/getAll?pn=${bloglist.pages}"
						aria-label="Previous">尾页 </a></li>

				</ul>
			</nav>
			当前页数:${bloglist.pageNum}页,总页数:${bloglist.pages}页，总条数:${bloglist.total}条
        <!-- Pager -->
       
      </div>
      <div class="col-md-2"></div>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel" id="">新建博客</h4>
				</div>
				<div class="modal-body">
					<!-- insert框，放在模態框内？ -->
					<!-- main content -->
					<form action="${pageContext.request.contextPath}/blog/insert"
						method="post" enctype="multipart/form-data">
						<input type="hidden" id="userid" name="userid" >
						<div class="form-group">
							<label>博客标题</label> <input type="text" class="form-control"
								id="blogtitle" name="blogtitle">
						</div>
						<div class="form-group">
							<label>博客内容</label><br>
							<textarea rows="4" cols="85" id="blogcontent" name="blogcontent"></textarea>

						</div>
						<div class="form-group">
							<label for="exampleInputFile">上传图片</label> <input type="file"
								id="pic" name="pic">
							<p class="help-block">请上传jpg/png/gif格式文件</p>
						</div>
						<label>博文类型</label>
						<div class="radio">
							<label> <input type="radio" name="blogtypeid"
								id="options1" value="1"> 游戏
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="blogtypeid"
								id="options2" value="2">生活
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="blogtypeid"
								id="options3" value="3"> 水类
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="blogtypeid"
								id="options4" value="4"> 讨论类
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="blogtypeid"
								id="options5" value="5"> 真爱类
							</label>
						</div>




						<!-- //insert框 -->

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-default" id="sub_btn">提交</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
 
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
		var flag = true;
		$(document).on("click", ".img_btn", function(){
			//状态true为正常的状态,false为放大的状态

	          var imgH;//图片的高度

	          var imgW;//图片的宽度

	           img = $(this);

	  

	      //图片点击事件

	       imgH = img.attr("height"); //获取图片的高度

	       imgW = img.attr("width"); //获取图片的宽度
		
	       if(flag){

	           //图片为正常状态,设置图片宽高为现在宽高的4倍

	           flag = false;//把状态设为放大状态

	          img.attr("height",4*imgH);

	           img.attr("width",4*imgW);

	       }else{

	           //图片为放大状态,设置图片宽高为现在宽高的4分之一

	           flag = true;//把状态设为正常状态

	           img.attr("height",imgH/4);

	           img.attr("width",imgW/4);
	       }

	 

	   });
	
		$("#ins-btn").click(function(){
			var cookiestr = getCookie("user");
			var id=parseInt(cookiestr.split("#")[2]);
			$("#userid").val(id);
		
			
		})
			
			$("#sub_btn").click(function(){
				alert("新建成功，等待后台审核");
				
			});
			
			
		

		
	</script>
</body>

</html>

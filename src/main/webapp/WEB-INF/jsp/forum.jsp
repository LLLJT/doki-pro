<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta charset="utf-8">
<title>论坛管理系统</title>
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
</head>
<body>
<!-- 
--------------------------------------------------------unused--------------------------------------------------
-->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <img alt="Brand" src="<%=path%>/images/logo1.png" width="65px" height="100%">
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/user/toindex">首页 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">分类</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">关于Doki百科 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">嘿嘿</a></li>
            <li><a href="#">嘿嘿嘿</a></li>
            <li><a href="#">嘿嘿嘿嘿</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">嘿嘿嘿嘿嘿</a></li>
          </ul>
        </li>
         <li><a href="${pageContext.request.contextPath}/blog/getAll">用户论坛</a></li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="搜索" id="search_content">
        </div>
        <button type="button" class="btn btn-default" id="search_btn"><span class="glyphicon glyphicon-search" aria-hidden="true">搜索</span></button>
      </form>
      
      	
      
      <ul class="nav navbar-nav navbar-right">
     <li> <img src="<%=path %>/images/user/ljt.jpg" alt="..." class="img-circle" width="55px" height="55px">欢迎登陆，${username}</li>
        <li><a href="#" id="history">搜索历史</a></li>
        
        <c:if test="${username==null}">
       <li><a href="${pageContext.request.contextPath}/user/tologin">登录|注册</a></li>
       </c:if>
       <c:if test="${username!=null}">
       <li><a href="${pageContext.request.contextPath}/user/logout">登出</a></li>
       </c:if>
       
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


	<!-- ---------------------------------------------insert模态框------------------------------------------------------------------- -->
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#myModal">新建博文</button>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<!-- insert框，放在模態框内？ -->
					<!-- main content -->
					<form action="${pageContext.request.contextPath}/blog/insert"
						method="post" enctype="multipart/form-data">
						<input type="hidden" id="userid" name="userid" value="">
						<div class="form-group">
							<label>Blog title</label> <input type="text" class="form-control"
								id="blogtitle" name="blogtitle">
						</div>
						<div class="form-group">
							<label>Blog content</label><br>
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
	<!-- //insert模态框 -->

<div class="row">
  <div class="col-md-4">分类栏
  
  </div>
  <div class="col-md-4">
  <!-- 搜索框 -->
  <div class="form-group">
          <input type="text" class="form-control" placeholder="搜索" id="search_content1" >
        </div>
        <button type="button" class="btn btn-default" id="search_btn1"><span class="glyphicon glyphicon-search" aria-hidden="true">搜索</span></button>
        
   <!-- //搜索框 -->     
        <!-- blog内容 -->
	<c:forEach items="${bloglist.list}" var="bloglist">
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/blog/detail?id=${bloglist.id }"
				id="blog${bloglist.id }">${bloglist.blogtitle }</a></li>
			<li>${bloglist.blogcontent }</li>
			<li>${bloglist.blogtypeid }</li>
			<li>${bloglist.blogwatch }</li>
			<li>${bloglist.userid }</li>

		</ul>
	</c:forEach>

	<!-- //blog内容 -->
        <!-- 导航栏 -->
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
		</div>
		<!-- //导航栏 -->
		
        
        
  <div class="col-md-4"></div>
</div>

	



<script src="<%=path%>/js/cookie/getcookie.js"></script>
	<script type="text/javascript">
	$(function(){
		
		var str=getCookie("user");
		var strid=parseInt(str.split("#")[2]);
		document.getElementById("userid").value=strid;

	})
	
	
		$("#blog").click(function() {
			var id = $(this).parent().children("li").eq(5).text();
			alert(id);
			//window.location.href = "${pageContext.request.contextPath}/blog/detail?id="+ id;

		});
		
	$("#sub_btn").click(function(){
		alert("新建成功，待审核通过");
		
	});
	
	$("#search_btn").click(function(){
		var str=getCookie("user");
		var strid=str.split("#")[2];
		var id=parseInt(strid);
		var search=$("#search_content").val();
		
		var data={
				  "searchtitle" : search,
				  "userid" : id
		}
		
		window.location.href="${pageContext.request.contextPath}/search/indexsearch?searchtitle="+search+"&userid="+id;
		
		
	});
	$("#search_btn1").click(function(){
		var str=getCookie("user");
		var strid=str.split("#")[2];
		var id=parseInt(strid);
		var search=$("#search_content1").val();
		
		var data={
				  "searchtitle" : search,
				  "userid" : id
		}
		
		window.location.href="${pageContext.request.contextPath}/search/indexsearch?searchtitle="+search+"&userid="+id;
		
		
	});
	
	</script>







</body>
</html>
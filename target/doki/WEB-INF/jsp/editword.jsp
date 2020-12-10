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
								<li><a href="<%=path%>/user/toentry?id=${list.id}"><h4
											style="color: white">${list.wordtitle }</h4></a></li>

							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<div class="col-md-9">
			<div class="block">
				<!-- 调用foreach输出词条内容 -->

				<h1 style="color: black">${detail.wordtitle }&nbsp;&nbsp;&nbsp;<button
						type="button" class="btn btn-default btn-xs" id="edit-btn">编辑词条</button>
				</h1>

				<h2 style="color: black">目录</h2>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">简介</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">${detail.title1 }</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">${detail.title2 }</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">${detail.title3 }</a></li>
				<h3 style="color: black">简介</h3>
				<c:if test="${detail.wordtitle!=null }">
			————————————————————————————————————————————————————————————————————————————
			</c:if>
				<h4>
					<textarea rows="5" onscroll="this.rows++;" cols="130" id="wordcontent">${detail.wordcontent }</textarea>
				</h4>

				<h3 style="color: black">
					<input type="text" class="form-controla" id="title1"
						placeholder="请输入词条副标题1" value="${detail.title1 }">
				</h3>
				<c:if test="${detail.title1!='' }">
			————————————————————————————————————————————————————————————————————————————
			</c:if>
				<c:if test="${detail.content1!=''}">
					<h4>
						<textarea rows="5" onscroll="this.rows++;" cols="130" id="content1">${detail.content1 }</textarea>
					</h4>
				</c:if>

				<br>
				<br>
				<br>
				<br>
				<h3 style="color: black">
					<input type="text" class="form-controla" id="title2"
						placeholder="请输入词条副标题2" value="${detail.title2 }">
				</h3>
				<c:if test="${detail.title2!='' }">
			————————————————————————————————————————————————————————————————————————————
			</c:if>

				<c:if test="${detail.content2!='' }">
					<h4>
						<textarea rows="5" onscroll="this.rows++;" cols="130" id="content2">${detail.content2 }</textarea>
					</h4>
				</c:if>
				<br>
				<br>
				<br>
				<br>
				<h3 style="color: black">
					<input type="text" class="form-controla" id="title3"
						placeholder="请输入词条副标题3" value="${detail.title3 }">
				</h3>
				<c:if test="${detail.title3!='' }">
			————————————————————————————————————————————————————————————————————————————
			</c:if>
				<c:if test="${detail.content3!='' }">
					<h4>
						<textarea rows="5" onscroll="this.rows++;" cols="130" id="content3">${detail.content3 }</textarea>
					</h4>
				</c:if>
				<br><br>
				<div class="row">
  <div class="col-md-10"></div>
  <div class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button type="button" class="btn btn-info" id="up-btn" data-toggle="modal"
									data-target="#upModal">修改</button></div>
  <!-- --------------------------------------------------upModal模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="upModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改词条</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="deleteList">
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control" id="up_content" name="">
							</div>
						</div>
						<div class="form-group">
							<h4>
								<label class="col-sm-8 control-label" id="up_word" name=""></label>
							</h4>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="update-btn">确认</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------upModal的模态框结束位置------------------------------------------------------ -->
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
				window.location.href="<%=path%>/user/tonewentry";
		});
		$("#edit-btn").click(function(){
			window.location.href="<%=path%>/user/toeditword?";

		});
		$("#up-btn").click(function(){
		
			var old_wordcontent="${detail.wordcontent}"
			var old_title1='${detail.title1}';
			var old_content1='${detail.content1}';
			var old_title2='${detail.title2}';
			var old_content2='${detail.content2}';
			var old_title3='${detail.title3}';
			var old_content3='${detail.content3}';
			
			var wordtitle=$("#wordtitle").val();
			var title1=$("#title1").val();
			var title2=$("#title2").val();
			var title3=$("#title3").val();
			var wordcontent=document.getElementById("wordcontent").value;
			var content1=document.getElementById("content1").value; 
			var content2=document.getElementById("content2").value; 
			var content3=document.getElementById("content3").value; 
			//比较标题，每次只能修改一个标题内的内容
			//修改第一个标题内容
			var modify="";
			var modifycontent="";
			var flag=0;
			//简介内容
			if(old_wordcontent!=wordcontent){
				modify="简介";
				modifycontent=wordcontent;
				flag=0;
			}
			if(old_title1!=title1 || old_content1!=content1){
				modify+=old_title1;
				modifycontent=content1;
				flag=1;
			}
			if(old_title2!=title2 || old_content2!=content2){
				modify+=old_title2;
				modifycontent=content2;
				flag=2;
			}
			if(old_title3!=title3 || old_content3!=content3){
				modify+=old_title3;
				modifycontent=content3;
				flag=3;
			}
			if(modify!="简介" && modify!=old_title1 && modify!=old_title2 && modify!=old_title3){
				alert("只能修改一个标题内容");
				return false;
			}
			var upword="确认要修改"+modify+"内容吗？";
			$("#up_word").html(upword);
			if(flag==0)
				$("#up_word").attr("name","简介");
			if(flag==1)
				$("#up_word").attr("name",title1);
			if(flag==2)
				$("#up_word").attr("name",title2);
			if(flag==3)
				$("#up_word").attr("name",title3);
			$("#up_content").attr("name",modifycontent);
		})
		
		$("#update-btn").click(function(){
			var cookiestr = getCookie("user");
			var userid=parseInt(cookiestr.split("#")[2]);
			var id=parseInt('${detail.id}');
			//要修改的标题
			var uptitle=$("#up_word").attr("name");
			//要修改的内容
			var upcontent=$("#up_content").attr("name");
			var data={
					"id":id,
					
					"uptitle":uptitle,
					"upcontent":upcontent	
			}
			
			
			
			$.ajax({
				url : "<%=path%>/user/editword",
				type : 'POST',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					alert("成功更新词条，等待后台审核");
					$("#upModal").modal('hide');
					 window.location.reload();
				}

			});
			
			
			
			
		});
		
	</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户角色管理</title>
<%
	String path = request.getContextPath();
%>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="<%=path%>/js/back.js"></script>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path%>/css/back.css" />
</head>
<body>
	<!-- 导航栏 -->
	<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
		<div class="position1">
			<label class="font-type"><h3>doki后台管理员管理系统</h3></label>
		</div>
		<div class="position1">
			<label class="font-type"><h3>管理员名称:${username}</h3></label>
		</div>

		<div id="wrapper">
			<!--   <div class="overlay"></div> -->

			<!-- Sidebar -->
			<nav class="navbar navbar-inverse navbar-fixed-top"
				id="sidebar-wrapper" role="navigation">
				<ul class="nav sidebar-nav">
					<li class="sidebar-brand"><a href="#"> 目录 </a></li>
					<li><a href="<%=path%>/back/tobackindex"><i
							class="fa fa-fw fa-home"></i> 主页</a></li>
					<li><a href="<%=path%>/back/tobackblog"><i
							class="fa fa-fw fa-folder"></i>博客管理</a></li>
					<li><a href="<%=path%>/back/tobackblogcheck"><i
							class="fa fa-fw fa-file-o"></i>博客审核管理</a></li>
					<li><a href="<%=path%>/back/tobackword"><i
							class="fa fa-fw fa-cog"></i> 词条管理</a></li>
					<!-- <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-plus"></i> Dropdown <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header">Dropdown heading</li>
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li> -->
					<li><a href="<%=path%>/back/tobackwordcheck"><i
							class="fa fa-fw fa-bank"></i> 词条审核管理</a></li>
					<li><a href="<%=path%>/back/tobackuser"><i
							class="fa fa-fw fa-dropbox"></i> 用户管理</a></li>
					<li><a href="<%=path%>/back/tobackuserrole"><i
							class="fa fa-fw fa-twitter"></i> 用户角色管理</a></li>
					<li><a href="<%=path%>/back/logout"><i
							class="fa fa-fw fa-twitter"></i> 登出</a></li>
				</ul>
			</nav>
			<!-- /#sidebar-wrapper -->


			<!-- Page Content -->

			<div id="page-content-wrapper">

				<button type="button"
					class="hamburger is-closed animated fadeInLeft"
					data-toggle="offcanvas">
					<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
						class="hamb-bottom"></span>
				</button>



			</div>

			<!-- /#page-content-wrapper -->

		</div>
	</div>

	<!-- //navbar end -->
	<!-- --------------------------------------------------delete模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">删除角色</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="deleteList">
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control" id="del_id" name="id">
							</div>
						</div>
						<div class="form-group">
							<h4>
								<label class="col-sm-8 control-label">确认要删除该角色吗？</label>
							</h4>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="deleteuser_btn">确认</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------delete的模态框结束位置------------------------------------------------------ -->
	<!-- ---------------------------------------------res模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="resModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">恢复角色</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="deleteList">
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control" id="res_id" name="id">
							</div>
						</div>
						<div class="form-group">
							<h4>
								<label class="col-sm-8 control-label">确认要恢复该角色吗？</label>
							</h4>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="resuser_btn">确认恢复</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------delete的模态框结束位置------------------------------------------------------ -->
	<!-- ----------------------------------------------//res模态框结束 -->


	<br>
	<br>
	<br>
	<br>
	<br>
	<h1>用户管理界面</h1>
	<div class="row">
		<div class="col-md-12">
			<ul class="breadcrumb">
				<li><a href="<%=path%>/back/tobackindex">主页</a></li>
				<li><a href="<%=path%>/back/tobackuser">用户</a></li>
				<li class="active">用户角色管理</li>
			</ul>
		</div>
	</div>
	<div class="row">

		<div class="col-md-1"></div>
		<div class="col-md-10">
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#insmodal" id="add_btn">添加角色</button>


			<!-- --------------------------------------新增模态框-------------------------------------- -->
			<div class="modal fade" id="insmodal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">新建角色</h4>
						</div>
						<form class="form-horizontal" id="saveList" method="post">
							<div class="modal-body">

								<div class="form-group">
									<label class="col-sm-2 control-label">角色号</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="ins_roleid"
											placeholder="请输入角色号">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">角色名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="ins_rolename"
											placeholder="请输入角色名">
									</div>
								</div>
								
								
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" id="ins_btn">创建角色</button>

							</div>
						</form>
					</div>

				</div>
			</div>
			<!-- ----------------------------------------------新增模态框结束位置------------------------------------- -->

		</div>
	</div>


	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table">
				<tr>
					<th>序号</th>
					<th>角色号</th>
					<th>角色名</th>
					<th>角色操作</th>
				</tr>
				<c:forEach items="${rolelist.list}" var="user">
					<tr>
						<td>${user.id}</td>
						<td>${user.roleid }</td>
						<td>${user.rolename}</td>
						<td><c:if test="${user.delFlag==1 }">
								<button type="button" class="btn btn-danger del_btn"
									name="${user.id }" id="del_btn" data-toggle="modal"
									data-target="#deleteModal">删除</button>
							</c:if> <c:if test="${user.delFlag==0 }">
								<button type="button" class="btn btn-success res_btn"
									name="${user.id }" id="res_btn" data-toggle="modal"
									data-target="#resModal">恢复</button>
							</c:if></td>
					</tr>
				</c:forEach>

			</table>

		</div>
		<div class="col-md-1"></div>
	</div>


	<script src="<%=path%>/js/cookie/getcookie.js"></script>

	<script type="text/javascript">
	
		
//新建模态框保存按钮
		

		//赋值操作
		$("#ins_btn").click(function(){
			
			var rolename=$("#ins_rolename").val();
			var roleid=$("#ins_roleid").val();
			var id=parseInt(roleid);
			alert(typeof(id));
			window.location.href="<%=path%>/back/roleinsert?rolename="+rolename+"&roleid="+id;
			
		});

		

		$(document).on("click", ".del_btn", function() {
			//修改框中用户信息回显
			
			var del_id = $(this).attr("name");
			
			
		
			$("#del_id").val(del_id);
		
			
			
		});
		$(document).on("click", ".res_btn", function() {
			//修改框中用户信息回显

			var res_id = $(this).attr("name");
			
			$("#res_id").val(res_id);
		});
		

		$("#deleteuser_btn").click(function() {
			alert("删除角色成功");
			var gid = $("#del_id").val();
			var id = parseInt(gid);
			window.location.href="<%=path%>/back/roledelete?id="+id;
		
		});
		$("#resuser_btn").click(function() {
			alert("恢复用户成功");
			var gid = $("#res_id").val();
			var id = parseInt(gid);
			window.location.href="<%=path%>/back/roleres?id="+id;

		});
		
		

		
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>博客管理</title>
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
					<h4 class="modal-title" id="myModalLabel">删除博客</h4>
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
								<label class="col-sm-8 control-label">确认要删除该用户吗？</label>
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
					<h4 class="modal-title" id="myModalLabel">恢复用户</h4>
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
								<label class="col-sm-8 control-label">确认要恢复该用户吗？</label>
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

	<!-- --------------------------------------------------update模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="updateList">
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control" id="up_id" name="id">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="up_username"
									name="up_username" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<input type="text" id="up_sex" name="up_sex" placeholder="请输入性别"
									class="form-control border-0 shadow form-control-lg"
									list="uprolelist">
								<datalist id="uprolelist">
									<option>男</option>
									<option>女</option>

								</datalist>
							</div>
						</div>
						<div class="form-group">
							<label for="password1" class="col-sm-2 control-label">电话</label>
							<div class="col-sm-10">

								<input type="text" class="form-control" id="up_telephone"
									name="up_telephone" placeholder="请输入电话">


							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">角色</label>
							<div class="col-sm-10">
								<input type="text" id="up_roleid" name="up_roleid"
									placeholder="请输入角色"
									class="form-control border-0 shadow form-control-lg"
									list="uprolelist1">
								<datalist id="uprolelist1">
									<option>管理员</option>
									<option>用户</option>

								</datalist>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-sm-2 control-label">生日</label>
							<div class="col-sm-10">
								<input type="date" name="up_birthday" placeholder="输入您的生日"
									id="up_birthday"
									class="form-control border-0 shadow form-control-lg">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">个性签名</label>
							<div class="col-sm-10">

								<textarea class="form-control" rows="6" id="up_signature"
									name="up_signature"></textarea>


							</div>
						</div>

					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="updateUser_btn">修改</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------update的模态框结束位置------------------------------------------------------ -->
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
				<li class="active">用户管理</li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4"></div>

		<div class="col-md-4">
			<form class="form-inline" action="<%=path%>/back/usersearch">
				<div class="form-group">
					<label for="exampleInputName2">用户名：</label> <input type="text"
						class="form-control" name="username" id="search_blogtitle"
						autocomplete="on" placeholder="请输入要查询的博客">
				</div>
				<button type="submit" class="btn btn-default" id="search_btn">查询用户</button>
			</form>
		</div>
		<div class="col-md-4"></div>
		<div class="col-md-2"></div>
		<div class="col-md-2">
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#insmodal" id="add_btn">添加用户</button>

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
							<h4 class="modal-title" id="myModalLabel">新建用户</h4>
						</div>
						<form class="form-horizontal" id="saveList" method="post">
							<div class="modal-body">

								<div class="form-group">
									<label class="col-sm-2 control-label">用户名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="ins_username"
											placeholder="请输入用户名">
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="ins_password"
											placeholder="请输入密码">
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">请再一次输入密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="ins_password2"
											placeholder="请再一次输入密码">
									</div>
								</div>

								<div class="form-group">
									<label for="password1" class="col-sm-2 control-label">性别</label>
									<div class="col-sm-10">

										<input type="text" id="ins_sex" name="blogtypename"
											placeholder="请输入性别"
											class="form-control border-0 shadow form-control-lg"
											list="typelist3">
										<datalist id="typelist3">
											<option>男</option>
											<option>女</option>

										</datalist>

									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">电话</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="ins_telephone"
											placeholder="请输入电话">
									</div>
								</div>
								<div class="form-group">
									<label for="password1" class="col-sm-2 control-label">角色</label>
									<div class="col-sm-10">

										<input type="text" id="ins_role" name="blogtypename"
											placeholder="请输入角色"
											class="form-control border-0 shadow form-control-lg"
											list="typelist4">
										<datalist id="typelist4">
											<option>管理员</option>
											<option>用户</option>

										</datalist>

									</div>
								</div>
								<div class="form-group">
									<label for="birthday" class="col-sm-2 control-label">生日</label>
									<div class="col-sm-10">
										<input type="date" name="ins_birthday" placeholder="输入您的生日"
											id="ins_birthday"
											class="form-control border-0 shadow form-control-lg">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">个性签名</label>
									<div class="col-sm-10">

										<textarea class="form-control" rows="6" id="ins_signature"
											name="ins_signature"></textarea>
									</div>
								</div>




							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" id="ins_btn">创建用户</button>

							</div>
						</form>
					</div>

				</div>
			</div>
			<!-- ----------------------------------------------新增模态框结束位置------------------------------------- -->
			<!-- -----------------------------------------------------------修改图片模态框---------------------------------------- -->

			<div class="modal fade" id="imgModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">修改头像</h4>
						</div>
						<form class="form-horizontal"
							action="<%=path%>/back/userimgmodify" id="saveList"
							method="post" enctype="multipart/form-data">
							<div class="modal-body">

								<div class="form-group">
									<label for="exampleInputFile">请上传文件</label> <input type="file"
										id="img" name="pic">
									<p class="help-block">上传图片格式为jpg/jpeg/gif/png</p>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-10">
										<input type="hidden" class="form-control" id="img_id"
											name="imgid">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-10">
										<input type="hidden" class="form-control" id="img_username"
											name="imgusername">
									</div>
								</div>




							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-primary">修改</button>

							</div>
						</form>
					</div>

				</div>
			</div>

			<!-- -----------------------------------------------------------修改图片模态框结束位置-------------------------------- -->
		</div>
	</div>


	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table">
				<tr>
					<th>序号</th>
					<th width="10%">用户头像</th>
					<th>用户名</th>
					<th>性别</th>
					<th>电话</th>
					<th>角色</th>
					<th>生日</th>
					<th>个性签名</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${userlist.list}" var="user">
					<tr>
						<td>${user.id}</td>
						<td><img src="<%=path %>${user.img}" height="50px"
							width="50px" class="img-circle">
							<button type="button" class="btn btn-default btn-xs img-btn" id="img_btn"
								data-toggle="modal" data-target="#imgModal">修改</button> <td>${user.username }</td>
						<td>${user.sex }</td>
						<td>${user.telephone }</td>
						<td>${user.roleid==1?'管理员':'用户' }</td>
						<td>${user.birthday }</td>
						<td>${user.signature }</td>
						<td>
							<button type="button" class="btn btn-primary edit_btn"
								id="update_btn" data-toggle="modal" data-target="#updateModal">编辑</button>
						</td>

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
	<div class="row">
		<div class="col-md-4">当前页数:${userlist.pageNum}页,总页数:${userlist.pages}页，总条数:${userlist.total}条</div>
		<div class="col-md-4">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a id="indexpage" href="#" aria-label="Previous">首页 </a></li>

					<c:if test="${userlist.hasPreviousPage}">
						<li><a id="prepage" href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:if test="${!userlist.hasPreviousPage }">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<!-- 导航 -->
					<c:forEach items="${userlist.navigatepageNums}" var="pNum">
						<c:if test="${pNum==userlist.pageNum}">
							<li class="active"><a href="#">${pNum}</a></li>
						</c:if>
						<c:if test="${pNum!=userlist.pageNum}">
							<li><a id="navpage" name="${pNum }"
								href="<%=path%>/back/usersearch?username=&pn=${pNum }">${pNum}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${userlist.hasNextPage }">
						<li><a id="nextpage" href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span></a></li>
					</c:if>

					<c:if test="${!userlist.hasNextPage }">
						<li><a href="#" aria-label="Next"><span
								aria-hidden="true">&raquo;</span> </a></li>
					</c:if>

					<li><a id="endpage" href="#" aria-label="Previous">尾页 </a></li>

				</ul>
			</nav>
		</div>
		<div class="col-md-4"></div>
	</div>

	<script src="<%=path%>/js/cookie/getcookie.js"></script>

	<script type="text/javascript">
	$(function(){
		//获取model传来的值
		/* var user=getCookie("like");
		$("#search_username").val(user); */
		
		
		var pdata='${userlist.list}';
		var pnum='${userlist.pageNum}';
		var prenum='${userlist.pageNum-1}';
		var nexnum='${userlist.pageNum+1}';
		var pn='${userlist.pages}';
		var gettitle=$("#search_blogtitle").val();
		var indexpn="<%=path%>/back/usersearch?username="+gettitle+"&pn=1";
		var prepn="<%=path%>/back/usersearch?username="+gettitle+"&pn="+prenum;
		var nextpn="<%=path%>/back/usersearch?username="+gettitle+"&pn="+nexnum;
		
		
	<%-- 	var navpn="<%=path%>/back/usersearch?username="+gettitle+"&pn="+navpage; --%>
		
		var endpn="<%=path%>/back/usersearch?username="+gettitle+"&pn="+pn;
		
		console.log("indexpn:"+indexpn);
		console.log("prepn:"+prepn);
		console.log("nextpn:"+nextpn);
	//	console.log("navpn:"+navpn);
		console.log("endpn:"+endpn);
		$("#indexpage").attr("href",indexpn);
		$("#prepage").attr("href",prepn);
		$("#nextpage").attr("href",nextpn);
		//$("#navpage").attr("href",navpn);
		$("#endpage").attr("href",endpn);	
		
	});
//新建模态框保存按钮
		

		//赋值操作
		$(document).on("click", ".edit_btn", function() {
			//修改框中用户信息回显
			
			var id1 = $(this).parent().parent().children("td").eq(0).text();
			//将id的值传递给修改按钮的属性，方便发送Ajax请求
			$("#updateUser_btn").attr("edit-id", id1);
			
			var username1 = $(this).parent().parent().children("td").eq(2).text();
			var sex1 = $(this).parent().parent().children("td").eq(3).text();
			var telephone1 = $(this).parent().parent().children("td").eq(4).text();
			var role1 = $(this).parent().parent().children("td").eq(5).text();
			var birthday1 = $(this).parent().parent().children("td").eq(6).text();
			var signature1 = $(this).parent().parent().children("td").eq(7).text();
			
			//将取到的值分别赋给updateModal里的字段
	
			
			$("#up_id").val(id1);
			$("#up_username").val(username1);
			//$("#up_blogcontent").val(blogcontent1);
			$("#up_sex").val(sex1);
			$("#up_telephone").val(telephone1);
			$("#up_roleid").val(role1);
			$("#up_birthday").val(birthday1);
			//textarea用val()赋值失败
			document.getElementById("up_signature").value=signature1;
		});

		$("#updateUser_btn").click(function() {
			var getid = $("#up_id").val();
			var username = $("#up_username").val();
			var sex=$("#up_sex").val();
			var telephone=$("#up_telephone").val();
			var roleid = $("#up_roleid").val();
			var birthday = $("#up_birthday").val();
			var signature=$("#up_signature").val();
			
			var id = parseInt(getid);
			
		
			
			if (roleid == "管理员") roleid = 1;
			if (roleid == "用户") roleid = 2;
			
		
			
			var data = {
				"id":getid,
				"username":username,
				"sex":sex,
				"telephone":telephone,
				"roleid":roleid,
				"birthday":birthday,
				"signature":signature
			}

			$.ajax({
				url : "<%=path%>/back/usermodify",
				type : 'POST',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					alert("修改数据成功");
					$("#updateModal").modal('hide');
					window.location.reload();
					//window.location.href = "${pageContext.request.contextPath}/user/tologin";
				}
			});

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
			alert("删除用户成功");
			var gid = $("#del_id").val();
			var id = parseInt(gid);
			window.location.href="<%=path%>/back/userdelete?id="+id;
		
		});
		$("#resuser_btn").click(function() {
			alert("恢复用户成功");
			var gid = $("#res_id").val();
			var id = parseInt(gid);
			window.location.href="<%=path%>/back/userres?id="+id;

		});
		
		$("#ins_btn").click(function(){
			var username=$("#ins_username").val();
			var password=$("#ins_password").val();
			var password2=$("#ins_password2").val();
			var sex=$("#ins_sex").val();
			var telephone=$("#ins_telephone").val();
			
			
			var roleid=$("#ins_role").val()=="用户"?2:1;
			
			
			var birthday=$("#ins_birthday").val();
			
			var signature=$("#ins_signature").val();
		//	var signature=document.getElementById("#ins_signature").value;
			
			if(password!=password2){
				alert("两次输入密码不一致，请重新输入");
				return false;
			}
			var data={
				"username":username,
				"password":password,
				"sex":sex,
				"telephone":telephone,
				"roleid":roleid,
				"birthday":birthday,
				"signature":signature
					
			};
			$.ajax({
				url : "<%=path%>/back/userinsert",
				type : 'POST',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					alert("新增用户成功");
					$("#insModal").modal('hide');
					window.location.reload();
					
				}
			});
			
			
			
			
		});
			
		$(document).on("click", ".img-btn", function() {
			var id1 = $(this).parent().parent().children("td").eq(0).text();
			var username1 = $(this).parent().parent().children("td").eq(2).text();
		
			$("#img_id").val(id1);
			$("#img_username").val(username1);
		
			
		});
		
		
	
</script></body>
</html>
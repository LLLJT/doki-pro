<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>词条管理</title>
<%String path=request.getContextPath(); %>
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="<%=path %>/js/back.js"></script>
     <link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=path %>/css/back.css" />
</head>
<body>
<!-- 导航栏 -->
<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="position1">
        <label class="font-type" ><h3>doki后台管理员管理系统</h3></label>
      </div>
      <div class="position1">
        <label class="font-type" ><h3>管理员名称:${username}</h3></label>
      </div>

  <div id="wrapper">
      <!--   <div class="overlay"></div> -->

        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                       目录
                    </a>
                </li>
                <li>
                    <a href="<%=path%>/back/tobackindex"><i class="fa fa-fw fa-home"></i> 主页</a>
                </li>
                <li>
                    <a href="<%=path%>/back/tobackblog"><i class="fa fa-fw fa-folder"></i>博客管理</a>
                </li>
                <li>
                    <a href="<%=path%>/back/tobackblogcheck"><i class="fa fa-fw fa-file-o"></i>博客审核管理</a>
                </li>
                <li>
                    <a href="<%=path%>/back/tobackword"><i class="fa fa-fw fa-cog"></i> 词条管理</a>
                </li>
               
                <li>
                    <a href="<%=path%>/back/tobackwordcheck"><i class="fa fa-fw fa-bank"></i> 词条审核管理</a>
                </li>
                <li>
                    <a href="<%=path%>/back/tobackuser"><i class="fa fa-fw fa-dropbox"></i> 用户管理</a>
                </li>
                <li>
                    <a href="<%=path%>/back/tobackuserrole"><i class="fa fa-fw fa-twitter"></i> 用户角色管理</a>
                </li>
                <li>
                    <a href="<%=path%>/back/logout"><i class="fa fa-fw fa-twitter"></i> 登出</a>
                </li>
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
    
    <!-- //navbar end -->
    <!-- --------------------------------------------------delete模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
						<h4><label  class="col-sm-8 control-label">确认要删除该博客吗？</label></h4>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="deleteblog_btn">确认删除</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------delete的模态框结束位置------------------------------------------------------ -->
	<!-- ---------------------------------------------res模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="resModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">恢复博客</h4>
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
						<h4><label  class="col-sm-8 control-label">确认要恢复该博客吗？</label></h4>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="resblog_btn">确认恢复</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------delete的模态框结束位置------------------------------------------------------ -->
	<!-- ----------------------------------------------//res模态框结束 -->

	<!-- --------------------------------------------------update模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改词条</h4>
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
							<label class="col-sm-2 control-label">词条标题</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="up_wordtitle" name="up_wordtitle" placeholder="请输入博客标题">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">词条内容</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="up_wordcontent" name="up_wordcontent"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="password1" class="col-sm-2 control-label">词条分类</label>
							<div class="col-sm-10">

								<input type="text"  id="up_wordtypeid"  name="up_wordtypeid" placeholder="请输入词条分类"class="form-control border-0 shadow form-control-lg" list="uprolelist">
								<datalist id="uprolelist">
									<option>词条分类1</option>
									<option>词条分类2</option>
									<option>词条分类3</option>
									
								</datalist>


							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">浏览次数</label>
							<div class="col-sm-10">
							<input type="text" disabled="disabled" class="form-control" id="up_count" name="up_blogwatch" >	
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-sm-2 control-label">上传者</label>
							<div class="col-sm-10">
								<input type="text" disabled="disabled" class="form-control" id="up_username" name="up_username" >	
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
	<br><br><br><br><br>
	<h1>词条管理界面</h1>
	<div class="row">
		<div class="col-md-12">
			<ul class="breadcrumb">
				<li><a href="<%=path%>/back/tobackindex">主页</a></li>
				<li><a href="<%=path%>/back/tobackword">词条</a></li>
				<li class="active">词条管理</li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4"></div>

		<div class="col-md-4">
			<form class="form-inline" action="<%=path%>/back/wordsearch">
				<div class="form-group">
					<label for="exampleInputName2">词条标题：</label> 
					<input type="text"  class="form-control" name="wordtitle" id="search_wordtitle" autocomplete="on" placeholder="请输入要查询的博客">
				</div>
				<button type="submit" class="btn btn-default" id="search_btn">查询词条</button>
			</form>
		</div>
		<div class="col-md-4"> </div>
	<div class="col-md-2"> </div>
		<div class="col-md-2">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insmodal">添加词条</button>

			<!-- --------------------------------------新增模态框-------------------------------------- -->
			<div class="modal fade" id="insmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">新建词条</h4>
						</div>
						<form class="form-horizontal" id="saveList" action="" method="post">
						<div class="modal-body">
							
								<div class="form-group">
									<label class="col-sm-2 control-label">词条标题</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="ins_wordtitle" name="wordtitle">
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">词条内容</label>
									<div class="col-sm-10">
										<textarea class="form-control" rows="6" id="ins_wordcontent" name="wordcontent"></textarea>
									</div>
								</div>
								<div class="form-group">
							<label  class="col-sm-2 control-label">词条标题1</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ins_title1" name="title1">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">词条内容1</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="ins_content1" name="content1"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-sm-2 control-label">词条标题2</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ins_title2" name="title2">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">词条内容2</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="ins_content2" name="content2"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-sm-2 control-label">词条标题3</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ins_title3" name="title3">	
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">词条内容3</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="ins_content3" name="content3"></textarea>
							</div>
						</div>
								<div class="form-group">
									<label for="password1" class="col-sm-2 control-label">选择博客分类</label>
									<div class="col-sm-10">

										<input type="text" id="ins_typeid" name="ins_typeid" placeholder="输入词条分类" class="form-control border-0 shadow form-control-lg" list="typelist">
										<datalist id="typelist">
											<option>1</option>
											<option>2</option>
											<option>3</option>
										
										</datalist>

									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-2 control-label">上传者</label>
									<div class="col-sm-10">
										<label  id="username">${username}</label>
										<input type="text" hidden="true" id="ins_userid" name="ins_userid" value="${userid }">
									</div>
								</div>
								
							
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" id="create_btn">创建词条</button>
							
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
					<th>词条标题</th>
					<th>词条内容</th>
					<th>词条分类</th>
					<th>词条浏览次数</th>
					<th>上传者</th>
					<th>审核状况</th>
					<th>词条操作</th>
					<th></th>
				</tr>
				<c:forEach items="${hotwordlist.list}" var="hotword">
					<tr>
						<td>${hotword.id}</td>
						<td>${hotword.wordtitle }</td>
						<td width="25%">${hotword.wordcontent }</td>
						<td>${hotword.typename }</td>
						<td>${hotword.count }</td>
						<td>${hotword.username }</td>
						<td>
						<c:if test="${hotword.checkflag==1 }">
						<button type="button" class="btn btn-success">审核通过</button>
						</c:if>
						<c:if test="${hotword.checkflag==0 }">
						<button type="button" class="btn btn-danger">审核未通过</button>
						</c:if>
						
						
						</td>
						
						<td>
							

							<button type="button" class="btn btn-primary edit_btn"
								id="update_btn" data-toggle="modal" data-target="#updateModal">编辑</button>

						</td>

						<td>
						
					
						<c:if test="${hotword.delFlag==1 }">
						<button type="button" class="btn btn-danger del_btn" name="${hotword.id }" id="del_btn" data-toggle="modal" data-target="#deleteModal">删除</button>
						</c:if>
						<c:if test="${hotword.delFlag==0 }">
						<button type="button" class="btn btn-success res_btn" name="${hotword.id }" id="res_btn" data-toggle="modal" data-target="#resModal">恢复</button>
						</c:if>
						
						
						</td>
					</tr>
				</c:forEach>

			</table>

		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-4">当前页数:${hotwordlist.pageNum}页,总页数:${hotwordlist.pages}页，总条数:${hotwordlist.total}条</div>
		<div class="col-md-4">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a id="indexpage" href="#" aria-label="Previous">首页 </a></li>

					<c:if test="${hotwordlist.hasPreviousPage}">
						<li><a id="prepage" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:if test="${!hotwordlist.hasPreviousPage }">
						<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<!-- 导航 -->
					<c:forEach items="${hotwordlist.navigatepageNums}" var="pNum">
						<c:if test="${pNum==hotwordlist.pageNum}">
							<li class="active"><a href="#">${pNum}</a></li>
						</c:if>
						<c:if test="${pNum!=hotwordlist.pageNum}">
							<li><a id="navpage" name="${pNum }" href="<%=path%>/back/wordsearch?wordtitle=&pn=${pNum }">${pNum}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${hotwordlist.hasNextPage }">
						<li><a id="nextpage" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					
					<c:if test="${!hotwordlist.hasNextPage }">
						<li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span> </a></li>
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
		
		
		
		var pnum='${hotwordlist.pageNum}';
		var prenum='${hotwordlist.pageNum-1}';
		var nexnum='${hotwordlist.pageNum+1}';
		var pn='${hotwordlist.pages}';
		var gettitle=$("#search_wordtitle").val();
		
		var indexpn="<%=path%>/back/wordsearch?wordtitle="+gettitle+"&pn=1";
		var prepn="<%=path%>/back/wordsearch?wordtitle="+gettitle+"&pn="+prenum;
		var nextpn="<%=path%>/back/wordsearch?wordtitle="+gettitle+"&pn="+nexnum;
		
		
	<%-- 	var navpn="<%=path%>/back/blogsearch?wordtitle="+gettitle+"&pn="+navpage; --%>
		
		var endpn="<%=path%>/back/wordsearch?wordtitle="+gettitle+"&pn="+pn;
		
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
			
			var wordtitle1 = $(this).parent().parent().children("td").eq(1).text();
			var wordcontent1 = $(this).parent().parent().children("td").eq(2).text();
			var wordtypename1 = $(this).parent().parent().children("td").eq(3).text();
			var wordwatch1=$(this).parent().parent().children("td").eq(4).text();
			var wordusername=$(this).parent().parent().children("td").eq(5).text();
			//将取到的值分别赋给updateModal里的字段
			
			
			$("#up_id").val(id1);
			$("#up_wordtitle").val(wordtitle1);
			//$("#up_blogcontent").val(blogcontent1);
			
			$("#updateModal input[name=up_wordtypeid]").val(wordtypename1);
			$("#up_count").val(wordwatch1);
			$("#up_username").val(wordusername);
			//textarea用val()赋值失败
			document.getElementById("up_wordcontent").value = wordcontent1;
		});
//修改词条按钮
		$("#updateUser_btn").click(function() {
		var id=$("#up_id").val();
		var wordtitle=$("#up_wordtitle").val();
		var wordcontent=document.getElementById("up_wordcontent").value;
		var wordtype=$("#up_wordtypeid").val();
		var username=$("#up_username").val();
		var data={"id":id,"wordtitle":wordtitle,"wordcontent":wordcontent,"typename":wordtype,"username":username};

		$.ajax({
			url:"<%=path%>/back/updateword",
			type : 'POST',
			data : JSON.stringify(data),
			contentType : 'application/json',
			success : function() {
				alert("词条修改成功");
				$("#deleteModal").modal('hide');
				 window.location.reload();
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
		

		$("#deleteblog_btn").click(function() {
			var gid = $("#del_id").val();
			var id = parseInt(gid);
			var data = {
				"id" : id
			}
			

			$.ajax({
				url : "<%=path%>/back/worddelete",
				type : 'POST',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					alert("词条成功删除");
					$("#deleteModal").modal('hide');
					 window.location.reload();
				}

			});

		});
		$("#resblog_btn").click(function() {
			var gid = $("#res_id").val();
			var id = parseInt(gid);
			var data = {
				"id" : id
			}
			

			$.ajax({
				url : "<%=path%>/back/wordres",
				type : 'POST',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					alert("词条成功恢复");
					$("#resModal").modal('hide');
					 window.location.reload();
				}

			});

		});
$("#create_btn").click(function(){
	var wordtitle=$("#ins_wordtitle").val();
	var wordcontent=$("#ins_wordcontent").val();
	var userid=$("#ins_userid").val();
	var typeid=$("#ins_typeid").val();
	var title1=$("#ins_title1").val();
	var content1=document.getElementById("ins_content1").value; 
	var title2=$("#ins_title2").val();
	var content2=document.getElementById("ins_content2").value; 
	var title3=$("#ins_title3").val();
	var content3=document.getElementById("ins_content3").value; 
	//alert(wordtitle+wordcontent+userid+typeid+title1+content1+title2+content2+title3+content3);
	var id=parseInt(userid);
	var data={
			"wordtitle":wordtitle,
			"wordcontent":wordcontent,
			"userid":id,
			"typeid":parseInt(typeid),
			"title1":title1,
			"content1":content1,
			"title2":title2,
			"content2":content2,
			"title3":title3,
			"content3":content3,
	};
	alert(JSON.stringify(data));
	$.ajax({
		url : "<%=path%>/back/wordinsert",
		type : 'POST',
		data : JSON.stringify(data),
		contentType : 'application/json',
		success : function() {
			alert("成功新增词条");
			$("#insModal").modal('hide');
			 window.location.reload();
		}

	});
	
	
});
			
	</script>
     
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>
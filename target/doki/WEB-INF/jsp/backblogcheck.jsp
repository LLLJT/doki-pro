<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>博客审核管理</title>
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
    <!-- --------------------------------------------------checkModal模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">审核博客</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="deleteList">
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control" id="check_id" name="id">
								<input type="hidden" class="form-control" id="check_blogtitle" name="id">
								<input type="hidden" class="form-control" id="check_userid" name="id">
							</div>
						</div>
						<div class="form-group">
						<h4><label  class="col-sm-8 control-label">请选择是否审核通过该博客</label></h4>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="pass_btn">通过</button>
					<button type="button" class="btn btn-primary" id="reason_btn" data-toggle="modal" data-target="#reasonModal">不通过</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------check的模态框结束位置------------------------------------------------------ -->
	<!-- --------------------------------------------------reasonModal模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="reasonModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">请说明原因</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="deleteList">
						<div class="form-group">
							<label class="col-sm-2 control-label">原因：</label>
							<div class="col-sm-10">
								<textarea rows="5" cols="60" id="reason"></textarea>
							</div>
						</div>
						
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="fail_btn">提交</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------check的模态框结束位置------------------------------------------------------ -->
	
	
	
	

	<!-- --------------------------------------------------update模态框,用于获取详细信息------------------------------------------------------------------- -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">博客详细信息</h4>
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
							<label class="col-sm-2 control-label">博客标题</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="up_blogtitle" name="up_blogtitle" placeholder="请输入博客标题">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">博客内容</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="up_blogcontent" name="up_blogcontent"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="password1" class="col-sm-2 control-label">博客分类</label>
							<div class="col-sm-10">

								<input type="text"  id="up_blogtypeid"  name="up_blogtypeid" placeholder="请输入博客分类"class="form-control border-0 shadow form-control-lg" list="uprolelist">
								<datalist id="uprolelist">
									<option>游戏</option>
									<option>生活</option>
									
								</datalist>


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
					
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------update的模态框结束位置------------------------------------------------------ -->
	<br><br><br><br><br>
	<h1>博客管理界面</h1>
	<div class="row">
		<div class="col-md-12">
			<ul class="breadcrumb">
				<li><a href="<%=path%>/back/tobackindex">主页</a></li>
				<li><a href="<%=path%>/back/tobackblog">博客</a></li>
				<li class="active">博客管理</li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4"></div>

		<div class="col-md-4">
			<form class="form-inline" action="<%=path%>/back/blogchecksearch">
				<div class="form-group">
					<label for="exampleInputName2">博文标题：</label> 
					<input type="text"  class="form-control" name="blogtitle" id="search_blogtitle" autocomplete="on" placeholder="请输入要查询的博客">
				</div>
				<button type="submit" class="btn btn-default" id="search_btn">查询博客</button>
			</form>
		</div>
		<div class="col-md-4"> </div>
	<div class="col-md-2"> </div>
		<div class="col-md-2">
		

			

		</div>
	</div>


	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table">
				<tr>
					<th>序号</th>
					<th>博客标题</th>
					<th>博客内容</th>
					<th>博客分类</th>
					<th>上传者</th>
					<th>审核操作</th>
					<th>详细信息</th>
				
				</tr>
				<c:forEach items="${blogchecklist.list}" var="blog">
					<tr>
						<td>${blog.id}</td>
						<td>${blog.blogtitle }</td>
						<td>${blog.blogcontent }</td>
						<td >${blog.blogtypeid }</td>
						<td hidden="true">${blog.userid }</td>
						<td>${blog.username }</td>
						<td>
						<c:if test="${blog.checkFlag==1 }">
						<button type="button" class="btn btn-success">通过</button>
						</c:if>
						<c:if test="${blog.checkFlag==0 }">
						<button type="button" class="btn btn-danger check_btn" id="check_btn" data-toggle="modal" data-target="#checkModal">未通过</button>
						</c:if>
						
						
						</td>
						
						<td>
							

							<button type="button" class="btn btn-primary edit_btn"
								id="update_btn" data-toggle="modal" data-target="#updateModal">详细信息</button>

						</td>
					

						
					</tr>
				</c:forEach>

			</table>

		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-4">当前页数:${blogchecklist.pageNum}页,总页数:${blogchecklist.pages}页，总条数:${blogchecklist.total}条</div>
		<div class="col-md-4">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a id="indexpage" href="#" aria-label="Previous">首页 </a></li>

					<c:if test="${blogchecklist.hasPreviousPage}">
						<li><a id="prepage" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:if test="${!blogchecklist.hasPreviousPage }">
						<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<!-- 导航 -->
					<c:forEach items="${blogchecklist.navigatepageNums}" var="pNum">
						<c:if test="${pNum==blogchecklist.pageNum}">
							<li class="active"><a href="#">${pNum}</a></li>
						</c:if>
						<c:if test="${pNum!=blogchecklist.pageNum}">
							<li><a id="navpage" name="${pNum }" href="<%=path%>/back/blogchecksearch?blogtitle=&pn=${pNum }">${pNum}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${blogchecklist.hasNextPage }">
						<li><a id="nextpage" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					
					<c:if test="${!blogchecklist.hasNextPage }">
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
		
		
		
		var pnum='${blogchecklist.pageNum}';
		var prenum='${blogchecklist.pageNum-1}';
		var nexnum='${blogchecklist.pageNum+1}';
		var pn='${blogchecklist.pages}';
		var gettitle=$("#search_blogtitle").val();
		var indexpn="<%=path%>/back/blogchecksearch?blogtitle="+gettitle+"&pn=1";
		var prepn="<%=path%>/back/blogchecksearch?blogtitle="+gettitle+"&pn="+prenum;
		var nextpn="<%=path%>/back/blogchecksearch?blogtitle="+gettitle+"&pn="+nexnum;
		
		
	<%-- 	var navpn="<%=path%>/back/blogsearch?blogtitle="+gettitle+"&pn="+navpage; --%>
		
		var endpn="<%=path%>/back/blogchecksearch?blogtitle="+gettitle+"&pn="+pn;
		
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

		

		//赋值操作
		$(document).on("click", ".edit_btn", function() {
			//修改框中用户信息回显
			
			var id1 = $(this).parent().parent().children("td").eq(0).text();
			//将id的值传递给修改按钮的属性，方便发送Ajax请求
			$("#updateUser_btn").attr("edit-id", id1);
			
			var blogtitle1 = $(this).parent().parent().children("td").eq(1).text();
			var blogcontent1 = $(this).parent().parent().children("td").eq(2).text();
			var blogtypeid1 = $(this).parent().parent().children("td").eq(3).text();
			
			var bloguploader=$(this).parent().parent().children("td").eq(4).text();
			//将取到的值分别赋给updateModal里的字段
	
			var blogtypeid2='';
			if(blogtypeid1=1)blogtypeid2='游戏';
				if(blogtypeid1=2)blogtypeid2='生活';
				if(blogtypeid1=3)blogtypeid2='水类';
				if(blogtypeid1=4)blogtypeid2='讨论类';
				if(blogtypeid1=2)blogtypeid2='真爱类';
			
			$("#up_id").val(id1);
			$("#up_blogtitle").val(blogtitle1);
			//$("#up_blogcontent").val(blogcontent1);
			
			$("#updateModal input[name=up_blogtypeid]").val(blogtypeid2);
		
			$("#up_username").val(bloguploader);
			//textarea用val()赋值失败
			document.getElementById("up_blogcontent").value = blogcontent1;
		});

		
		$(document).on("click", ".check_btn", function(){
			var id1 = $(this).parent().parent().children("td").eq(0).text();
			var blogtitle1=$(this).parent().parent().children("td").eq(1).text();
			var userid1=$(this).parent().parent().children("td").eq(4).text();
			
			$("#check_id").val(id1);
			$("#check_blogtitle").val(blogtitle1);
			$("#check_userid").val(userid1);
		}
				
		);
		
		
		
		$("#pass_btn").click(function(){
			
			
			
			var getid=$("#check_id").val();
			var getblogtitle=$("#check_blogtitle").val();
			var getusername=$("#check_userid").val();
			
			window.location.href="<%=path%>/back/blogsuccess?id="+getid+"&blogtitle="+getblogtitle+"&userid="+getusername;
			alert("审核通过!已将结果发布给用户！");
			
		});
		
		$("#fail_btn").click(function(){
			alert("审核不通过！已将结果发布给用户！");
			var getid=$("#check_id").val();
			var getblogtitle=$("#check_blogtitle").val();
			var getusername=$("#check_userid").val();
			var reason=$("#reason").val();
	
			 window.location.href="<%=path%>/back/blogfail?id="+getid+"&blogtitle="+getblogtitle+"&userid="+getusername+"&reason="+reason;
			
		});

			
	</script>
     
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>
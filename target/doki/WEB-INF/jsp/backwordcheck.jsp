<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>词条审核管理</title>
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
   
	

	 <!-- --------------------------------------------------checkModal1模态框,待新建------------------------------------------------------------------- -->
	<div class="modal fade" id="checkModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">审核新建词条</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="deleteList">
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control" id="check_id1" name="id">
								<input type="hidden" class="form-control" id="check_wordtitle1">
								<input type="hidden" class="form-control" id="check_userid1" name="id">
							</div>
						</div>
						<div class="form-group">
						<h4><label  class="col-sm-8 control-label">请选择是否审核通过该博客</label></h4>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="pass_btn1">通过</button>
					<button type="button" class="btn btn-primary" id="reason_btn" data-toggle="modal" data-target="#reasonModal1">不通过</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------check的模态框结束位置------------------------------------------------------ -->
	 <!-- --------------------------------------------------checkModal2模态框,待更新------------------------------------------------------------------- -->
	<div class="modal fade" id="checkModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">审核更新词条</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="deleteList">
						<div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<input type="hidden" class="form-control" id="check_id2" name="id">
								<input type="hidden" class="form-control" id="check_wordtitle2">
								<input type="hidden" class="form-control" id="check_userid2" name="id">
							</div>
						</div>
						<div class="form-group">
						<h4><label  class="col-sm-8 control-label">请选择是否审核通过该博客</label></h4>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="pass_btn2">通过</button>
					<button type="button" class="btn btn-primary" id="reason_btn" data-toggle="modal" data-target="#reasonModal2">不通过</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------check的模态框结束位置------------------------------------------------------ -->
	<!-- --------------------------------------------------reasonModal1模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="reasonModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
								<textarea rows="5" cols="60" id="reason1"></textarea>
							</div>
						</div>
						
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="fail_btn1">提交</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------check的模态框结束位置------------------------------------------------------ -->
	<!-- --------------------------------------------------reasonModal2模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="reasonModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
								<textarea rows="5" cols="60" id="reason2"></textarea>
							</div>
						</div>
						
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="fail_btn2">提交</button>
				</div>
			</div>

		</div>
	</div>
	<!-- --------------------------------------------check的模态框结束位置------------------------------------------------------ -->
	
	
	
	<!-- --------------------------------------------------update模态框------------------------------------------------------------------- -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">详细信息</h4>
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
								<input type="text" class="form-control" id="up_title" name="up_title1">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">词条内容</label>
							<div class="col-sm-10">
								<textarea disabled="disabled" class="form-control" rows="6" id="up_wordcontent" name="up_blogcontent"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">词条标题1</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="up_title1" name="up_title1">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">词条内容1</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="up_content1" name="up_content1"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-sm-2 control-label">词条标题2</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="up_title2" name="up_title2">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">词条内容2</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="up_content2" name="up_content2"></textarea>
							</div>
						</div>
						<div class="form-group">
						<label class="col-sm-2 control-label">词条标题3</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="up_title3" name="up_title3">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">词条内容3</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="up_content3" name="up_content3"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-sm-2 control-label">要更新的词条标题</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="up_uptitle" name="up_uptitle"></textarea>	
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">要更新的词条内容</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="6" id="up_upcontent" name="up_upcontent"></textarea>
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
				<li class="active">词条审核管理</li>
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
		<div class="col-md-8"> </div>
	
	</div>


	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table">
				<tr>
					<th>序号</th>
					<th>词条标题</th>
					<th width="25%">词条内容</th>
					<th>词条分类</th>
					<th hidden="true"></th>
					<th>上传者</th>
					
					<th>审核状态</th>
					<th>详细信息</th>
					<th>待更新/待新建</th>
					<th hidden="true">词条标题1</th>
					<th hidden="true">词条内容1</th>
					<th hidden="true">词条标题2</th>
					<th hidden="true">词条内容2</th>
					<th hidden="true">词条标题3</th>
					<th hidden="true">词条内容3</th>
					
				</tr>
				<c:forEach items="${hotwordchecklist.list}" var="hotword">
					<tr>
						<td>${hotword.id}</td>
						<td>${hotword.wordtitle }</td>
						<td>${hotword.wordcontent }</td>
						<td>${hotword.typename }</td>
						<td hidden="true">${hotword.userid }</td>
						<td>${hotword.username }</td>
						
						<td>
						
						<button type="button" class="btn btn-danger">未通过</button>
						
						
						
						</td>
						
						<td>
							

							<button type="button" class="btn btn-primary edit_btn"
								id="update_btn" data-toggle="modal" data-target="#updateModal">详细信息</button>

						</td>
						<td>
						<c:if test="${hotword.checkflag==0 and hotword.upcontent==null }">
						<button type="button" class="btn btn-success check_btn" data-toggle="modal" data-target="#checkModal1">待新建</button>
						</c:if>
						<c:if test="${hotword.upcontent!=null}">
						<button type="button" class="btn btn-success check_btn" data-toggle="modal" data-target="#checkModal2">待更新</button>
						</c:if>
						
						</td>
						<td hidden="true">${hotword.title1 }</td>
						<td hidden="true">${hotword.content1 }</td>
						<td hidden="true">${hotword.title2 }</td>
						<td hidden="true">${hotword.content2 }</td>
						<td hidden="true">${hotword.title3 }</td>
						<td hidden="true">${hotword.content3 }</td>
						<td hidden="true">${hotword.uptitle }</td>
						<td hidden="true">${hotword.upcontent }</td>
						
					</tr>
				</c:forEach>

			</table>

		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-4">当前页数:${hotwordchecklist.pageNum}页,总页数:${hotwordchecklist.pages}页，总条数:${hotwordchecklist.total}条</div>
		<div class="col-md-4">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a id="indexpage" href="#" aria-label="Previous">首页 </a></li>

					<c:if test="${hotwordchecklist.hasPreviousPage}">
						<li><a id="prepage" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:if test="${!hotwordchecklist.hasPreviousPage }">
						<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<!-- 导航 -->
					<c:forEach items="${hotwordchecklist.navigatepageNums}" var="pNum">
						<c:if test="${pNum==hotwordchecklist.pageNum}">
							<li class="active"><a href="#">${pNum}</a></li>
						</c:if>
						<c:if test="${pNum!=hotwordchecklist.pageNum}">
							<li><a id="navpage" name="${pNum }" href="<%=path%>/back/wordsearch?blogtitle=&pn=${pNum }">${pNum}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${hotwordchecklist.hasNextPage }">
						<li><a id="nextpage" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					
					<c:if test="${!hotwordchecklist.hasNextPage }">
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
		
		
	
		var pnum='${hotwordchecklist.pageNum}';
		var prenum='${hotwordchecklist.pageNum-1}';
		var nexnum='${hotwordchecklist.pageNum+1}';
		var pn='${hotwordchecklist.pages}';
		var gettitle=$("#search_blogtitle").val();
		var indexpn="<%=path%>/back/wordsearch?blogtitle="+gettitle+"&pn=1";
		var prepn="<%=path%>/back/wordsearch?blogtitle="+gettitle+"&pn="+prenum;
		var nextpn="<%=path%>/back/wordsearch?blogtitle="+gettitle+"&pn="+nexnum;
		
		
	<%-- 	var navpn="<%=path%>/back/blogsearch?blogtitle="+gettitle+"&pn="+navpage; --%>
		
		var endpn="<%=path%>/back/wordsearch?blogtitle="+gettitle+"&pn="+pn;
		
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
			
			var wordtitle = $(this).parent().parent().children("td").eq(1).text();
			var wordcontent1 = $(this).parent().parent().children("td").eq(2).text();
			var wordtypename1 = $(this).parent().parent().children("td").eq(3).text();
			var wordwatch1=$(this).parent().parent().children("td").eq(4).text();
			var wordusername=$(this).parent().parent().children("td").eq(5).text();
			var title1=$(this).parent().parent().children("td").eq(9).text();
			var content1=$(this).parent().parent().children("td").eq(10).text();
			var title2=$(this).parent().parent().children("td").eq(11).text();
			var content2=$(this).parent().parent().children("td").eq(12).text();
			var title3=$(this).parent().parent().children("td").eq(13).text();
			var content3=$(this).parent().parent().children("td").eq(14).text();
			var uptitle=$(this).parent().parent().children("td").eq(15).text();
			var upcontent=$(this).parent().parent().children("td").eq(16).text();
			//将取到的值分别赋给updateModal里的字段
			
			
			$("#up_id").val(id1);
			$("#up_title").val(wordtitle);
			//$("#up_blogcontent").val(blogcontent1);
			
			$("#updateModal input[name=up_wordtypeid]").val(wordtypename1);
			$("#up_count").val(wordwatch1);
			$("#up_username").val(wordusername);
			//textarea用val()赋值失败
			document.getElementById("up_wordcontent").value = wordcontent1;
			
			$("#up_title1").val(title1);
			document.getElementById("up_content1").value =content1;
			$("#up_title2").val(title2);
			document.getElementById("up_content2").value =content1;
			$("#up_title3").val(title3);
			document.getElementById("up_content3").value =content1;
			$("#up_uptitle").val(uptitle);
			document.getElementById("up_upcontent").value =upcontent;
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
		$(document).on("click", ".check_btn", function(){
			
			var id1 = $(this).parent().parent().children("td").eq(0).text();
			var blogtitle1=$(this).parent().parent().children("td").eq(1).text();
			var userid1=$(this).parent().parent().children("td").eq(4).text();
			
			$("#check_id1").val(id1);
			$("#check_blogtitle1").val(blogtitle1);
			$("#check_userid1").val(userid1);
			$("#check_id2").val(id1);
			$("#check_blogtitle2").val(blogtitle1);
			$("#check_userid2").val(userid1);
		}
				
		);
		
		
		//新建成功
		$("#pass_btn1").click(function(){
			
			
			alert("审核通过!已将结果发布给用户！");
			var getid=$("#check_id1").val();
			var id=parseInt(getid);
			var getblogtitle=$("#check_wordtitle1").val();
			var getuserid=$("#check_userid1").val();
			
			window.location.href="<%=path%>/back/hotwordinsertjudge?id="+getid+"&passflag=1&reason=";
			
			
		});
		//更新词条成功
		$("#pass_btn2").click(function(){
			
			
			alert("审核通过!已将结果发布给用户！");
			var getid=$("#check_id2").val();
			var getblogtitle=$("#check_wordtitle2").val();
			var getusername=$("#check_userid2").val();
			var uptitle=document.getElementById("up_uptitle").value;
			var upcontent=document.getElementById("up_upcontent").value;
		
			window.location.href="<%=path%>/back/hotwordupjudge?id="+getid+"&passflag=1&reason=&uptitle="+uptitle+"&upcontent="+upcontent;
			
			
		});
		
		
		//新建失败
		$("#fail_btn1").click(function(){
			alert("审核不通过！已将结果发布给用户！");
			var getid=$("#check_id1").val();
			var getblogtitle=$("#check_blogtitle1").val();
			var getusername=$("#check_userid1").val();
			var reason=$("#reason1").val();
			
			 window.location.href="<%=path%>/back/hotwordinsertjudge?id="+getid+"&passflag=0&reason="+reason;
			
		});
		//更新失败
		$("#fail_btn2").click(function(){
			alert("审核不通过！已将结果发布给用户！");
			var getid=$("#check_id2").val();
			var getblogtitle=$("#check_blogtitle2").val();
			var getusername=$("#check_userid2").val();
			var reason=$("#reason2").val();
			
			 window.location.href="<%=path%>/back/hotwordupjudge?id="+getid+"&passflag=0&uptitle=&upcontent=&reason="+reason;
			
		});
			
	</script>
     
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>
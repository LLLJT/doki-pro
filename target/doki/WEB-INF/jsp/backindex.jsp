<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>滑动菜单</title>  
<%String path=request.getContextPath(); %>
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="F:/tools/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>  
   
     <link rel="stylesheet" href="<%=path %>/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=path %>/css/back.css" />
    <!-- echarts 4.7.0 -->
    <script src="<%=path %>/js/echarts.min.js"></script>
     
</head>
  
<body >
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
                                 <!-- //nav end  -->
    <div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-8"> 
  
 
</ol>
  <br><br><br><br><br><br>
  <h1>欢迎进入后台管理系统</h1>
  <div class="row">
  <div class="col-md-4">
 <div class="panel panel-default">
  <div class="panel-body">
<h4> 帖子数:${blogcount }

</h4>
  </div></div>
  </div>
  <div class="col-md-4">
   <div class="panel panel-default">
  <div class="panel-body">
 <h4>词条数:${wordcount }</h4>
  </div></div>
  </div>
  <div class="col-md-4">
  <div class="panel panel-default">
  <div class="panel-body">
<h4> 总浏览数:${sumbrouse }</h4>
  </div></div></div>
</div>
  <div class="panel panel-default">
  <div class="panel-body">
  <div id="main" style="width:800px;height:600px"></div> 
  </div>
</div>
  
  
  
</div>
  
</div>
  
    
    <script src="<%=path %>/js/back.js"></script>
    <script type="text/javascript">
    
    
    
    var myChart = echarts.init(document.getElementById('main'));
   var option = {
    	    series: [{
    	        type: 'treemap',
    	        data: [
    	        {
    	            name: '用户角色管理',            // Second tree
    	            value: 10
    	            
    	        },
    	        {
    	            name: '用户管理',            // Second tree
    	            value: 10
    	            
    	        },
    	        {
    	            name: '博客管理',            // Second tree
    	            value: 10
    	            
    	        },
    	        {
    	            name: '博客审核管理',            // Second tree
    	            value: 10
    	            
    	        },
    	        {
    	            name: '词条管理',            // Second tree
    	            value: 10
    	            
    	        },
    	        {
    	            name: '词条审核管理',            // Second tree
    	            value: 10
    	            
    	        },
    	        {
    	            name: '主页',            // Second tree
    	            value: 20
    	            
    	        }]
    	    }]
    	};
   myChart.setOption(option);
   myChart.on('click',function(params){
	   //中转英文
	   var page=params.name;
	   
	   var topage='';
	   if(page=='主页')topage='tobackindex';
	   if(page=='用户管理')topage='tobackuser';
	   if(page=='用户角色管理')topage='tobackuserrole';
	   if(page=='词条审核管理')topage='tobackwordcheck';
	   if(page=='词条管理')topage='tobackword';
	   if(page=='博客管理')topage='tobackblog';
	   if(page=='博客审核管理')topage='tobackblogcheck';
	    const path='<%=path%>/back/'+topage; 
	  // alert("进入"+page+"页面");
	   window.location.href=path;
   })
  
   
   
    </script>
</body>

  
</html>
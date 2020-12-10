<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<%
	String path = request.getContextPath();
%>
		<meta charset="utf-8">
		<link rel="stylesheet" href="<%=path %>/css/re.css" />
		<link rel="stylesheet" href="<%=path %>/css/startededit.css" />
		<title>编辑入门</title>
	</head>
	<body>
		<div class="top">
			<div class="topnb">
				<center>
					<ul>
						<img src="<%=path %>/images/logo1.png">
						<li><a href="<%=path%>/user/toindex">首页</a></li>
						<li><a href="<%=path%>/user/toclassify">分类</a></li>
						
						<li><a href="<%=path%>/user/toabout">关于doki百科</a></li>
						<li><a href="${pageContext.request.contextPath}/blog/getAll">用户论坛</a></li>
						<form>
							<input type="text" style="padding-left:10px;color: #999;" value="搜索doki百科" class="search" onFocus="if(value==defaultValue)
					{value='';this.style.color='#000'}"
							 onBlur="if(!value){value=defaultValue;this.style.color='#999'}" />
						</form>
						<li><button type="button">搜索</button></li>
						<li><a href="doki.html">搜索历史</a></li>
						<span><a href="doki.html">登录</a></span>
					</ul>
			</div>
			<center>
		</div>
		<div class="block">
			<div class="name">编辑入门</div>
			<div class="title1">
				<span>1.发现问题，编辑词条
					<HR align=center width=600px color=#000000 SIZE=1></span>
				<p>如果你发现doki百科的词条内容不正确或者不全面，你可以动手改正它
					<br>点击词条名旁边的“编辑”开始编辑词条
					<br>如果发现doki百科没有收录你关心的词条，你可以创建新词条；
					<br>如果doki百科已经收录了同名的其他义项，你可以点击义项选择区的“添加义项”
				</p>
			</div>
			<div class="title2">
				<span>2.增删内容，修正错误
					<HR align=center width=600px color=#000000 SIZE=1></span>
				<p>你可以改正词条里的错别字，补充新资料或者删除冗余的内容
					<br>词条里可以添加图片、表格、地图等等丰富的内容
					<br>记得给新添加的内容附上参考资料哦</p>
			</div>
			<div class="title3">
				<span>3.提交词条，等待审核
					<HR align=center width=600px color=#000000 SIZE=1></span>
				<p>如果你已经编辑完了，确认没问题的话就点“提交”吧
				<br>你的词条版本提交之后，需要等待一段时间，系统会进行检查</p>
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
	</body>
</html>

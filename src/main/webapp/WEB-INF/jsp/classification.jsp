<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
	<%
	String path = request.getContextPath();
%>
		<meta charset="utf-8">
		<link rel="stylesheet" href="<%=path %>/css/re.css" />
		<link rel="stylesheet" href="<%=path %>/css/classification.css" />
		<title>分类</title>
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
						<li><a href="#">搜索历史</a></li>
						<span><a href="${pageContext.request.contextPath}/user/logout">登出</a></span>
					</ul>
			</div>
			<center>
		</div>
		<div class="block">
			<div class="title1">
				<span>视频势/直播势</span>
				<div class="block1">&nbsp&nbsp&nbsp&nbsp依据主要投稿类型，可将虚拟UP主分为视频势、直播势和歌势。
					视频势、直播势和歌势之间并没有十分严格的区分，
					视频势、歌势有时也会进行直播，直播势也会投稿视频。</div>
				<div class="block2"><b>&nbsp视频势：</b>猫宫日向、绊爱、七濑胡桃、织田信姬、琴吹梦、麻倉由衣、華香院つばき、天羽よつは、名取さな、鈴木ヒナ

					<br><b>&nbsp直播势：</b>白上吹雪、　时乃空、　百鬼あやめ、夏色祭、凑阿库娅、紫咲シオン、静凛、轟京子、樋口楓

					<br><b>&nbsp歌势：</b>星街彗星、天音彼方、花丸晴琉、童天明治、角卷绵芽、本間ひまわり、　大神ミオ、　大空スバル

				</div>
			</div>
			<div class="title2">
				<span>个人势/企业势</span>
				<div class="block3">&nbsp&nbsp&nbsp&nbsp依据所属团体，可将虚拟UP主分为个人势、企业势和社团势。
					个人势、企业势与社团势之间也没有十分严格的区分，
					随着虚拟UP主签约、解约或其它复杂的人事调动，一位虚拟UP主的从属关系可能会改变。</div>
				<div class="block4"><b>&nbsp个人势：</b>星街彗星、天音彼方、花丸晴琉、童天明治、角卷绵芽、本間ひまわり、　大神ミオ、　大空スバル

					<br><b>&nbsp企业势：</b>时乃空、萝卜子、樱巫女、星街彗星、夜空梅露、亚绮·罗森塔尔、赤井心、白上吹雪、夏色祭、凑阿库娅

					<br><b>&nbsp社团势：</b>紫咲シオン、因幡はねる、宇森ひなこ、　宗谷いちか、華香院つばき、天羽よつは、名取さな、鈴木ヒ

				</div>
			</div>
			<div class="title3">
				<span>转生势/非转生势</span>
				<div class="block5">&nbsp&nbsp&nbsp&nbsp依据形象来源，可将虚拟UP主分为转生势和非转生势。</div>
				<div class="block6"><b>&nbsp转生势：</b>神殿レイラ、北上双葉、もこ田めめめ、夜桜たま、赤羽葉子、静凛、　でびでび・でびる
					<br><b>&nbsp非转生势：</b>香织子鞠、未来明、神殿レイラ、北上双葉、もこ田めめめ、夜桜たま、赤羽葉子</div>
			</div>
			<div class="explain">
				<span>分类解释</span>
				<div class="block7">
					<b>&nbsp视频势：</b>指以视频投稿为主要活动的虚拟UP主。
					<br><b>&nbsp直播势：</b>指以直播为主要活动的虚拟UP主，彩虹社及IRIAM等直播势团体旗下艺人往往称为虚拟主播（Virtual Liver）。
					<br><b>&nbsp歌势：</b>以MV投稿、歌唱直播为主进行活动的VTuber，亦可称为虚拟歌手（Virtual Singer）。
					<br><b>&nbsp个人势：</b>指一个人单独进行策划、视频制作、直播等活动的虚拟UP主。
					<br><b>&nbsp企业势：</b>背靠企业/事务所，相比于个人势，能获得公司的技术支持，资源分配等支援，同时也能在出道时获得更多的曝光度。
					<br><b>&nbsp社团势：</b>介于个人势和企业势之间的存在，所在的团体不是企业，而是由虚拟UP主相关同好组成的。
					<br><b>&nbsp转生势：</b>指使用原本在媒体平台上开展其它活动的账号出道、或将原本的虚拟形象制作成Live2D模型或3D模型、或原作者公开宣布新开账号开展虚拟UP主活动（相应的，后者的原账号则被称为“前世”）。这种情况下一般会带着原来自己活动的粉丝。因为这些粉丝并不是因为虚拟UP主活动而是之前的活动加入的，因此一般统计的时候都会先排除掉。
					<br><b>&nbsp非转生势：</b>指完全使用原创的虚拟形象和人物设定，以新的平台账号开展活动的虚拟UP主。

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
	</body>
</html>

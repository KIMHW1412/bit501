<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="fonts/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="css/magnific-popup.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top">

		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="index.jsp" title="My Portfolio Bootstrap Theme"> <img
					class="logo" src="images/logo.png"
					alt="My Portfolio Bootstrap Theme" style="margin-top: 5px;" />
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp" class="smooth-scroll">HOME</a></li>
					<li><a href="notice.jsp" class="smooth-scroll">공지사항</a></li>
					<li><a href="list.jsp" class="smooth-scroll">게시판</a></li>
					<li><a href="join.jsp" class="smooth-scroll">회원가입</a></li>
					<%
						if (session.getAttribute("naver") == null) {
					%>
					<li><a href="login.jsp" class="smooth-scroll">로그인</a></li>
					<%
						} else {
					%>
					<li><a
						href="myPage.jsp?idx=<%=session.getAttribute("naver")%>"
						style="color: white;" class="smooth-scroll"><%=session.getAttribute("naver")%>
							님</a></li>
					<li><a href="logoutSave.jsp" class="smooth-scroll">로그아웃</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<link href="css/magnific-popup.css" rel="stylesheet">

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.mixitup.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="js/theme.js"></script>
</body>
</html>


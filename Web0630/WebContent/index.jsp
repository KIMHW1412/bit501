<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>미니 프로젝트</title>

<!-- CSS includes -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Karla"
	rel="stylesheet" type="text/css">
<link href="fonts/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script>
<script type="text/javascript">
	function mypopup() { // 157번라인 <a onClick=mypopup()
		window.open("myprofile.html", "title",
				"width=650,height=450,left=500,top=200");
	}//end

	function youpopup() {
		open("youprofile.html", "title",
				"width=650,height=450,left=500,top=200");
	}//end

	function theypopup() {
		window.open("theyprofile.html", "title",
				"width=650,height=450,left=500,top=200");
	}//end
	function initialize() {
		var myLatlng = new google.maps.LatLng(37.494643, 127.027583); // y, x좌표값
		var mapOptions = {
			zoom : 15,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}

		var map = new google.maps.Map(document.getElementById('map_canvas'),
				mapOptions);
		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			title : "Bitcamp"
		});
		var infowindow = new google.maps.InfoWindow({
			content : "<h1>김현우</h1>",
			maxWidth : 300
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
	}
</script>
</head>

<body onload="initialize()">

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
	<!-- Carousel -->
	<div id="theme-carousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#theme-carousel" data-slide-to="0" class="active"></li>
			<li data-target="#theme-carousel" data-slide-to="1"></li>
			<li data-target="#theme-carousel" data-slide-to="2"></li>
			<li data-target="#theme-carousel" data-slide-to="3"></li>
			<li data-target="#theme-carousel" data-slide-to="4"></li>
			<li data-target="#theme-carousel" data-slide-to="5"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="images/carousel1.jpg" alt="carousel1" style="width: 100%;" />
				<div class="carousel-caption">
					<h1 class="text-danger">Design</h1>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry</p>
				</div>
			</div>

			<div class="item">
				<img src="images/carousel2.jpg" alt="carousel2" style="width: 100%;" />
				<div class="carousel-caption">
					<h1 class="text-danger">Development</h1>
					<p>Contrary to popular belief, Lorem Ipsum is not simply random
						text.</p>
				</div>
			</div>

			<div class="item">
				<img src="images/carousel3.jpg" alt="carousel3" style="width: 100%;">
				<div class="carousel-caption">
					<h1 class="text-danger">Illustration</h1>
					<p>It is a long established fact that a reader will be
						distracted by the readable content of a page when looking at its
						layout.</p>
				</div>
			</div>

			<!--우리가 추가한 그림이미지 -->
			<div class="item">
				<img src="images/t13.png" alt="t13.png"
					style="width: 100%; height: 500px">
				<div class="carousel-caption">
					<h1 class="text-danger">Programmer</h1>
					<p>It is a long established fact that a reader will be
						distracted by the readable content of a page when looking at its
						layout.</p>
				</div>
			</div>

			<div class="item">
				<img src="images/carousel4.png" alt="carousel4" style="width: 100%;">
				<div class="carousel-caption">
					<h1 class="text-danger">Gamer</h1>
					<p>It is a long established fact that a reader will be
						distracted by the readable content of a page when looking at its
						layout.</p>
				</div>
			</div>

			<div class="item">
				<img src="images/carousel6.png" alt="carousel6" style="width: 100%;">
				<div class="carousel-caption">
					<h1 class="text-danger">HTML5&CSS3</h1>
					<p>It is a long established fact that a reader will be
						distracted by the readable content of a page when looking at its
						layout.</p>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#theme-carousel" role="button"
			data-slide="prev">
			<div class="carousel-control-arrow">&#8249;</div>
		</a> <a class="right carousel-control" href="#theme-carousel"
			role="button" data-slide="next">
			<div class="carousel-control-arrow">&#8250;</div>
		</a>
	</div>

	<link href="css/magnific-popup.css" rel="stylesheet">

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.mixitup.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="js/theme.js"></script>

	<script type="text/javascript">
		jQuery(function($) {
			// Mix It Up Gallery and Magnific Popup setup
			$('.container-gallery').mixItUp();
			$('.container-gallery').magnificPopup({
				delegate : 'a',
				type : 'image'
			});
			// Google Maps setup
			/* var googlemap = new google.maps.Map(document
						.getElementById('map_canvas'), {
					center : new google.maps.LatLng(37.494643, 127.027583), //(44.5403, -78.5463),
					zoom : 17,
					mapTypeId : google.maps.MapTypeId.ROADMAP
				}); */
		});
	</script>
	<br>

	<div id="map_canvas"></div>

	<br>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>

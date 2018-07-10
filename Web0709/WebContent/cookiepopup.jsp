<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[cookiepopup.jsp]</title>
<style type="text/css">
#popup_bottom {
	position: fixed;
	width: 100%;
	height: 25px;
	right: 0px;
	bottom: 0px;
	align-content: right;
	float: bottom;
	margin-right: 5px;
	border-top: 1px solid rgba(0, 0, 0, 0.5);
	background-color: rgba(255, 255, 255, 0.7);
	trasition: background-color .5s ease-in-out;
}

#popup_bottom:hover {
	border-top: 1px solid rgba(0, 0, 0, 1.0);
	background-color: rgba(255, 255, 255, 1.0);
	trasition: background-color .5s ease-in-out border-top .5s ease-in-out;
}

div {
	margin-top: 30px;
}
</style>
<script type="text/javascript">
	function selfClose() {
		var flag = document.getElementById("disable_popup_checkbox").checked;
		opener.disablePopupOpen(flag);
		self.close();
	}
</script>
</head>
<body bgcolor="yellow">
	<div id="popup_main" align="center">
		<font size="6" color="blue">성탄축하 50%세일</font><br> <font size="6"
			color="blue">송구연신 70%세일</font><br> <font size="6" color="blue">해피신년
			90%세일</font><br>
		<p>
			<br> <img alt="images/bar.gif" height="50" src="images/bar.gif">
			<br> <img alt="images/bar.gif" height="50" src="images/bar.gif">
			<br> <img alt="images/bar.gif" height="50" src="images/bar.gif">
			<br>
	</div>
	<div id="popup_bottom" align="right" onmousedown="return false;">
		<label>오늘 10초 안보기<input type="checkbox"
			id="disable_popup_checkbox" onclick="selfClose();"></label>
	</div>
</body>
</html>
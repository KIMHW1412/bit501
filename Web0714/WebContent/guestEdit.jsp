<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.hb.common.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestEdit.jsp]</title>
<style type="text/css">
* {
	font-size: 16pt;
	font-weight: bold;
}

a {
	font-size: 16pt;
	color: blue;
	text-decoration: none;
}

a:hover {
	font-size: 16pt;
	color: green;
	text-decoration: none;
}

div.tit {
	font-size: 26pt;
	font-weight: bold;
	color: red;
}
</style>
</head>
<body>
	<font color=blue> guestEdit.jsp </font>
	<p>
	<form name="myform" action="edit.do" method="post">
		수정사번: <input type="text" name="sabun" value="${dto.sabun}" readonly>
		<br> 수정이름: <input type="text" name="name"
			value="${dto.name}"> <br> 수정제목: <input
			type="text" name="title" value="${dto.title}"> <br>
		수정급여: <input type="text" name="pay" value="${dto.pay}">
		<br> <input type="submit" value="submit수정처리"> <input
			type="reset" value="입력취소">
	</form>

	<p>
		<a href="main.jsp"> [index] </a> <a href="guestJoin.jsp">
			[guestJoin] </a> <a href="list.do"> [guestList] </a>
</body>
</html>



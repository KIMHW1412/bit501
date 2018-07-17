<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.hb.common.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>[guestList.jsp]</title>
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
	<table width=700 border=1 cellspacing="0">
		<tr align="right">
			<td colspan="6">레코드갯수 : ${Gtotal} &nbsp;&nbsp;</td>
		</tr>
		<tr bgcolor="yellow">
			<td>No</td>
			<td>사번</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>급여</td>
		</tr>
		<c:forEach var="dto" items="${dto}">
			<tr>
				<td>${dto.rn}</td>
				<td>${dto.sabun}</td>
				<td>${dto.name}</td>
				<td><a href="detail.do?idx=${dto.sabun}">${dto.title}</a></td>
				<td>${dto.nalja}</td>
				<td>${dto.pay}</td>
			</tr>
		</c:forEach>
	</table>

	<br>
	<%
		if (session.getAttribute("naver") == null) {
	%>
	<button type="button" class="btn btn-primary"
		onclick="location.href='login.jsp'">로그인</button>
	<a href="main.jsp"> [index] </a>
	<a href="guestJoin.jsp"> [guestJoin] </a>
	<a href="list.do"> [guestList] </a>
	<%
		} else {
	%>
	<span> <font color="red"><%=session.getAttribute("naver")%></font>
		님 로그인 되었습니다.
	</span>
	<button type="button" class="btn btn-default"
		onclick="location.href='logoutSave.jsp'">로그아웃</button>
	<a href="main.jsp"> [index] </a>
	<a href="guestJoin.jsp"> [guestJoin] </a>
	<a href="list.do"> [guestList] </a>

	<%
		}
	%>
</body>
</html>


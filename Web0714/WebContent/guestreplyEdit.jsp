<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.hb.common.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>[guestDetail]</title>
<Style>
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
</Style>
<script type="text/javascript">
	function detailDel() {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "delete.do?idx=${dto.sabun}";
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<table width=700 border=1 cellspacing="0" cellpadding="3">
		<tr>
			<td colspan='2' align="center">
				<div class='tit'>${dto.sabun}님의상세정보</div>
			</td>
		</tr>
		<tr>
			<td rowspan="5" align="center"><img src='images/bbb.gif'></td>
			<td>사번 : ${dto.sabun}</td>
		</tr>
		<tr>
			<td>이름 : ${dto.name}</td>
		</tr>
		<tr>
			<td>제목 : ${dto.title}</td>
		</tr>
		<tr>
			<td>날자 : ${dto.nalja}</td>
		</tr>
		<tr>
			<td>급여 : ${dto.pay}</td>
		</tr>
		<tr>
			<td colspan='2' align="center"><a href="main.jsp">[index]</a> <a
				onclick="detailDel()">[삭제]</a> <a href="guestJoin.jsp">[guestJoin]</a>
				<a href="preEdit.do?idx=${dto.sabun}">[수정]</a> <a href="list.do">[guestList]</a><br></td>
		</tr>
	</table>
	<p>
		<jsp:include page="guestreplyEdit2.jsp">
			<jsp:param value="${dto.sabun}" name="Gsabun" />
		</jsp:include>
</body>
</html>




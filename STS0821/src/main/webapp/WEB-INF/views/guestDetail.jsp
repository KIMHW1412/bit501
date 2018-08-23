<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>[guestDetail.jsp]</title>
<style type="text/css">
* {
	font-size: 20pt;
	font-weight: bold;
}

a {
	text-decoration: none;
	font-size: 24pt;
	font-weight: bold;
}

a:hover {
	text-decoration: underline;
	font-size: 26pt;
	font-weight: bold;
}
</style>

</head>
<body>

	<table width=900 border=1 cellspacing="0" cellpadding="5">
		<tr bgcolor="yellow">
			<td colspan='2' align="center">
				<div class='tit'>
					<font style="font-size: 30pt">[${dto.name}]님의상세정보</font>
				</div>
			</td>
		</tr>

		<tr>
			<td rowspan="5" align="center"><img
				src='./resources/images/bbb.gif'></td>
			<td>사번 : ${dto.sabun}</td>
		</tr>

		<tr>
			<td>이름 : ${dto.name}</td>
		</tr>
		<tr>
			<td>제목 : ${dto.title}</td>
		</tr>
		<tr>
			<td>날자 : <fmt:formatDate value="${dto.nalja}"
					pattern="yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<td>급여 : ${dto.pay}</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<a href="preEdit.do?idx=${dto.sabun}">[수정]</a>&nbsp;&nbsp;
			<a href="delete.do?idx=${dto.sabun}">[삭제]</a></td>
		</tr>
	</table>

	<p>
		<a href="index.jsp">[index.jsp]</a> <a href="guest.do">[guest.jsp]</a>
		<a href="list.do">[guestList.jsp]</a>
</body>
</html>
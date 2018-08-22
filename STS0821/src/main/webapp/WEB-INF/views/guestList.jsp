<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>[guestList.jsp]</title>
<style type="text/css">
* {
	font-size: 20pt;
	font-weight: bold;
}

a {
	text-decoration: none;
	font-size: 32pt;
	font-weight: bold;
}

a:hover {
	text-decoration: underline;
	font-size: 36pt;
	font-weight: bold;
}
</style>

</head>
<body>
	<table border="1" width=900 cellspacing="0">
		<tr bgcolor="yellow">
			<td>사 번</td>
			<td>이 름</td>
			<td>제 목</td>
			<td>날 짜</td>
			<td>급 여</td>
		</tr>

		<c:forEach var="dto" items="${LG}">
			<tr>
				<td>${dto.sabun}</td>
				<td>${dto.name}</td>
				<td><a href="detail.do?idx=${dto.sabun}"> ${dto.title} </a></td>
				<td><fmt:formatDate value="${dto.nalja}" pattern="yyyy-MM-dd" />
				</td>
				<td>${dto.pay}</td>
			</tr>
		</c:forEach>
	</table>

	<p>
		<a href="index.jsp">[index.jsp]</a> <a href="guest.do">[guest.jsp]</a>
</body>
</html>


















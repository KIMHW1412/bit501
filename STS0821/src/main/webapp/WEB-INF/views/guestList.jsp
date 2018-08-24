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
	<table border="1" width=900 cellspacing="0">
		<tr>
			<td colspan="6" align="right">레코드갯수 : ${Gtotal}&nbsp;&nbsp;</td>
		</tr>

		<tr bgcolor="yellow" height="50" align="center">
			<td>No</td>
			<td>사 번</td>
			<td>이 름</td>
			<td>제 목</td>
			<td>날 짜</td>
			<td>급 여</td>
		</tr>

		<c:forEach var="dto" items="${LG}">
			<tr>
				<td>${dto.rn}</td>
				<td>${dto.sabun}</td>
				<td>${dto.name}</td>
				<td><a href="detail.do?idx=${dto.sabun}"> ${dto.title} </a></td>
				<td><fmt:formatDate value="${dto.nalja}" pattern="yyyy-MM-dd" />
				</td>
				<td>${dto.pay}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan=6 align="center"><c:if test="${startpage>10}">
					<a href="list.do?pageNum=${startpage - 1}">[이전]</a>
				</c:if> <c:forEach begin="${startpage}" end="${endpage}" var="i">

					<c:if test="${i<=pagecount}">
						<c:choose>
							<c:when test="${i==pageNUM}">
								<font size=6 color=red><b>[${i}]</b></font>
							</c:when>
							<c:otherwise>
								<a href="list.do?pageNum=${i}${returnpage}">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:if>

				</c:forEach> <c:if test="${endpage<pagecount}">
					<a href="list.do?pageNum=${startpage + 10}">[다음]</a>
				</c:if></td>
		</tr>

		<tr>
			<td colspan=6 align="center">
				<form name="mysearchform" action="list.do">
					<b>검색:</b> <select name="keyfield" onchange="changeClear()">
						<option value="" selected="selected">전체출력</option>
						<option value="name" <c:if test="${! empty AA}">selected</c:if>>이름검색</option>
						<option value="title" <c:if test="${! empty BB}">selected</c:if>>제목검색</option>
						<option value="all" <c:if test="${! empty CC}">selected</c:if>>이름+제목검색</option>
					</select> &nbsp; <input type="text" name="keyword" value="${sval}">
					<input type="submit" value="검 색">
				</form>
			</td>
		</tr>
	</table>

	<p>
		<a href="index.jsp">[index.jsp]</a> <a href="guest.do">[guest.jsp]</a>
</body>
</html>


















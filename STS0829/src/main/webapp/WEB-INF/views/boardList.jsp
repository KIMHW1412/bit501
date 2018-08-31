<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>[boardList.jsp]</title>
<style type="text/css">
* {
	font-size: 16pt;
	font-weight: bold;
}

a {
	text-decoration: none;
	font-size: 20pt;
	font-weight: bold;
}

a:hover {
	text-decoration: underline;
	font-size: 22pt;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	function changeClear() {
		mysearchform.keyword.value = "";
		mysearchform.keyword.focus();
	}
</script>
</head>
<body>
	<table width=700 border=1 cellpadding="0">
		<tr>
			<td colspan=6 align="right"><c:choose>
					<c:when test="${empty naver}">
						<font size=7> 등록된 데이타가
							없습니다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
					</c:when>
					<c:otherwise>
						<font size=6> ${searchcount}/${total}&nbsp;&nbsp;&nbsp;</font>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr bgcolor=yellow height=50>
			<td>번호</td>
			<td>이미지</td>
			<td>이름</td>
			<td>제목</td>
			<td>성별</td>
			<td>취미</td>
		</tr>
		<c:forEach var="dto" items="${naver}">
			<tr>
				<td>${dto.rn}</td>
				<td><img src="./resources/upload/${dto.img_file_name}"
					width="50" height="50" /></td>
				<td>${dto.name}</td>
				<td><a href="detail.do?idx=${dto.hobby_idx}">${dto.title} <c:if
							test="${dto.replycount > 0}">
							<span style="color: red;">[${dto.replycount}]</span>
						</c:if>
				</a></td>
				<td>${dto.gender}</td>
				<td>${dto.hobby}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan=6 align="center"><c:if test="${startpage>10}">
					<a href="list.do?pageNum=${startpage - 1}${returnpage}">[이전]</a>
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
					<a href="list.do?pageNum=${startpage + 10}${returnpage}">[다음]</a>
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
		<a href="index.jsp">[index.jsp]</a> <a href="board.do">[신규등록]</a>
</body>
</html>




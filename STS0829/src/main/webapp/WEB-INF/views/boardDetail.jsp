<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>[boardDetail.jsp]</title>
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

</head>
<body>

	<table width=900 border=1 cellspacing="0" cellpadding="5">
		<tr>
			<td colspan='2' align="center" bgcolor="yellow"><font
				color='blue' style="font-size: 30pt"> [${dto.name}]님 게시판상세정보
			</font></td>
		</tr>
		<tr>
			<td rowspan="5" align="center"><img
				src='${pageContext.request.contextPath}/resources/upload/${dto.img_file_name}'
				width=250 heigh=300></td>
			<td>번호 : ${dto.hobby_idx}</td>
		</tr>
		<tr>
			<td>제목 : ${dto.title}</td>
		</tr>
		<tr>
			<td>내용 : ${dto.content}</td>
		</tr>
		<tr>
			<td>성벌 : ${dto.gender}</td>
		</tr>
		<tr>
			<td>취미: ${dto.hobby}</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><a
				href="preEdit.do?idx=${dto.hobby_idx}">[수정]</a>&nbsp;&nbsp; <a
				href="delete.do?idx=${dto.hobby_idx}">[삭제]</a></td>
		</tr>
	</table>

	<p>
		<a href="index.jsp">[index.jsp]</a> <a href="board.do">[board.jsp]</a>
		<a href="list.do">[boardList.jsp]</a>
	<hr>
	<jsp:include page="board_reply.jsp" />
</body>
</html>
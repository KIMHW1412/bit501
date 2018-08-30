<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>[preEdit.jsp=preEdit.do]</title>
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

	<form action="edit.do" enctype="multipart/form-data" method="post">
		<input type="hidden" name="hobby_idx" value="${dto.hobby_idx}">

		<b>이름:</b> <input type="text" name="name" value="${dto.name}"><br>
		<b>제목:</b> <input type="text" name="title" value="${dto.title}"><br>
		<b>내용:</b>
		<textarea name="content" rows="4" cols="20">${dto.content}</textarea>
		<br> <b>성별:</b> <input type="radio" name="gender" value="man"
			<c:if test="${dto.gender eq 'man'}"> checked="checked"</c:if>><b>남자</b>
		<input type="radio" name="gender" value="woman"
			<c:if test="${dto.gender eq 'woman'}"> checked="checked"</c:if>><b>여자</b>
		<br> <b>취미:</b> <input type="checkbox" name="hobby" value="game"
			<c:if test="${dto.hobby eq 'game'}"> checked="checked"</c:if>><b>게임</b>
		<input type="checkbox" name="hobby" value="ski"
			<c:if test="${dto.hobby eq 'ski'}"> checked="checked"</c:if>><b>스키</b>
		<input type="checkbox" name="hobby" value="study"
			<c:if test="${dto.hobby eq 'study'}"> checked="checked"</c:if>><b>공부</b>
		<input type="checkbox" name="hobby" value="movie"
			<c:if test="${dto.hobby eq 'movie'}"> checked="checked"</c:if>><b>영화</b>
		<br> <img src='./resources/upload/${dto.img_file_name}'
			width="200" height="200"> <br>
		<!-- 파일명담당 img_file_name   -->
		<input type="file" name="upload_f" value="이미지수정">
		<p>


			<input type="submit" value="board수정"> <input type="reset"
				value="수정취소">
	</form>
	<a href="index.jsp">[index.jsp]</a>
	<a href="board.do">[신규등록]</a>
</body>
</html>




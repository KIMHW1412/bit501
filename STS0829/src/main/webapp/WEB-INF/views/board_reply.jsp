<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[board_reply.jsp]</title>
<style type="text/css">
* {
	font-size: 14pt;
	font-family: Comic Sans MS;
}

#LOG-IN {
	font-size: 26pt;
	font-weight: bold;
	background: #FFFF00;
	height: 550;
}
</style>
</head>
<body>

	<!-- board_reply.jsp문서  단독실행금지 -->
	<br>
	<form method="get" action="replayInsert.do">
		<table width="700" border='0' cellspacing="0">
			<input type="hidden" name="hobby_idx" value="${dto.hobby_idx}">
			<tr align="center">
				<td><b><img src="./resources/images/x1.gif">작성자:<img
						src="./resources/images/x1.gif"></b> <input type="text"
					name="rwriter" value="${dto.name}" size=20> <input
					type="submit" value="댓글저장 " style="height: 25pt;"></td>
			</tr>
			<tr align="center">
				<td><textarea name="rmemo" cols="60" rows=3></textarea></td>
			</tr>
		</table>
	</form>

	<p>
	<table width="650" border='0' cellspacing="0">
		<tr bgcolor="pink" height='30' align="center">
			<td colspan=4>댓글 데이타 내용 표시</td>
		</tr>
		<c:forEach var="reply" items="${reply}">
		<tr onMouseOver="style.background='#00FFFF'"
			onMouseOut="style.background='' ">
			<td width=100>${reply.rrn}</td>
			<td width=100>${reply.rwriter}</td>
			<td width=300>${reply.rmemo}</td>
			<td width=150><input type="button" onclick="location.href='replyDelete.do?idx=${reply.rhobby_idx}&num=${dto.hobby_idx}'" value="삭제">
				<input type="button" onclick="" value="수정"></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
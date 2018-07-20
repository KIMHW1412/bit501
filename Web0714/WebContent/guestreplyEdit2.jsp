<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestreply.jsp]</title>
<style type="text/css">
* {
	margin-left: 10px;
	font-size: 14pt;
	font-family: comic Sans MS;
}
</style>
</head>
<body>
	<hr width="700">
	<table width="700" border="0" cellspacing="0">
		<tr bgcolor="yellow" height="35" align="center">
			<td colspan="4">댓글 데이타 수정 내용 표시</td>
		</tr>
		<c:forEach var="rbean" items="${rnaver}">
			<tr onmouseover="style.background='#00FFFF'"
				onmouseout="style.background=''">
				<td width="100">${rbean.writer}</td>
				<td width="500">${rbean.content}</td>
				<td width="150"><input type="button"
					onclick="location.href='preReplyEdit.do?idx=${rbean.num}&sabun=${rbean.sabun}'"
					value="수 정"><input type="button"
					onclick="location.href='replyDelete.do?idx=${rbean.num}&sabun=${rbean.sabun}'"
					value="삭 제"></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form method="get" action="replyEdit.do">
		<input type="hidden" name="insert" value="flag"> <input
			type="hidden" name="sabun" value="${reply_sabun}">
			<input
			type="hidden" name="num" value="${reply_num}">
		<table width="700" border="0" cellspacing="0">
			<c:forEach var="rbean" items="${rnaver2}">
				<tr valign="middle">
					<td><b><img alt="" src="images/x1.gif">작성자<img
							alt="" src="images/x1.gif"></b> <input type="text"
						name="writer" size="20" value="${rbean.writer}"> <input
						type="submit" value="댓글저장" style="height: 35pt;"></td>
				</tr>
				<tr>
					<td><textarea name="content" rows="3" cols="50">${rbean.content}</textarea></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>

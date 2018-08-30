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
	<%!int R_idx;
	String Rwriter, Rcontent;%>

	<!-- board_reply.jsp문서  단독실행금지 -->
	<br>
	<form method="get" action="">
		<table width="700" border='0' cellspacing="0">
			<input type="hidden" name="hobby_idx" value="${dto.hobby_idx}">
			<tr align="center">
				<td><b><img src="./resources/images/x1.gif">작성자:<img
						src="./resources/images/x1.gif"></b> <input type="text"
					name="writer" size=20> <input type="submit"
					value="게시판댓글저장 " style="height: 25pt;"></td>
			</tr>
			<tr align="center">
				<td><textarea name="content" cols="60" rows=3></textarea></td>
			</tr>
		</table>
	</form>

	<p>
	<table width="650" border='0' cellspacing="0">
		<tr bgcolor="pink" height='30' align="center">
			<td colspan=4>댓글 데이타 내용 표시</td>
		</tr>
		<%
			//msg = "select * from  guestreply where sabun = " + Rdata ;
			//msg="select g.sabun, r.num, r.writer, r.content from guest  g, guestreply r 
			//where  g.sabun=r.sabun and r.sabun=" + Rdata;
		%>
		<tr onMouseOver="style.background='#00FFFF'"
			onMouseOut="style.background='' ">
			<td width=100></td>
			<td width=100></td>
			<td width=300></td>
			<td width=150><input type="button" onclick="" value="삭제">
				<input type="button" onclick="" value="수정"></td>
		</tr>

		<%
			
		%>
	</table>
</body>
</html>
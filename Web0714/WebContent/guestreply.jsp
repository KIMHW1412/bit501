<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>

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
	<%!int Rnum, Rsabun;
	String Rwriter, Rcontent, Rdata;%>
	<%
		//<jsp:param name="Gsabun"/>
		Rdata = request.getParameter("Gsabun");
	%>

	<br>
	<form method="get" action="guestreply_insert.jsp">
		<table width="700" border="0" cellspacing="0">
			<input type="hidden" name="insert" value="flag">
			<input type="hidden" name="sabun" value="<%=Rdata%>">
			<tr valign="middle">
				<td><b><img alt="" src="images/x1.gif">작성자<img alt=""
						src="images/x1.gif"></b> <input type="text" name="writer"
					size="20"> <input type="submit" value="댓글저장"
					style="height: 25pt;"></td>
			</tr>
			<tr>
				<td><textarea name="content" rows="3" cols="50"></textarea></td>
			</tr>
		</table>
	</form>
	<p>
	<table width="600" border="0" cellspacing="0">
		<tr bgcolor="yellow" height="35" align="center">
			<td colspan="4">댓글 데이타 내용 표시</td>
		</tr>
		<%
			try {
				msg = "select g.sabun, r.num, r.writer, r.content " + "from guest g inner join guestreply r "
						+ "on g.sabun=r.sabun and r.sabun=" + Rdata + " order by num";
				ST = CN.createStatement();
				RS = ST.executeQuery(msg);
				while (RS.next() == true) {
					Rnum = RS.getInt("num"); //시퀀스글번호
					Rwriter = RS.getString("writer");
					Rcontent = RS.getString("content");
					Rsabun = RS.getInt("sabun"); //윗쪽 Gdata사용권장
		%>
		<tr onmouseover="style.background='#00FFFF'"
			;
			onmouseout="style.background=''";
		>
			<td width="100"><%=Rnum%></td>
			<td width="100"><%=Rwriter%></td>
			<td width="350"><%=Rcontent%></td>
			<td width="100"><input type="button"
				onclick="location.href='guestEditreply.jsp?idx=<%=Rsabun%>&num=<%=Rnum%>'"
				value="수 정"><input type="button"
				onclick="location.href='guestreply_delete.jsp?idx=<%=Rsabun%>&num=<%=Rnum%>'"
				value="삭 제"></td>
		</tr>
		<%
			}
			} catch (Exception e) {
				System.out.println("에러" + e);
			}
		%>
	</table>
</body>
</html>









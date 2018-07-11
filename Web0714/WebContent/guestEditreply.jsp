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
	<%!int Rnum, Rsabun, Rdata;
	String Rwriter, Rcontent;%>
	<%
		//<jsp:param name="Gsabun"/>
		Rsabun = Integer.parseInt(request.getParameter("idx"));
		Rnum = Integer.parseInt(request.getParameter("num"));
	%>

	<%
		try {
			msg = "select g.sabun, r.num, r.writer, r.content " + "from guest g inner join guestreply r "
					+ "on g.sabun=r.sabun and r.num=" + Rnum + " order by num";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				//Rnum = RS.getInt("num"); //시퀀스글번호
				Rwriter = RS.getString("writer");
				Rcontent = RS.getString("content");
				Rsabun = RS.getInt("sabun"); //윗쪽 Gdata사용권장
			}
		} catch (

		Exception e) {
			System.out.println("에러" + e);
		}
	%>
	<br>
	<form method="get" action="guestEditreplySave.jsp">
		<table width="700" border="0" cellspacing="0">
			<input type="hidden" name="num" value="<%=Rnum%>">
			<input type="hidden" name="sabun" value="<%=Rsabun%>">
			<tr valign="middle">
				<td><b><img alt="" src="images/x1.gif">작성자<img alt=""
						src="images/x1.gif"></b> <input type="text" name="writer"
					size="20" value="<%=Rwriter%>"> <input type="submit"
					value="댓글수정" style="height: 25pt;"></td>
			</tr>
			<tr>
				<td><textarea name="content" rows="3" cols="50"><%=Rcontent%></textarea></td>
			</tr>
		</table>
	</form>
	<p>
	<table width="600" border="0" cellspacing="0">
		<tr bgcolor="yellow" height="35" align="center">
			<td colspan="4">댓글 데이터 내용 표시</td>
		</tr>
		<tr onmouseover="style.background='#00FFFF'"
			;
			onmouseout="style.background=''";
		>

			<td width="100"><%=Rnum%></td>
			<td width="100"><%=Rwriter%></td>
			<td width="350"><%=Rcontent%></td>
		</tr>
	</table>
</body>
</html>









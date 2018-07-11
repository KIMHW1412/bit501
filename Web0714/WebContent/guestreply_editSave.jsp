<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestreply_editSave.jsp]</title>
<style type="text/css">
* {
	font-size: 14pt;
	font-family: comic Sans MS;
}
</style>
</head>
<body>
	<%!int Rnum, Rsabun, Rdata;
	String Rwriter, Rcontent;%>
	<font color=blue> guestreply_delete.jsp </font>
	<p>
		<%
			try { //guestreply_editSave.jsp 단독실행하면 에러발생
				Rnum = Integer.parseInt(request.getParameter("num"));
				Rwriter = request.getParameter("writer");
				Rcontent = request.getParameter("content");
				Rsabun = Integer.parseInt(request.getParameter("idx"));

				if (Rwriter == "" || Rwriter.equals("") || Rcontent == "" || Rcontent == null) {
					System.out.println("댓글수정 데이터 공백입니다.");
					return;
				}
				msg = "update ~ guestreply where num=" + Rnum;
				response.sendRedirect("guestDetail.jsp?idx=" + Rsabun);
			} catch (Exception e) {
				System.out.println("댓글수정에러 " + e);
			}
		%>
	
</body>
</html>









<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestSave.jsp]</title>
</head>
<body>
	<!-- 나중에 단독실행하면 에러발생 -->
	<%
		int Gsabun = Integer.parseInt(request.getParameter("sabun"));
		String Gname = request.getParameter("name");
		String Gtitle = request.getParameter("title");
		int Gpay = Integer.parseInt(request.getParameter("pay"));
	%>
	<jsp:useBean id="ds" class="net.hb.common.DBSQL"></jsp:useBean>
	<%
		ds.dbInsert(Gsabun, Gname, Gtitle, Gpay);
		response.sendRedirect("guestList.jsp");
	%>
</body>
</html>









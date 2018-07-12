<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestDeleteSave.jsp]</title>
</head>
<body>
	<jsp:useBean id="ds" class="net.hb.common.DBSQL"></jsp:useBean>
	<%
		String data = request.getParameter("idx");
		ds.dbDelete(data);
		response.sendRedirect("guestList.jsp");
	%>
</body>
</html>
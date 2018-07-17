<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>

<html>
<head>
<title>[logoutSave.jsp]</title>
<style type="text/css">
b, a {
	text-decoration: none;
	font-size: 20pt;
	font-weight: bold;
}

a:hover {
	color: red;
	font-size: 34pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<font size=7> <b> [logoutSave.jsp] </b></font>
	<p>
		<%
			session.invalidate(); //모든 세션정보 삭제
			response.sendRedirect("list.do");
		%>
	
	<p>
</body>
</html>






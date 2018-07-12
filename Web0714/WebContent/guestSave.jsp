<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestSave.jsp]</title>
</head>
<body>
	<!-- 나중에 단독실행하면 에러발생 -->
	<jsp:useBean id="ds" class="net.hb.common.DBSQL"></jsp:useBean>
	<jsp:useBean id="bean" class="net.hb.common.DBbean"></jsp:useBean>
	<%
		bean.setSabun(Integer.parseInt(request.getParameter("sabun")));
		bean.setName(request.getParameter("name"));
		bean.setTitle(request.getParameter("title"));
		bean.setPay(Integer.parseInt(request.getParameter("pay")));

		ds.dbInsert(bean);
		response.sendRedirect("guestList.jsp");
	%>
</body>
</html>









<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestEditSave.jsp]</title>
</head>
<body>
	<jsp:useBean id="ds" class="net.hb.common.DBSQL"></jsp:useBean>
	<jsp:useBean id="bean" class="net.hb.common.DBbean"></jsp:useBean>
	<%
		bean.setSabun(Integer.parseInt(request.getParameter("sabun")));
		bean.setName(request.getParameter("name"));
		bean.setTitle(request.getParameter("title"));
		bean.setPay(Integer.parseInt(request.getParameter("pay")));

		ds.dbUpdate(bean);
		response.sendRedirect("guestDetail.jsp?idx=" + bean.getSabun());
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestEdit.jsp]</title>
<style type="text/css">
* {
	font-size: 16pt;
	font-weight: bold;
}

a {
	font-size: 16pt;
	color: blue;
	text-decoration: none;
}

a:hover {
	font-size: 16pt;
	color: green;
	text-decoration: none;
}

div.tit {
	font-size: 26pt;
	font-weight: bold;
	color: red;
}
</style>
</head>
<body>
	<jsp:useBean id="ds" class="net.hb.common.DBSQL"></jsp:useBean>
	<jsp:useBean id="bean" class="net.hb.common.DBbean"></jsp:useBean>
	<%
		String data = request.getParameter("idx");
		bean = ds.dbDetail(data);
	%>
	<font color=blue> guestEdit.jsp </font>
	<p>
	<form name="myform" action="guestEditSave.jsp">
		수정사번: <input type="text" name="sabun" value="<%=bean.getSabun()%>" readonly>
		<br> 수정이름: <input type="text" name="name"
			value="<%=bean.getName()%>"> <br> 수정제목: <input
			type="text" name="title" value="<%=bean.getTitle()%>"> <br>
		수정급여: <input type="text" name="pay" value="<%=bean.getPay()%>">
		<br> <input type="submit" value="submit수정처리"> <input
			type="reset" value="입력취소">
	</form>

	<p>
		<a href="main.jsp"> [index] </a> <a href="guestJoin.jsp">
			[guestJoin] </a> <a href="guestList.jsp"> [guestList] </a>
</body>
</html>



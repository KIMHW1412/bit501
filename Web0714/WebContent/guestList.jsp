<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.hb.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>[guestList.jsp]</title>
<style type="text/css">
* {
	font-size: 15pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:useBean id="ds" class="net.hb.common.DBSQL"></jsp:useBean>
	<jsp:useBean id="bean" class="net.hb.common.DBbean"></jsp:useBean>
	<%
		int mytotal = ds.dbCount();
		ArrayList<DBbean> AL = ds.dbSelect();
	%>
	<table width=700 border=1 cellspacing="0">
		<tr align="right">
			<td colspan="5">레코드갯수 : <%=mytotal%> &nbsp;&nbsp;
			</td>
		</tr>

		<tr bgcolor="yellow">
			<td>사번</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>급여</td>
		</tr>
		<%
			for (int i = 0; i < AL.size(); i++) {
				bean = (DBbean) AL.get(i);
		%>
		<tr>
			<td><%=bean.getSabun()%></td>
			<td><%=bean.getName()%></td>
			<td><a href="guestDetail.jsp?idx=<%=bean.getSabun()%>"><%=bean.getTitle()%></a></td>
			<td><%=bean.getNalja()%></td>
			<td><%=bean.getPay()%></td>
		</tr>
		<%
			}
		%>
	</table>

	<br>
	<%
		if (session.getAttribute("naver") == null) {
	%>
	<button type="button" class="btn btn-primary"
		onclick="location.href='login.jsp'">로그인</button>
	<a href="./index.jsp"> [index] </a>
	<a href="./guestJoin.jsp"> [guestJoin] </a>
	<a href="./guestList.jsp"> [guestList] </a>
	<%
		} else {
	%>
	<span> <font color="red"><%=session.getAttribute("naver")%></font>
		님 로그인 되었습니다.
	</span>
	<button type="button" class="btn btn-default"
		onclick="location.href='logoutSave.jsp'">로그아웃</button>
	<a href="./index.jsp"> [index] </a>
	<a href="./guestJoin.jsp"> [guestJoin] </a>
	<a href="./guestList.jsp"> [guestList] </a>

	<%
		}
	%>
</body>
</html>


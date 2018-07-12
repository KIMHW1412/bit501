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
		int mytotal = ds.dbCount();
		int start = 0, end = 0, pageNUM = 0;
		int temp = 0, startpage = 0, endpage = 0;
		int pagecount = 0;
		String pnum = "";
		pnum = request.getParameter("pageNum");

		if (pnum == null || pnum == "") {
			pnum = "1";
		}
		pageNUM = Integer.parseInt(pnum);

		start = (pageNUM - 1) * 10 + 1;
		end = pageNUM * 10;

		if (mytotal % 10 == 0) {
			pagecount = mytotal / 10;
		} else {
			pagecount = (mytotal / 10) + 1;
		}

		temp = (pageNUM - 1) % 10;
		startpage = pageNUM - temp;
		endpage = startpage + 9;

		if (endpage > pagecount) {
			endpage = pagecount;
		}

		ArrayList<DBbean> AL = ds.dbSelect(start, end);
	%>
	<table width=700 border=1 cellspacing="0">
		<tr align="right">
			<td colspan="6">레코드갯수 : <%=mytotal%> &nbsp;&nbsp;
			</td>
		</tr>

		<tr bgcolor="yellow">
			<td>No</td>
			<td>사번</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>급여</td>
		</tr>
		<%
			for (int i = 0; i < AL.size(); i++) {
				bean = (DBbean) AL.get(i); // 형변환은 해줘도 되고 안해줘도 되고
		%>
		<tr>
			<td><%=bean.getRn()%></td>
			<td><%=bean.getSabun()%></td>
			<td><%=bean.getName()%></td>
			<td><a href="guestDetail.jsp?idx=<%=bean.getSabun()%>"
				style="text-decoration: none"><%=bean.getTitle()%></a></td>
			<td><%=bean.getNalja()%></td>
			<td><%=bean.getPay()%></td>
		</tr>
		<%
			}
		%>
		<!-- MVC2, Spring 페이징계산을 자바에서처리 JSTL사용 -->
		<tr align="center">
			<td colspan="6">
				<%
					if (startpage > 10) {
						out.println("<a href='guestList.jsp?pageNum=" + (startpage - 1) + "'>[이전]</a>");
					}
					for (int i = startpage; i <= endpage; i++) {
						if (pageNUM == i) {
							out.println("<a href='guestList.jsp?pageNum=" + i + "'><font color='red'>[" + i + "]</font></a>");
						} else {
							out.println("<a href='guestList.jsp?pageNum=" + i + "'>[" + i + "]</a>");

						}
					}
					if (endpage < pagecount) {
						out.println("<a href='guestList.jsp?pageNum=" + (startpage + 10) + "'>[다음]</a>");
					}
				%>
			</td>
		</tr>
	</table>

	<br>
	<%
		if (session.getAttribute("naver") == null) {
	%>
	<button type="button" class="btn btn-primary"
		onclick="location.href='login.jsp'">로그인</button>
	<a href="main.jsp"> [index] </a>
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
	<a href="./main.jsp"> [index] </a>
	<a href="./guestJoin.jsp"> [guestJoin] </a>
	<a href="./guestList.jsp"> [guestList] </a>

	<%
		}
	%>
</body>
</html>


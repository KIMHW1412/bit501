<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>[guestDetail]</title>
<Style>
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
</Style>

</head>
<body>
	<jsp:useBean id="ds" class="net.hb.common.DBSQL"></jsp:useBean>
	<jsp:useBean id="bean" class="net.hb.common.DBbean"></jsp:useBean>
	<%
		String data = request.getParameter("idx");
		bean = ds.dbDetail(data);
	%>

	<table width=700 border=1 cellspacing="0" cellpadding="3">
		<tr>
			<td colspan='2' align="center">
				<div class='tit'>
					<%=bean.getSabun()%>님의 상세정보
				</div>
			</td>
		</tr>
		<tr>
			<td rowspan="5" align="center"><img src='images/bbb.gif'></td>
			<td>사번 : <%=bean.getSabun()%>
			</td>
		</tr>
		<tr>
			<td>이름 : <%=bean.getName()%>
			</td>
		</tr>
		<tr>
			<td>제목 : <%=bean.getTitle()%>
			</td>
		</tr>
		<tr>
			<td>날자 : <%=bean.getNalja()%>
			</td>
		</tr>
		<tr>
			<td>급여 : <%=bean.getPay()%>
			</td>
		</tr>
		<tr>
			<td colspan='2' align="center"><a href="index.jsp">[index]</a> <script
					type="text/javascript">
			function detailDel() {
				if(confirm("삭제하시겠습니까?")) {
					location.href = "guestDeleteSave.jsp?idx=<%=bean.getSabun()%>";
				} else {
					return false;
				}
			}
			</script> <a onclick="detailDel()">[삭제]</a> <a href="guestJoin.jsp">[guestJoin]</a>
				<a href="guestEdit.jsp?idx=<%=bean.getSabun()%>">[수정]</a> <a
				href="list.do">[guestList]</a><br></td>
		</tr>
	</table>
	<p>
		<jsp:include page="guestreply.jsp">
			<jsp:param value="<%=bean.getSabun()%>" name="Gsabun" />
		</jsp:include>
</body>
</html>




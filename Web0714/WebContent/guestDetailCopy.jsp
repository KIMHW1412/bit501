<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>
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
	font-size: 20pt;
	color: green;
	text-decoration: underline;
}

div.tit {
	font-size: 26pt;
	font-weight: bold;
	color: red;
}
</Style>

</head>
<body>

	<%
		try { //guestDetail.jsp문서 한건상세 단독실행에러입니다
			data = request.getParameter("idx");
			ST = CN.createStatement();
			msg = "select * from guest where sabun=" + data;
			RS = ST.executeQuery(msg); //조회한결과 RS기억 
		} catch (Exception e) {
			System.out.println(e);
		}

		if (RS.next() == true) {
			Gsabun = RS.getInt("sabun"); //삭제및수정화면 
			Gname = RS.getString("name");
			Gtitle = RS.getString("title");
			Gnalja = RS.getDate("nalja");
			Gpay = RS.getInt("pay");
		}
		String my = (String) session.getAttribute("naver");
		if (my == null || my == "" || my.equals("")) {
	%>
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		location.href = "login.jsp";
	</script>
	<%
		} else {
	%>

	<table width=700 border=1 cellspacing="0" cellpadding="3">
		<tr>
			<td colspan='2' align="center">
				<div class='tit'>
					<%=Gname%>님의 상세정보
				</div>
			</td>
		</tr>

		<tr>
			<td rowspan="5" align="center"><img src='images/bbb.gif'></td>
			<td>사번 : <%=Gsabun%>
			</td>
		</tr>

		<tr>
			<td>이름 : <%=Gname%>
			</td>
		</tr>
		<tr>
			<td>제목 : <%=Gtitle%>
			</td>
		</tr>
		<tr>
			<td>날자 : <%=Gnalja%>
			</td>
		</tr>
		<tr>
			<td>급여 : <%=Gpay%>
			</td>
		</tr>


		<tr>
			<td colspan='2' align="center"><a href="index.jsp">[index]</a> <a
				href="guestDeleteSave.jsp?idx=<%=Gsabun%>">[삭제]</a> <a
				href="guestJoin.jsp">[guestJoin]</a> <a
				href="guestEdit.jsp?idx=<%=Gsabun%>">[수정]</a> <a
				href="guestList.jsp">[guestList]</a><br></td>
		</tr>
	</table>
	<p>
		<jsp:include page="guestreply.jsp">
			<jsp:param value="<%=Gsabun%>" name="Gsabun" />
		</jsp:include>
		<%
			}
		%>
	
</body>
</html>




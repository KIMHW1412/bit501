<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니 마이페이지</title>
<link rel="stylesheet" type="text/css" href="css/inputcss.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
	<%
		try { //myPage.jsp문서 한건상세 단독실행에러입니다
			String data = (String) session.getAttribute("naver");
			ST = CN.createStatement();
			msg = "select * from bbs where b_sabun=" + data;
			RS = ST.executeQuery(msg); //조회한결과 RS기억 
		} catch (Exception e) {
			System.out.println(e);
		}

		if (RS.next() == true) {
			Gsabun = RS.getInt("b_sabun"); //삭제및수정화면 
			Gname = RS.getString("b_name");
			Gpwd = RS.getString("b_pwd");
			Gtitle = RS.getString("b_title");
			Gcontent = RS.getString("b_content");
			Gphone = RS.getString("b_phone");
			Gnalja = RS.getDate("b_wdate");
			Gjuso1 = RS.getString("b_juso1");
			Gjuso2 = RS.getString("b_juso2");
			Gemail = RS.getString("b_email");
			Gurl = RS.getString("b_url");
			Gfile = RS.getString("b_file1");
		}
	%>
	<jsp:include page="top.jsp"></jsp:include>
	<p>
	<div class="container">
		<div class="all" align="center">
			<div class="title">
				<br>마이페이지
			</div>

			<table class="table1">
				<tr>
					<td colspan="2" align="center"><img alt="" src="storage/<%=Gfile%>" width="100"
						height="100"></td>
				</tr>
				<tr>
					<th>사번</th>
					<td><%=Gsabun%></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=Gname%></td>

				</tr>
				<tr>
					<th>비밀번호</th>
					<td><%=Gpwd%></td>

				</tr>
				<tr>
					<th>주소</th>
					<td><%=Gjuso1%> - <%=Gjuso2%></td>

				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=Gphone%></td>

				</tr>
				<tr>
					<th>Email</th>
					<td><%=Gemail%></td>

				</tr>
				<tr>
					<th>URL</th>
					<td><%=Gurl%></td>

				</tr>
				<tr>
					<th>제목</th>
					<td><%=Gtitle%></td>

				</tr>
				<tr>
					<th>내용</th>
					<td><%=Gcontent%></td>

				</tr>
			</table>
			<p>
			<div align="center">
				<button type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-normal"
					onclick="location.href='myPageDeleteSave.jsp?idx=<%=Gsabun%>'">탈퇴</button>
			</div>
		</div>
	</div>
	<p>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
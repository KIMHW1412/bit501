<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 게시판 상세보기</title>
<link rel="stylesheet" type="text/css" href="css/inputcss.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<body>
	<%
		try { //Detail.jsp문서 한건상세 단독실행에러입니다
			data = request.getParameter("idx");
			ST = CN.createStatement();
			msg = "select * from notice where num=" + data;
			RS = ST.executeQuery(msg); //조회한결과 RS기억 

			while (RS.next() == true) {
				Gtitle = RS.getString("subject");
				Gname = RS.getString("writer");
				Gnalja = RS.getDate("reg_date");
				Gcontent = RS.getString("content");
				total = RS.getInt("readcount");
				total++;
	%>
	<jsp:include page="top.jsp"></jsp:include>

	<div class="container">
		<div class="all" align="center">
			<p>
			<div class="title">
				<br><%=Gtitle%>
			</div>
			<p>
			<p>
			<table class="table table-view">
				<thead>
					<tr>
						<th style="text-align: center;">작성자: <%=Gname%></th>
						<th style="text-align: center;">작성일: <%=Gnalja%></th>
						<th style="text-align: center;">조회수: <%=total%></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="5"
							style="border: 1px solid #ccc; height: 100%; text-align: center;">
							<%=Gcontent%></td>
					</tr>
				</tbody>
			</table>
			<div class="huge-top">
				<%
					String my = (String) session.getAttribute("naver");
							if (my != null) {
								if (my.equals("0000")) {
				%>
				<button type="button" class="btn btn-primary pull-left">수정</button>
				<button type="button" class="btn btn pull-left"
					onclick="location.href='notice_detailDeleteSave.jsp?idx=<%=data%>'">삭제</button>
				<%
					}
							}
				%>
				<button type="button" class="btn btn-normal pull-right"
					onclick="location.href='notice.jsp'">목록</button>
			</div>
		</div>
	</div>
	<%-- <jsp:include page="comment.jsp">
		<jsp:param value="<%=data%>" name="num" />
		<jsp:param value="<%=Gname%>" name="writer" />
	</jsp:include> --%>
	<p>
		<jsp:include page="bottom.jsp"></jsp:include>
		<%
			}
				msg = "update notice set readcount=" + total + " where num=" + data;
				ST.executeUpdate(msg);
				CN.close();

			} catch (Exception e) {
				System.out.println(e);
			}
		%>
	
</body>
</html>
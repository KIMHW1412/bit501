<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글작성</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/inputJS.js"></script>
<body>
	<%
		String writer = request.getParameter("writer");
	%>
	<jsp:include page="top.jsp"></jsp:include>
	<p>
	<div class="top_box" align="center">
		<h3>글쓰기</h3>
	</div>
	<p>
	<div class="container">
		<form name="writeform" action="notice_insertSave.jsp" method="get">
			<table class="table table-write">
				<colgroup>
					<col width="120px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<td class="text-center">제목</td>
						<td class="pull_input"><input type="text" size="120"
							id="subject" name="subject">
					</tr>
					<tr>
						<td class="text-center">내용</td>
						<td class="textarea"><textarea rows="14" cols="120"
								id="content" name="content"></textarea></td>
					</tr>
					<tr>
						<td class="text-center">작성자</td>
						<td id="writer"><%=writer%></td>
					</tr>
				</tbody>
			</table>
			<hr />
			<div class="huge-top" align="right">
				<button type="submit" class="btn btn-primary">작성하기</button>
				<button type="button" class="btn btn-normal"
					onclick="location.href='notice.jsp'">취소</button>
			</div>
		</form>
	</div>
</body>
</html>
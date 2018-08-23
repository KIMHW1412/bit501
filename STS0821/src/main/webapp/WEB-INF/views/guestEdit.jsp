<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>[guestEdit.jsp]</title>
<style type="text/css">
* {
	font-size: 20pt;
	font-weight: bold;
}

a {
	text-decoration: none;
	font-size: 20pt;
	font-weight: bold;
}

a:hover {
	text-decoration: underline;
	font-size: 26pt;
	font-weight: bold;
	color: red;
}
</style>
</head>
<body>
	<font color=blue> [guestEdit.jsp=preEdit.do] </font>
	<p>
	<form action="edit.do">
		수정사번:<input type="text" name="sabun" value="${dto.sabun}"
			readonly="readonly"> <br> 수정이름:<input type="text"
			name="name" value="${dto.name}"> <br> 수정제목:<input
			type="text" name="title" value="${dto.title}"> <br>
		수정급여:<input type="text" name="pay" value="24" value="${dto.pay}">
		<p>
			<input type="submit" value="스프링STS수정"> <input type="reset"
				value="수정취소">
	</form>

	<p>
		<a href="index.jsp">[index.jsp]</a> <a href="guest.do">[신규등록]</a>
</body>
</html>


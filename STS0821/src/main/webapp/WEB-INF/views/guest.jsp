<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>[board/guest.jsp]</title>
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
	<font color=blue> [guest.jsp=guest.do] </font>
	<p>
	<form action="insert.do">
		사번:<input type="text" name="sabun"> <br> 이름:<input
			type="text" name="name"> <br> 제목:<input type="text"
			name="title" value="snow"> <br> 급여:<input type="text"
			name="pay" value="24">
		<p>
			<input type="submit" value="스프링STS저장"> <input type="reset"
				value="데이타취소">
	</form>

	<p>
		<a href="index.jsp">[index.jsp]</a> <a href="guest.do">[신규등록]</a>
</body>
</html>


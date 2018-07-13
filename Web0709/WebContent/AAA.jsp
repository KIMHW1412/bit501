<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUTF-8">
<title>[AAA.jsp]</title>
<style type="text/css">
* {
	font-size: 24pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<font color="blue">[AAA.jsp 데이타를 보내는 문서]</font>
	<p>
	<form method="post" action="./BBB.jsp" enctype="multipart/form-data">
		제목:<input type="text" name="title" value="이순신"><br> 가격:<input
			type="text" name="pay" value="97"><br> 파일:<input
			type="file" name="file1"><br> <input type="submit"
			value="파일전송하기">
	</form>
</body>
</html>
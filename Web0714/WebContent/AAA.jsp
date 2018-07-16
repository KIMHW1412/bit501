<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[AAA.jsp]</title>
<style type="text/css">
* {
	font-size: 25pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<%
		int dan = 7;
		try {
			for (int i = 1; i < 10; i++) {
				out.println(dan + "*" + i + "=" + (dan * i) + " ");
			}
		} catch (Exception e) {
		}
	%>
	<br>
	<!-- jstl처음 시작 -->
	<c:set var="dan" value="3"></c:set>
	<c:catch>
		<c:forEach var="gugu" begin="1" end="9" step="1">
		${dan} * ${gugu} = ${dan*gugu}<Br>
		</c:forEach>
	</c:catch>
</body>
</html>
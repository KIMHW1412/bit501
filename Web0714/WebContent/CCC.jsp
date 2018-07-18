<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[CCC.jsp]</title>
<style type="text/css">
* {
	font-size: 25pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<%
		//String date = "2017//08//15";
		String date = "빨강, 주황, 초록, 파랑, 남색, 보라";
		String[] sp = date.split(",");
		for (int i = 0; i < sp.length; i++) {
			out.println(sp[i] + " ");
		}

		out.println("<br>");
		StringTokenizer st = new StringTokenizer(date, ",");
		int index = 0;
		while (st.hasMoreTokens() == true) {
			out.println(st.nextToken() + " ");
		}
	%>
	<br> JSTL태그 구문 테스트
	<br>
	<c:forTokens var="token" items="빨강, 주황, 초록, 파랑, 남색, 보라" delims=",">
		${token}&nbsp;
	</c:forTokens>
	<br> JSTL태그 if-else
	<br>
	<c:set var="car1" value="랜드로버"></c:set>
	<c:set var="car2" value="랜드로버"></c:set>
	<c:if test="${car1 == car2}">자동차는 랜드로버입니다.</c:if>
	<br>
	<c:if test="${car1 eq car2}">같은 브랜드 자동차입니다.</c:if>
</body>
</html>
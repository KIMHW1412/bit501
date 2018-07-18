<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="java.util.StringTokenizer"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[DDD.jsp]</title>
<style type="text/css">
* {
	font-size: 25pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<!-- DDD.jsp문서 JSTL태그  -->
	<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
	<fmt:formatDate value="${date}" type="date" pattern="yyyy년 MM월 dd일" />
	<br>
	<fmt:formatDate value="${date}" type="time" />
	<br>
	<fmt:formatNumber value="50000" type="currency" />
	<br>
	<fmt:formatNumber value="0.15" type="percent" />
	<br>
	<fmt:formatNumber value="50098760000" pattern="###,###,###" />
	<br>
	<fmt:formatNumber value="50098760000" pattern="###,###.##" />
	<br>
	<fmt:formatNumber value="50098760000" pattern="000,000.00" />
</body>
</html>
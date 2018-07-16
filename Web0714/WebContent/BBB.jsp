<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[BBB.jsp]</title>
<style type="text/css">
* {
	font-size: 25pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<c:set var="su" value="${37}"></c:set>
	<c:catch>
		<c:choose>
			<c:when test="${su>0 }">${su}숫자는 양수</c:when>
			<c:when test="${su==0 }">">${su}숫자는 제로</c:when>
			<c:when test="${su<0 }">">${su}숫자는 음수</c:when>
			<c:otherwise>숫자가 아닙니다.</c:otherwise>
		</c:choose>
	</c:catch>
	<br>
	<c:set var="car" value="모닝"></c:set>
	<c:if test="car==소나타">
		${car} 자동차는 현대차입니다.
	</c:if>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.hb.common.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>[guestList.jsp]</title>
<style type="text/css">
* {
	font-size: 16pt;
	font-weight: bold;
}

a {
	font-size: 16pt;
	color: blue;
	text-decoration: none;
}

a:hover {
	font-size: 16pt;
	color: green;
	text-decoration: none;
}

div.tit {
	font-size: 26pt;
	font-weight: bold;
	color: red;
}
</style>
<script type="text/javascript">
	function Enter_Check() {
		// 엔터키의 코드는 13입니다.
		if (event.keyCode == 13) {
			document.myform.submit(); // 실행할 이벤트
		}
	}
	function changeClear() {
		myform.keyword.value = "";
		myform.keyword.focus();
	}
	function loginCheck() {
		alert("로그인을 해주세요.");
		location.href = "login.jsp";
	}
</script>
</head>
<body>
	<table width=700 border=1 cellspacing="0">
		<c:choose>
			<c:when
				test="${skey == null || skey == '' || sval == null || sval == ''}">
				<tr align="right">
					<td colspan="6">레코드갯수 : ${Gtotal} &nbsp;&nbsp;</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr align="right">
					<td colspan="6">레코드검색갯수 : ${Gtotal} / ${Wtotal} &nbsp;&nbsp;</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr bgcolor="yellow">
			<td>No</td>
			<td>사번</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>급여</td>
		</tr>
		<c:forEach var="dto" items="${dto}">
			<tr>
				<td>${dto.rn}</td>
				<td>${dto.sabun}</td>
				<td>${dto.name}</td>
				<td><a href="detail.do?idx=${dto.sabun}">${dto.title}<c:if
							test="${dto.rcnt > 0}">
							<font color="red">&nbsp;[${dto.rcnt}]</font>
						</c:if></a></td>
				<td>${dto.nalja}</td>
				<td>${dto.pay}</td>
			</tr>
		</c:forEach>
		<tr align="center">
			<td colspan="6"><c:if test="${startpage > 10}">
					<a href="list.do?pageNum=${(startpage - 1)}${returnpage}">[이전]</a>
				</c:if> <c:catch>
					<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
						<c:choose>
							<c:when test="${pageNUM == i}">
								<font color="red">[${i}]</font>
							</c:when>
							<c:otherwise>
								<a href="list.do?pageNum=${i}${returnpage}">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:catch> <c:if test="${endpage < pagecount}">
					<a href="list.do?pageNum=${(startpage + 10)}${returnpage}">[다음]</a>
				</c:if></td>
		</tr>
		<tr>
			<td colspan="6">
				<div align="right">
					<form name=myform action="list.do" method="get"
						style="vertical-align: middle;">
						<select name="keyfield" onchange="changeClear()"
							style="vertical-align: middle;">
							<option value="All"
								<c:if test="${skey eq 'All' && !empty sval}">selected</c:if>>
								전체검색</option>
							<option value="name"
								<c:if test="${skey eq 'name' && !empty sval}">selected</c:if>>이름검색</option>
							<option value="title"
								<c:if test="${skey eq 'title' && !empty sval}">selected</c:if>>제목검색</option>
						</select> <input type="text" name="keyword" size=10 value="${sval}"
							style="vertical-align: middle;"><input type="submit"
							value="검 색" style="vertical-align: middle;">
					</form>
				</div>
			</td>
		</tr>
	</table>
	<br>
	<%
		if (session.getAttribute("naver") == null) {
	%>
	<button type="button" class="btn btn-primary"
		onclick="location.href='login.jsp'">로그인</button>
	<a href="main.jsp"> [index] </a>
	<a href="guestJoin.jsp"> [guestJoin] </a>
	<a href="list.do"> [guestList] </a>
	<%
		} else {
	%>
	<span> <font color="red"><%=session.getAttribute("naver")%></font>
		님 로그인 되었습니다.
	</span>
	<button type="button" class="btn btn-default"
		onclick="location.href='logoutSave.jsp'">로그아웃</button>
	<a href="main.jsp"> [index] </a>
	<a href="guestJoin.jsp"> [guestJoin] </a>
	<a href="list.do"> [guestList] </a>

	<%
		}
	%>
</body>
</html>


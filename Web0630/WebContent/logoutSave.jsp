<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[logoutSave.jsp]</title>
</head>
<body>
	<%
		session = request.getSession(false);
		session.invalidate(); //모든 세션정보 삭제
	%>
	<script type="text/javascript">
		alert("로그아웃 되었습니다.");
		location.href = "index.jsp";
	</script>

</body>
</html>






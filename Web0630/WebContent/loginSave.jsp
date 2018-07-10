<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="ssi.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[loginSave.jsp]</title>
</head>
<body>

	<%
		try {
			//loginSave.jsp단독실행하면 에러발생
			String sabun = request.getParameter("sabun");
			String pwd = request.getParameter("pwd");
			msg = "select count(*) as cnt from bbs where b_sabun=? and b_pwd=?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, sabun);
			PST.setString(2, pwd);
			RS = PST.executeQuery();
			RS.next();
			Gtotal = RS.getInt("cnt");
			if (Gtotal > 0) {
	%>
	<script type="text/javascript">
		alert("로그인이 되었습니다.");
		location.href = "list.jsp";
	</script>
	<%
		session.setAttribute("naver", sabun);

			} else {
	%>
	<script type="text/javascript">
		alert("존재하지 않는 아이디입니다.");
		location.href = "login.jsp";
		loginform.sabun.value = "";
		loginform.sabun.focus();
	</script>
	<%
		}
		} catch (Exception e) {
			out.println(e);
		}
	%>

</body>
</html>









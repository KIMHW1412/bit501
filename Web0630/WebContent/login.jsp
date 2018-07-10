<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 로그인</title>
<link rel="stylesheet" type="text/css" href="css/loginCSS.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
	function login() {
		var sabun = loginform.sabun.value;
		var pwd = loginform.pwd.value;
		if (sabun == "" || sabun == null) {
			document.getElementById("sabun1").innerHTML = "<font color='red'>아이디를 입력해주세요.</font>";
			loginform.sabun.focus();
			return false;
		} else {
			document.getElementById("sabun1").innerHTML = "";
		}
		if (pwd == "" || pwd == null) {
			document.getElementById("pwd1").innerHTML = "<font color='red'>비밀번호를 입력해주세요.</font>";
			loginform.pwd.focus();
			return false;
		} else {
			document.getElementById("pwd1").innerHTML = "";
		}
		document.loginform.submit();
	}
	function Enter_Check() {
		// 엔터키의 코드는 13입니다.
		if (event.keyCode == 13) {
			login(); // 실행할 이벤트
		}
	}
</script>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<div class="wrapper">
		<form class="form-signin" name="loginform" method="post"
			onsubmit="login(); return false;" action="loginSave.jsp">
			<h2 class="form-signin-heading">회원 로그인</h2>
			<input type="text" class="form-control" name="sabun"
				placeholder="사원번호" /><label id="sabun1"></label> <input
				type="password" class="form-control" name="pwd" placeholder="비밀번호" />
			<label id="pwd1"></label>
			<!-- <label class="checkbox">
				<input type="checkbox" value="remember-me" id="rememberMe"
				name="rememberMe">  -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
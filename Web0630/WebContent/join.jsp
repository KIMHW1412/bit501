<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니 회원가입</title>
<link rel="stylesheet" type="text/css" href="css/inputcss.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/inputJS.js"></script>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<p>
	<div class="container">
		<div class="all" align="center">
			<div class="title">
				<br>입력화면
			</div>
			<div class="cf" style="color: red;">
				<br>* 표는 필수 입력
			</div>
			<form name="iform" method="post" onsubmit="check(); return false;"
				enctype="multipart/form-data" action="joinSave.jsp">
				<table class="table1">
					<tr>
						<th>* 사번</th>
						<td><input type="text" size="10" name="sabun"
							onkeyup="checklen(this,4)" placeholder="숫자4자리"> <input
							type="button" onclick="checkSb()" value="중복확인"> <label
							id="sabunlabel"></label></td>
						<td rowspan="3">
							<div id="preview" style="width: 50px; height: 50px;"></div>
						</td>
					</tr>
					<tr>
						<th>* 이름</th>
						<td><input type="text" name="name"
							onkeyup="checklen(this,15)"></td>
					</tr>
					<tr>
						<th>* 비밀번호</th>
						<td><input type="password" name="pwd"
							onkeyup="checklen(this,10)"></td>
					</tr>
					<tr>
						<th>* 비밀번호 확인</th>
						<td><input type="password" name="pwd2" onkeyup="checkPwd()">
							<label id="pwdlabel">&nbsp;&nbsp;비밀번호를 한번 더 입력해주세요.</label></td>
						<td style="max-width: 100%; max-height: 100%;"><input
							type="file" id="file" name="file" onchange="handleFileSelect()"></td>
					</tr>
					<tr>
						<th>* 주소</th>
						<td colspan="2"><input type="text" size="10" id="code"
							name="code" readonly="readonly"> <input type="button"
							onclick="DaumPostcode()" value="우편번호">
							<p>
								<input type="text" size="40" id="juso1" name="juso1"
									readonly="readonly">
							<p>
								<input type="text" size="40" id="juso2" name="juso2"
									onkeyup="checklen(this,30)">&nbsp;&nbsp;상세주소를 입력하세요.<br></td>
					</tr>
					<tr>
						<th>* 전화번호</th>
						<td colspan="2"><input type="text" size="4" name="num1"
							onchange="num()" maxlength="4"> - <input type="text"
							size="4" name="num2" onchange="num()" maxlength="4"> - <input
							type="text" size="4" name="num3" onchange="num()" maxlength="4">&nbsp;
							<label id="numlabel">&nbsp;&nbsp;숫자 3~4자리 입력하세요.</label></td>
					</tr>
					<tr>
						<th>* Email</th>
						<td colspan="2"><input type="text" size="40" name="email"
							onblur="emailcheck()" onkeyup="checklen(this,30)"
							placeholder="aaa@aaa.aa형식으로 입력"> <span id="email_ch"></span>
						</td>
					</tr>
					<tr>
						<th>URL</th>
						<td colspan="2"><input type="text" size="40" name="url"
							onkeyup="checklen(this,20)"></td>
					</tr>
					<tr>
						<th>* 제목</th>
						<td colspan="2"><input type="text" size="40" name="title"
							onkeyup="checklen(this,30)" maxlength="30"></td>
					</tr>
					<tr>
						<th>* 내용</th>
						<td colspan="2"><textarea name="content" id="content"
								onkeyup="checklen(this,30)" rows="5" cols="40"></textarea></td>
					</tr>
				</table>
				<p>
					<button type="submit" class="btn btn-primary">회 원 가 입</button>
					&nbsp;&nbsp;
					<button type="reset" class="btn" onclick="location.href='list.jsp'">취
						소</button>
			</form>
		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
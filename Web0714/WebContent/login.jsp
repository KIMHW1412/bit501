<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[login.jsp]</title>
<style type="text/css">
input, b {
	font-size: 20pt;
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

#LOG-IN {
	font-size: 26pt;
	font-weight: bold;
	background-color: #FFD700;
	height: 120;
}
</style>

<script type="text/javascript">
	var xhr; // 전역변수

	function first() {
		return new XMLHttpRequest();
	}

	function two() {
		//var a = myform.userid.value;
		//var b = myform.pwd.value;
		var a = document.getElementById("userid").value;
		var b = document.getElementById("pwd").value;
		//alert("id=" + a + " pwd=" + b);
		var url = "login.do?uid=" + a + "&upwd=" + b;
		xhr = first();
		xhr.onreadystatechane = disp;
		xhr.open("post", url, true);
		xhr.send(null);
		alert(url);
	}

	function disp() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var massage = xhr.responseText;
			document.getElementById("msg").innerHTML = message;
		}
	}
</script>
</head>
<body>
	<div id="msg">
		<font size=7 color=blue> [login.jsp] </font>
		<p>
		<form name="myform">
			<table width="550" border="1" cellspacing="0">
				<tr>
					<td width=350><b>userid: </b></td>
					<td><input type="text" id="userid" name="userid" value="bit"></td>

					<td rowspan=2 align="center"><input type="button"
						value="LOG-IN" id="LOG-IN" onclick="two()"></td>
				</tr>
				<tr>
					<td width=350><b>userpw: </b></td>
					<td><input type="password" id="pwd" name="pwd" value="1234"></td>
				</tr>
			</table>
		</form>
	</div>
	<P>
		<a href="main.jsp">[시작화면]</a> <a href="guestJoin.jsp">[등록화면]</a> <a
			href="list.do">[전체목록]</a>
</body>
</html>


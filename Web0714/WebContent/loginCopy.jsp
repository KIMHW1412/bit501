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
	background-color: "#FFD700";
	height: 120;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
	<font size=7 color=blue> [login.jsp] </font>
	<p>
	<form action="login.do" method="post">
		<table width="550" border="1" cellspacing="0">
			<tr>
				<td width=350><b>userid: </b></td>
				<td><input type="text" name="userid"></td>

				<td rowspan=2 align="center"><input type="submit"
					value="LOG-IN" id="LOG-IN"></td>
			</tr>
			<tr>
				<td width=350><b>userpw: </b></td>
				<td><input type="password" name="pwd" value="1234"></td>
			</tr>
		</table>
	</form>

	<P>
		<a href="main.jsp">[시작화면]</a> <a href="guestJoin.jsp">[등록화면]</a> <a
			href="list.do">[전체목록]</a>
</body>
</html>


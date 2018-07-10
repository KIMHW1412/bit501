<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[openID.jsp]</title>
<style type="text/css">
* {
	font-size: 10pt;
	font-weight: bold;
}
</style>

<script type="text/javascript">
	function send() {
		subform.sabun.value = opener.iform.sabun.value;
	}//send end
</script>

</head>
<body bgcolor="pink" onload="send();">
	<!-- openID.jsp -->
	<p>
	<div align="center">
		<form name="subform" action="openIDSave.jsp">
			데이터 : <input type=text name="sabun"> <input type=submit
				value="중복처리">
		</form>
	</div>
</body>
</html>







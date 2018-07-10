<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[cookieindex.jsp]</title>
</head>
<script type="text/javascript">
	function openPopup() {
		var value = getCookie("notice_popup_disabled");
		if (value != 'disabled') {
			open(
					"cookiepopup.jsp",
					"bc",
					"width=350, height=500, left=300, top=200, resizable=no, status=no, scrollbar=no, location=no;");
		}
	}

	function setCookie(name, value, msec) {
		var expire = new Date();
		expire.setTime(expire.getTime() + msec);
		//var cookies = name + '=' + value + '; path=/';
		var cookies = name + '=' + value + '; path=/';
		if (typeof msec != 'undefined') {
			cookies += '; expires=' + expire.toUTCString() + ';';
		}
		alert(expire.toUTCString());
		document.cookie = cookies;
	}

	function getCookie(name) {
		name += '=';
		var cookie = document.cookie;
		var start = cookie.indexOf(name);
		var value = '';
		if (start != -1) {
			start += name.length;
			var end = cookie.indexOf(';', start);
			if (end == -1) {
				end = cookie.length;
			}
			value = cookie.substring(start, end);
		}
		//return unescape(value);
		return value;
	}

	function disablePopupOpen(flag) {
		if (flag == false) {
			return;
		}
		setCookie("notice_popup_disabled", "disabled", 10000); //10초동안
	}
</script>
<body onload="openPopup();">
	<div align="center">
		<img alt="images/a4.png" src="images/a4.png">
		<p>
			<font size="7" color="blue"><b> Waiting...Loading...</b></font>
	</div>
</body>
</html>
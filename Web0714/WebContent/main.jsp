<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[main.jsp]</title>
</head>
<body>
	<%
		String msg = "";
		Cookie[] ck = request.getCookies();
		if (ck != null) {
			for (int i = 0; i < ck.length; i++) {
				if (ck[i].getName().equals("daum")) {
					msg = ck[i].getValue();
				} else {
				}
			}
		}
	%>
	<div align="center" style="margin-top: 100px;">
		<%@  include file="header.jsp"%>
		<span><img alt="메인" src="images/daum.png"> </span> <span>
			<img alt="메인" src="images/google.jpg">
		</span><span> <img alt="메인" src="images/naver.gif"><br> <input
			type="text" value="<%=msg%>님 방문을 환영합니다">
		</span> <br>
		<%@  include file="footer.jsp"%>
	</div>
</body>
</html>
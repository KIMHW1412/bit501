<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>[loginList.jsp]</title>
<style type="text/css">
* {
	font-size: 24pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<h1>[loginList.jsp]</h1>
	<p>
		<%
			try {
				//loginSave.jsp단독실행하면 에러발생
				String a = request.getParameter("userid");
				String b = request.getParameter("pwd");
				msg = "select count(*) as Lcnt from login where userid=? and pwd=?";
				//msg = "select count(*) as Lcnt from login where userid = " + a + " pwd = " + b; // ST sql문
				PST = CN.prepareStatement(msg);
				PST.setString(1, a);
				PST.setString(2, b);
				RS = PST.executeQuery(); //executeUpdate( )=>insert,delete,update

				if (RS.next() == true) {
					total = RS.getInt("Lcnt");
					if (total > 0) {
						System.out.println("userid=" + a + "\tpwd=" + b);
						//session.setAttribute("naver", usera);
						//response.sendRedirect("cookieindex.jsp"); //guestList.jsp	  
						//세션설정 주석처리

						//C:\Users\1027\AppData\Roaming\Microsoft\Windows\Cookies
						//C:\Users\hb\AppData\Local\Microsoft\Windows\INetCookies
						Cookie ck = new Cookie("daum", a); //쿠키는 response로 add추가
						ck.setMaxAge(60);
						response.addCookie(ck);
						System.out.println(a + "쿠키가 등록되었습니다.");
						//response.sendRedirect("main.jsp");
						response.sendRedirect("cookieindex.jsp");
					} else {
						System.out.println("다시 로그인을 하세요.");
						response.sendRedirect("login.jsp"); //login.jsp이동	  
					}
				}
			} catch (Exception e) {
				System.out.println("error=" + e);
			}
		%>
	
</body>
</html>






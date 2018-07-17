<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>

<html>
<head>
<title>[loginSave.jsp]</title>
<style type="text/css">
b, a {
	text-decoration: none;
	font-size: 20pt;
	font-weight: bold;
}

a:hover {
	color: red;
	font-size: 34pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<font size=7> <b> [loginSave.jsp] </b></font>
	<p>
		<%
			//loginSave.jsp단독실행하면 에러발생
			String usera = request.getParameter("userid");
			String userb = request.getParameter("pwd");
			msg = "select count(*) as Lcnt from login where userid=? and pwd=?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, usera);
			PST.setString(2, userb);
			RS = PST.executeQuery(); //executeUpdate( )=>insert,delete,update
			RS.next();
			total = RS.getInt("Lcnt");

			if (total > 0) {
				session.setAttribute("naver", usera);
				System.out.println("session.setAttribute(naver, usera)아이디=" + usera);
				response.sendRedirect("list.do"); //guestList.jsp	  
			} else {
				response.sendRedirect("login.jsp"); //login.jsp이동	  
			}
		%>
	
	<p>
		<a href="main.jsp">[index.jsp]</a> <a href="guestJoin.jsp">[등록화면]</a> <a
			href="list.do">[전체목록]</a>
</body>
</html>






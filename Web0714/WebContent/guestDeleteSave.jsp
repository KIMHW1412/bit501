<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestDeleteSave.jsp]</title>
<style type="text/css">
* {
	font-size: 20pt;
	font-weight: bold;
}

a {
	text-decoration: none;
	font-size: 20pt;
	color: red;
}

a:hover {
	text-decoration: underline;
	font-size: 26pt;
	color: green;
}
</style>
</head>
<body>
	<font color=blue> guestDeleteSave.jsp </font>
	<p>
		<%
			try { //guestDeleteSave.jsp 단독실행하면 에러발생
				data = request.getParameter("idx");
				msg = "delete from guest where sabun =  " + data;
				ST = CN.createStatement();
				ST.executeUpdate(msg); //select~쿼리문 ST.executeQuery(msg)
				System.out.println(msg);
				System.out.println(data + " 사번 삭제성공성공");
				response.sendRedirect("guestList.jsp");
			} catch (Exception e) {
				System.out.println("삭제실패에러 " + e);
				response.sendRedirect("guestList.jsp");
			}
		%>
	
</body>
</html>









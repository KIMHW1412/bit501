<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestEditSave.jsp]</title>
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
	<font color=blue> guestEditSave.jsp </font>
	<p>
		<%
			try { //단독실행하면 에러발생
					//guestEdit.jsp문서에서 수정한 데이터 받아오기
				a = Integer.parseInt(request.getParameter("sabun"));
				b = request.getParameter("name");
				c = request.getParameter("title");
				d = Integer.parseInt(request.getParameter("pay"));
				msg = "update guest set name=?,title=?,nalja=sysdate,pay=? where sabun=? ";
				PST = CN.prepareStatement(msg);
				PST.setString(1, b);
				PST.setString(2, c);
				PST.setInt(3, d);
				PST.setInt(4, a);
				PST.executeUpdate();

				System.out.println("PreparedStatement 수정처리 성공");
				response.sendRedirect("guestList.jsp");
			} catch (Exception e) {
				System.out.println("수정저장실패에러 " + e);
				response.sendRedirect("guestList.jsp");
			}
		%>
	
</body>
</html>









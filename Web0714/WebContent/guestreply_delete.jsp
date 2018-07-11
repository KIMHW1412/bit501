<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestreply_delete.jsp]</title>

</head>
<body>
	<%
		try {
			int sb = Integer.parseInt(request.getParameter("idx"));
			int num = Integer.parseInt(request.getParameter("num"));

			System.out.println("guestreply_delete.jsp문서 사번 idx=" + sb);
			System.out.println("guestreply_delete.jsp문서 사번 num=" + num);

			msg = "delete from guestreply where num = " + num;
			ST = CN.createStatement();
			ST.executeUpdate(msg);
			System.out.println("댓글삭제 성공");
			response.sendRedirect("guestDetail.jsp?idx=" + sb);
		} catch (Exception e) {
		}
	%>
</body>
</html>









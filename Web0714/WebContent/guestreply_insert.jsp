<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi2.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestreply_insert.jsp]</title>

</head>
<body>
	<%
		String wr = request.getParameter("writer"); //댓글 쓴 사람
		String ct = request.getParameter("content"); //댓글 내용
		int sb = Integer.parseInt(request.getParameter("sabun")); //댓글 참조 사번hidden

		System.out.println("guestreply_insert.jsp문서 사번 sb=" + sb);
		msg = "insert into guestreply values(guestreply_seq.nextval, ?, ?, ?)";
		PST = CN.prepareStatement(msg);
		PST.setString(1, wr);
		PST.setString(2, ct);
		PST.setInt(3, sb);
		PST.executeUpdate();
		response.sendRedirect("guestDetail.jsp?idx=" + sb);
	%>
</body>
</html>









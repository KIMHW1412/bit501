<%@page import="java.nio.channels.WritePendingException"%>
<%@page import="java.io.Writer"%>
<%@page import="org.apache.tomcat.util.http.fileupload.UploadContext"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String wr = request.getParameter("writer"); //댓글 쓴 사람
		String ct = request.getParameter("comment"); //댓글 내용
		int num = Integer.parseInt(request.getParameter("num")); //댓글 참조 사번hidden

		msg = "insert into comments values(com_seq.nextval, ?, ?, ?, sysdate)";
		PST = CN.prepareStatement(msg);
		PST.setInt(1, num);
		PST.setString(2, wr);
		PST.setString(3, ct);
		PST.executeUpdate();
		response.sendRedirect("detail.jsp?idx=" + num);
	%>

</body>
</html>









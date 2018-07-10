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
	<p>
		<!-- 나중에 단독실행하면 에러발생 -->
		<%
			try {

				String writer = (String) session.getAttribute("naver");
				String subject = request.getParameter("subject");
				String content = request.getParameter("content");
				String readcount = "0";

				msg = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,?)";
				PST = CN.prepareStatement(msg);
				PST.setString(1, writer);
				PST.setString(2, subject);
				PST.setString(3, content);
				PST.setString(4, readcount);

				int flag = PST.executeUpdate(); //executeUpdate(msg)에러발생
				if (flag > 0) {
					System.out.println("PreparedStatement 저장성공");
					CN.commit();
					response.sendRedirect("notice.jsp");
				}
			} catch (Exception e) {
				System.out.println("저장실패에러 " + e);
				response.sendRedirect("index.jsp");
			}
		%>
	
</body>
</html>









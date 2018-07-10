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
				String path = application.getRealPath("storage");
				if (!new File(path).isDirectory()) {
					new File(path).mkdirs();
				}

				Gsize = 1024 * 1024 * 10;

				MultipartRequest mr = new MultipartRequest(request, path, Gsize, "UTF-8",
						new DefaultFileRenamePolicy());

				String writer = (String) session.getAttribute("naver");
				String subject = mr.getParameter("subject");
				String content = mr.getParameter("content");
				String readcount = "0";

				String original = mr.getOriginalFileName("file1");
				Gfile = mr.getFilesystemName("file1");

				File ff = mr.getFile("file1");

				if (ff.exists()) {
					ff = new File(original + "." + System.currentTimeMillis());
				}
				Gsize = (int) ff.length();

				msg = "insert into board2 values(board2_seq.nextval,?,?,?,sysdate,?,?)";
				PST = CN.prepareStatement(msg);
				PST.setString(1, writer);
				PST.setString(2, subject);
				PST.setString(3, content);
				PST.setString(4, readcount);
				PST.setString(5, Gfile);

				int flag = PST.executeUpdate(); //executeUpdate(msg)에러발생
				if(flag > 0) {
				System.out.println("PreparedStatement 저장성공");
				CN.commit();
				response.sendRedirect("list.jsp");
				}
			} catch (Exception e) {
				System.out.println("저장실패에러 " + e);
				response.sendRedirect("index.jsp");
			}
		%>
	
</body>
</html>









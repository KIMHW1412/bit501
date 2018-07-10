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

				Gsabun = Integer.parseInt(mr.getParameter("sabun"));
				Gname = mr.getParameter("name");
				Gpwd = mr.getParameter("pwd");
				Gfile = mr.getParameter("file");
				Gjuso1 = mr.getParameter("juso1");
				Gjuso2 = mr.getParameter("juso2");
				String num1 = mr.getParameter("num1");
				String num2 = mr.getParameter("num2");
				String num3 = mr.getParameter("num3");
				Gphone = num1 + "-" + num2 + "-" + num3;
				Gemail = mr.getParameter("email");
				Gurl = mr.getParameter("url");
				Gtitle = mr.getParameter("title");
				Gcontent = mr.getParameter("content");

				String original = mr.getOriginalFileName("file");
				Gfile = mr.getFilesystemName("file");

				File ff = mr.getFile("file");

				if (ff.exists()) {
					ff = new File(original + "." + System.currentTimeMillis());
				}
				Gsize = (int) ff.length();

				msg = "insert into bbs(b_no,b_sabun,b_name,b_title,b_content,b_phone,b_pwd,b_wdate,b_juso1,b_juso2,b_email,b_url,b_file1,b_size1)"
						+ " values(bbs_seq.nextval,?,?,?,?,?,?,sysdate,?,?,?,?,?,?)";
				PST = CN.prepareStatement(msg);
				PST.setInt(1, Gsabun);
				PST.setString(2, Gname);
				PST.setString(3, Gtitle);
				PST.setString(4, Gcontent);
				PST.setString(5, Gphone);
				PST.setString(6, Gpwd);
				PST.setString(7, Gjuso1);
				PST.setString(8, Gjuso2);
				PST.setString(9, Gemail);
				PST.setString(10, Gurl);
				PST.setString(11, Gfile);
				PST.setInt(12, Gsize);
				PST.executeUpdate(); //executeUpdate(msg)에러발생
				System.out.println("PreparedStatement 저장성공");
				
				response.sendRedirect("list.jsp");
			} catch (Exception e) {
				System.out.println("저장실패에러 " + e);
				response.sendRedirect("index.jsp");
			}
		%>
	
</body>
</html>









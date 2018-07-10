<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[fileDownload.jsp]</title>
</head>
<body>
	<!-- fileDownload.jsp -->
	<%
		String data = request.getParameter("fileName");
		out.println("넘어온그림파일fileName=" + data + "<br>");

		String path = application.getRealPath("/storage");
		File file = new File(path, data);

		//파일다운로드처리 1)헤더변경 2)io처리 읽기후쓰기
		response.setHeader("Content-Disposition", "attachment; filename=" + data);

		try {

			out.clear();
			out = pageContext.pushBody();
			InputStream is = new FileInputStream(file); //읽기
			OutputStream os = response.getOutputStream(); //쓰기는 response이용

			byte[] b = new byte[(int) file.length()];//권장함
			is.read(b, 0, b.length); //b.length배열의 길이
			os.write(b);

			os.close(); // 꼭 close
			is.close(); //꼭 close
		} catch (Exception e) {
			System.out.println("다운에러:" + e);
		}
	%>
</body>
</html>
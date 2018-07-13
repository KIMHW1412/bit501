<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUTF-8">
<title>[BBB.jsp]</title>
<style type="text/css">
* {
	font-size: 24pt;
	font-weight: bold;
}
</style>
</head>
<body>
	[BBB.jsp 데이타를 받는 문서]
	<p>
		<%
			request.setCharacterEncoding("UTF-8");

			if (FileUpload.isMultipartContent(request)) {
				//String tempDIr = apllication.getRealPath("./temp");
				String upDir = application
						.getRealPath("./storage");
				DiskFileUpload dfu = new DiskFileUpload();
				/* File isDir = new File(upDir);
				if (!isDir.isDirectory()) {
					isDir.mkdir();
				} */

				//처음업로드한 파일이 아니면 메모리에저장
				dfu.setRepositoryPath(upDir);
				dfu.setSizeMax(1024 * 1024 * 100); // 1메가까지 업로드가능
				dfu.setSizeThreshold(1024 * 1024); // 한번에 100k까지만 메모리저장

				if (request.getContentLength() < dfu.getSizeMax()) {
					List fList = dfu.parseRequest(request);
					int size = fList.size();
					for (int i = 0; i < fList.size(); i++) {
						FileItem fileItem = (FileItem) fList.get(i);
						if (fileItem.isFormField() == true) {
							//out.println("제목:" + fileitem.getFieldName() + "=" + fileitem.getString()+"<br>");
							out.println("제목:" + fileItem.getFieldName() + "=" + fileItem.getString("UTF-8") + "<br>");
						} else {
							out.println("파일:" + fileItem.getFieldName() + "=" + fileItem.getName());
							out.println("(" + fileItem.getSize() + "Byte)<br>");

							if (fileItem.isInMemory() == true) {
								//out.println("메모리에 저장<br>");
								System.out.println(upDir);
							} else {
								out.println("디스크에 저장<br>");
							}

							if (fileItem.getSize() > 0) {
								System.out.println("getName()=" + fileItem.getName());
								int idx = fileItem.getName().lastIndexOf("\\");
								if (idx == -1) {
									idx = fileItem.getName().lastIndexOf("/");
								}
								String fileName = fileItem.getName().substring(idx + 1);
								System.out.println("idx=" + idx + " fileName=" + fileName + "\n");

								//String fileName = fileitem.getName();
								//System.out.println("fileName=" + fileName + "\n");

								try {
									File file = new File(upDir, fileName);
									fileItem.write(file);
								} catch (Exception e) {
									out.println("error:" + e);
								}
							}
						}
					}
				} else {
					int overSize = (request.getContentLength() / 1000000);
					System.out.println("파일의크기는 " + overSize + " MB");
				} // size비교 else end
			} else {
				out.println("인코딩타입이 multipart/form-data가 아닙니다");
			}
		%>
	
	<p>
		<a href="AAA.jsp">[AAA]</a> <a href="index.jsp">[index]</a> <a
			href="guestList.jsp">[전체출력]</a>
</body>
</html>
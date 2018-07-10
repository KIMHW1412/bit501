<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestreply_delete.jsp]</title>

</head>
<body>
	<%
		try {
			int idx = Integer.parseInt(request.getParameter("idx"));
			int num = Integer.parseInt(request.getParameter("num"));

			msg = "delete from comments where c_num = " + num;
			ST = CN.createStatement();
			int flag = ST.executeUpdate(msg);
			if (flag > 0) {
				CN.commit();
	%>
	<script type="text/javascript">
		confirm("정말 삭제 하시겠습니까?");
		location.href = "detail.jsp?idx=" +
	<%=idx%>
		;
	</script>
	<%
		}
			System.out.println("댓글삭제 성공");
		} catch (Exception e) {
			response.sendRedirect("list.jsp");
		}
	%>
</body>
</html>









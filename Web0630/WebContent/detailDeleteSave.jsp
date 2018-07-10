<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<font color=blue> guestDeleteSave.jsp </font>
	<p>
		<%
			try { //guestDeleteSave.jsp 단독실행하면 에러발생
				data = request.getParameter("idx");
				msg = "delete from board2 where num =  " + data;
				ST = CN.createStatement();
				int flag = ST.executeUpdate(msg); //select~쿼리문 ST.executeQuery(msg)
				if (flag > 0) {
					CN.commit();
		%>
		<script type="text/javascript">
			confirm("정말 삭제 하시겠습니까?");
			location.href = "list.jsp";
		</script>
		<%
			}
				System.out.println(data + " 사번 삭제성공성공");
			} catch (Exception e) {
				System.out.println("삭제실패에러 " + e);
				response.sendRedirect("detail.jsp?idx=" + data);
			}
		%>
	
</body>
</html>









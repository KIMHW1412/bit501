<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%!int Rnum, Rsabun, Rdata;
	String Rwriter, Rcontent;%>
	<%
		//<jsp:param name="Gsabun"/>
		Rdata = Integer.parseInt(request.getParameter("num"));
		String my = (String) session.getAttribute("naver");
		if (my == null) {
			try {
				msg3 = "select b.num, c.c_num, c.c_board2, c.c_writer, c.c_comment, c.c_date "
						+ "from board2 b inner join comments c " + "on b.num=c.c_board2 and c.c_board2=" + Rdata;
				ST3 = CN.createStatement();
				RS3 = ST3.executeQuery(msg3);
				while (RS3.next() == true) {
					Rnum = RS3.getInt("c_num"); //시퀀스글번호
					Rwriter = RS3.getString("c_writer");
					Rcontent = RS3.getString("c_comment");
					Gnalja = RS3.getDate("c_date");
	%>

	<div class="container">
		<table class="table">
			<h6>
				<strong>작성자:<%=Rwriter%></strong>&nbsp;&nbsp;<strong>작성일:<%=Gnalja%></strong>
			</h6>
			<tr>
				<td><%=Rcontent%></td>
			</tr>
		</table>
	</div>

	<%
		}
			} catch (Exception e) {
				System.out.println("에러2" + e);
			}
	%>
	<%
		} else {
	%>
	<div class="container">
		<form method="get" action="commentSave.jsp">
			<input type="hidden" name="num" value="<%=Rdata%>"> <input
				type="hidden" name="writer" value="<%=my%>"> <br>
			<div>
				<span><strong>Comments</strong></span> <span id="cCnt"></span>
			</div>
			<div>
				<table class="table">
					<tr>
						<td align="center"><%=my%></td>
						<td><textarea style="width: 1000px" rows="3" cols="30"
								id="comment" name="comment"></textarea> <br></td>
						<td>
							<button class="btn pull-right" type="submit">등록</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<%
		try {
				msg3 = "select b.num, c.c_num, c.c_board2, c.c_writer, c.c_comment, c.c_date "
						+ "from board2 b inner join comments c " + "on b.num=c.c_board2 and c.c_board2=" + Rdata;
				ST3 = CN.createStatement();
				RS3 = ST3.executeQuery(msg3);
				while (RS3.next() == true) {
					Rnum = RS3.getInt("c_num"); //시퀀스글번호
					Rwriter = RS3.getString("c_writer");
					Rcontent = RS3.getString("c_comment");
					Gnalja = RS3.getDate("c_date");
	%>

	<div class="container">
		<table class="table">
			<h6>
				<strong>작성자:<%=Rwriter%></strong>&nbsp;&nbsp;<strong>작성일:<%=Gnalja%></strong>
			</h6>
			<tr>
				<td><%=Rcontent%></td>
				<%
					if (my.equals(Rwriter)) {
				%>
				<td>
					<button class="btn pull-right" type="button"
						onclick="location.href='commentDeleteSave.jsp?idx=<%=Rdata%>&num=<%=Rnum%>'">삭제</button>
				</td>
				<%
					}
				%>
			</tr>
		</table>
	</div>

	<%
		}

			} catch (Exception e) {
				System.out.println("에러2" + e);
			}
		}
	%>
</body>
</html>
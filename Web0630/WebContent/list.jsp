<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 게시판</title>
<link rel="stylesheet" type="text/css" href="css/inputcss.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/inputJS.js"></script>

<script type="text/javascript">
	function Enter_Check() {
		// 엔터키의 코드는 13입니다.
		if (event.keyCode == 13) {
			document.searchform.submit(); // 실행할 이벤트
		}
	}
	function changeClear() {
		searchform.keyword.value = "";
		searchform.keyword.focus();
	}
	function loginCheck() {
		alert("로그인을 해주세요.");
		location.href = "login.jsp";
	}
</script>
<body>

	<jsp:include page="top.jsp"></jsp:include>
	<p>
	<div class="container">
		<div class="all" align="center">
			<p>
			<table class="table table-striped table-hover">
				<colgroup>
					<col width="7%">
					<col width="7%">
					<col width="*">
					<col width="10%">
					<col width="15%">
					<col width="7%">
				</colgroup>
				<thead>
					<tr class="text-success bg-info">
						<th style="text-align: center;">No</th>
						<th style="text-align: center;">이미지</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">작성일</th>
						<th style="text-align: center;">조회수</th>
					</tr>
					<%
						try {
							msg2 = "select rownum rn, n.* from notice n order by rn desc";
							ST2 = CN.createStatement();
							RS2 = ST2.executeQuery(msg2);

							while (RS2.next() == true) {
								int num1 = RS2.getInt("num");
					%>
					<tr class="text-success bg-danger">
						<th class="text-info" style="text-align: center;">공지사항</th>
						<td></td>
						<td><a href="noticeDetail.jsp?idx=<%=num1%>"
							style="text-decoration: none" class="text-info"><%=RS2.getString("subject")%></a></td>
						<td style="text-align: center;" class="text-info"><%=RS2.getString("writer")%></td>
						<td style="text-align: center;" class="text-info"><%=RS2.getDate("reg_date")%></td>
						<td style="text-align: center;" class="text-info"><%=RS2.getInt("readcount")%></td>
					</tr>
					<%
						}
						} catch (Exception e) {
							out.println(e);
						}
					%>
				</thead>
				<tbody>
					<%
						String sqry = "";
						String skey = "", sval = "", returnpage = "";
						skey = request.getParameter("keyfield");
						sval = request.getParameter("keyword");

						if (skey == null || skey == "" || sval == null || sval == "") {
							sqry = "where writer like '%%'";
							skey = "";
							sval = "";
						} else {
							sqry = "where " + skey + " like '%" + sval + "%'";
						}

						returnpage = "&keyfield=" + skey + "&keyword=" + sval;

						try {
							ST = CN.createStatement();
							msg3 = "select count(*) as cnt from board2";
							RS = ST.executeQuery(msg3);
							if (RS.next() == true) {
								Gtotal = RS.getInt("cnt");
							}
						} catch (Exception e) {
							System.out.println(e);
						}

						int start = 0, end = 0;
						int pagecount = 0, temp = 0, startpage = 1, endpage = 10;
						String pnum = "1";
						int pageNUM = 1;

						pnum = request.getParameter("pageNum");
						if (pnum == null || pnum == "") {
							pnum = "1";
						}

						pageNUM = Integer.parseInt(pnum);

						start = (pageNUM - 1) * 10 + 1;
						end = pageNUM * 10;

						if (Gtotal % 10 == 0) {
							pagecount = Gtotal / 10;
						} else {
							pagecount = (Gtotal / 10) + 1;
						}

						temp = (pageNUM - 1) % 10;
						startpage = pageNUM - temp;
						endpage = startpage + 9;

						if (endpage > pagecount) {
							endpage = pagecount;
						}

						try {
							String x = " select * from ( ";
							//String c = "select num,writer,subject,content,reg_date,readcount,null as filename from notice union all ";
							String y = "select rownum rn, num,writer,subject,content,reg_date,readcount,filename from ";
							String m = " (select * from board2 " + sqry + " order by reg_date desc ) ";
							String z = ") where rn between " + start + " and " + end;//+ " order by rn desc";
							msg = x + y + m + z;
							ST = CN.createStatement();
							RS = ST.executeQuery(msg);

							int Gnum = Gtotal - (pageNUM - 1) * 10;
							while (RS.next() == true) {
								int num = RS.getInt("num");
								String writer = RS.getString("writer");
								int tot3 = RS.getInt("readcount");
								ST3 = CN.createStatement();
								msg3 = "select count(*) as rcnt from comments where c_board2=" + num;
								RS3 = ST3.executeQuery(msg3);
								RS3.next(); //if(RS3.next()==true){rcnt}
								int tot2 = RS3.getInt("rcnt");
					%>

					<tr>
						<td style="text-align: center;"><%=Gnum--%></td>
						<td style="text-align: center;"><img
							alt="<%=RS.getString("filename")%>"
							src="storage/<%=RS.getString("filename")%>" width="30"
							height="30"></td>
						<td><a href="detail.jsp?idx=<%=RS.getInt("num")%>"
							style="text-decoration: none"><%=RS.getString("subject")%></a>&nbsp;&nbsp;<%
							if (tot2 >= 1) {
						%> <font color=red>[<%=tot2%>]
						</font> <%
 	}
 %> <%
 	if (tot3 >= 10) {
 %> <img alt="핫" src="storage/hot.gif"> <%
 	}
 %></td>
						<td style="text-align: center;"><%=RS.getString("writer")%></td>
						<td style="text-align: center;"><%=RS.getDate("reg_date")%></td>
						<td style="text-align: center;"><%=RS.getInt("readcount")%></td>
					</tr>
					<%
						}
						} catch (Exception e) {
							out.println(e);
						}
					%>
				</tbody>
			</table>
			<hr />
			<%
				String my = (String) session.getAttribute("naver");
				if (my == null) {
			%>
			<div class="huge-top">
				<button class="btn btn-normal pull-left" onclick="loginCheck()">글쓰기</button>
			</div>
			<%
				} else {
			%>
			<div class="huge-top">
				<button class="btn btn-normal pull-left"
					onclick="location.href='insert.jsp?writer=<%=my%>'">글쓰기</button>
			</div>
			<%
				}
			%>

			<div class="huge-top" align="right">
				<form name="searchform" action="list.jsp">
					<select id="keyfield" name="keyfield" onchange="changeClear()">
						<option value="writer"
							<%if (skey.equals("writer"))
				out.println("selected");%>>이름</option>
						<option value="subject"
							<%if (skey.equals("subject"))
				out.println("selected");%>>제목</option>
					</select> <input id="keyword" name="keyword" width="300"
						onkeydown="JavaScript:Enter_Check();" value="<%=sval%>">
					<button type="submit" class="btn btn-primary">검 색</button>
				</form>
			</div>

			<div class="text-center">
				<ul class="pagination">
					<%
						if (startpage > 10) {
					%>
					<li><a
						href="list.jsp?pageNum=<%=(startpage - 10) + returnpage%>">이전</a></li>
					<%
						}
						for (int i = startpage; i <= endpage; i++) {
							if (pageNUM == i) {
					%>
					<li style="background-color: red"><a
						href="list.jsp?pageNum=<%=i + returnpage%>"><font
							style="color: red"><%=i%></font></a></li>
					<%
						} else {
					%>
					<li><a href="list.jsp?pageNum=<%=i + returnpage%>"><%=i%></a></li>
					<%
						}
						}
						if (endpage < pagecount) {
					%>
					<li><a
						href="list.jsp?pageNum=<%=(startpage + 10) + returnpage%>">다음</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<p>
		<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
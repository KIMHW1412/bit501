<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>[ssi2.jsp]</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<%!Connection CN; //DB정보기억,명령어생성
	Statement ST; //ST명령어생성
	PreparedStatement PST; //sql쿼리미리서해석 알맹이없는상태
	ResultSet RS; //select결과값 기억
	String msg;
	String data; //데이터받는역할 data=request.getParamater(" ")
	int Gsabun, Gpay, a, d; //사번,급여
	String Gname, Gtitle, b, c; //이름,제목
	java.util.Date Gnalja, dt; //날짜
	int total = 316, Gtotal = 316;

	Statement ST3;
	String msg3;
	ResultSet RS3;
	int tot3;%>

	<%
		//ssi.jsp=Server Side Include 
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url, "system", "orcle");
			//System.out.println("DB서버연결성공 OKOK");
		} catch (Exception ex) {
			System.out.println("DB실패:" + ex);
		}
	%>
</body>
</html>













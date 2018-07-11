<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ include file="ssi2.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [guestEdit.jsp]</title>
  <style type="text/css">
    *{font-size:16pt; font-weight:bold;}
    a{text-decoration:none; font-size:16pt; color:red; }
    a:hover{text-decoration:underline; font-size:20pt; color:green; } 
  </style>
  
</head>
<body>
<%
try{ //guestEdit.jsp문서 한건데이터 수정 단독실행에러입니다
	data=request.getParameter("idx");
	ST=CN.createStatement();
	msg="select * from guest where sabun=" +data;
	System.out.println(msg); //한건쿼리문 출력 
	RS=ST.executeQuery(msg); //조회한결과 RS기억 
 }catch(Exception e){System.out.println(e);}
	
 if(RS.next()==true){
	 Gsabun=RS.getInt("sabun");  
	 Gname=RS.getString("name");
	 Gtitle=RS.getString("title");
	 Gnalja=RS.getDate("nalja");
	 Gpay=RS.getInt("pay");
 }
%>
  <font color=blue> guestEdit.jsp </font> <p>
  <form name="myform"  action="guestEditSave.jsp" method="get">
  	수정사번:	
  	 <input type="text" name="sabun" value="<%=Gsabun%>" readonly>	<br>
  	수정이름:
  	 <input type="text" name="name" value="<%=Gname%>"> <br>
        수정제목:
     <input type="text" name="title" value="<%=Gtitle%>"> <br>
        수정급여:
      <input type="text" name="pay" value="<%=Gpay%>"> <br>
      
      <input type="submit"  value="submit수정처리">
      <input type="reset" value="입력취소">
  </form>
    
  <p>
  <a href="index.jsp"> [index] </a>
  <a href="guestJoin.jsp"> [guestJoin] </a>
  <a href="guestList.jsp"> [guestList] </a>
</body>
</html>



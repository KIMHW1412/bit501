<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="ssi2.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [guestSaveCopy.jsp]</title>
  <style type="text/css">
    *{font-size:20pt; font-weight:bold;}
    a{text-decoration:none; font-size:20pt; color:red; }
    a:hover{text-decoration:underline; font-size:26pt; color:green; } 
  </style>	
</head>
<body>
  <font color=blue> guestSaveCopy.jsp </font> <p>
  <!-- 나중에 단독실행하면 에러발생 -->  
<%  
try{
  Gsabun=Integer.parseInt(request.getParameter("sabun"));
  Gname=request.getParameter("name");
  Gtitle=request.getParameter("title");
  Gpay=Integer.parseInt(request.getParameter("pay")); 
  System.out.println( Gsabun+" "+Gname+" "+Gtitle+" "+Gpay);
  System.out.println();
  
 ST=CN.createStatement();
 msg="insert into guest values("+Gsabun+",'"+Gname+"','"+Gtitle+"',sysdate,"+Gpay+")" ;
 ST.executeUpdate(msg); //진짜저장처리
 System.out.println("guest테이블 데이터저장성공"); 
 System.out.println(msg);
 //response내장개체 문서이동
 response.sendRedirect("guestList.jsp");
}catch(Exception e){
 System.out.println("저장실패에러 "+e);
 response.sendRedirect("guestJoin.jsp");
}
%>
  
  <p>
  <a href="index.jsp"> [index] </a>
  <a href="guestJoin.jsp"> [guestJoin] </a>
  <a href="guestList.jsp"> [guestList] </a>
</body>
</html>









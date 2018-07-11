<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ include file="ssi2.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [opeIDSave.jsp]</title>
  <style type="text/css">
    *{font-size:20pt; font-weight:bold;}
    a{text-decoration:none; font-size:20pt; color:red; }
    a:hover{text-decoration:underline; font-size:26pt; color:green; } 
  </style>	
</head>
<body>
<div align="center">
 <img src="images/bar.gif" width=400 height=25><p>
 <img src="images/bar.gif" width=400 height=25><p>
 <img src="images/bar.gif" width=400 height=25><p>
 <img src="images/bar.gif" width=400 height=25><p>
 <img src="images/bar.gif" width=400 height=25><p>
 <p>
</div>

<font color=blue> opeIDSave.jsp </font> <p>
<!-- openIDSave.jsp단독실행하면 에러발생 -->   
<%
 try{
  //openIDSave.jsp단독실행하면 에러발생
  data=request.getParameter("userid");
  ST=CN.createStatement();
  msg="select count(*) as cnt from bbs where b_sabun="+data ;
  RS=ST.executeQuery(msg);
  if(RS.next()==true){ Gtotal=RS.getInt("cnt"); }
  if(Gtotal>0){
	System.out.println(data+" 데이터는 이미 사용중입니다"); 
%>
  <script type="text/javascript">
    alert(<%=data%>+" 데이터는 이미사용중이라서 사용할수 없습니다");
    opener.iform.sabun.value="";
    opener.iform.sabun.focus();
    self.close(); 
  </script>	
<%	
  }else{ System.out.println(data+" 데이터는  사용가능합니다");
%>
  <script type="text/javascript">
    alert(<%=data%>+" 사용가능한 ID입니다");
    opener.iform.name.focus();
    self.close();
  </script>	
<%	
  }
 }catch(Exception e){System.out.println(e);}

  if(RS.next()==true) {
   Gsabun=RS.getInt("b_sabun");
  }//if end
%>   
 
</body>
</html>









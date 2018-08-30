<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>[board.jsp=board.do]</title>
	<style type="text/css">
		*{font-size:16pt; font-weight:bold; }
		a{text-decoration:none ;font-size:20pt; font-weight:bold;}
		a:hover{text-decoration:underline ;font-size:22pt; font-weight:bold;}
	</style>
</head>
<body>

  <form action="insert.do"  enctype="multipart/form-data" method="post"> 
  
   <b>이름:</b> <input type="text" name="name" value="hong"><br>
   <b>제목:</b> <input type="text" name="title" value="rain"><br>
   <b>내용:</b> 
   <textarea name="content" rows="4" cols="20">cool</textarea><br>
   
   <b>성별:</b>
    <input type="radio" name="gender" value="man"><b>남자</b> 
    <input type="radio" name="gender" value="woman" checked><b>여자</b> <br>
   <b>취미:</b>
    <input type="checkbox" name="hobby" value="game"><b>게임</b>
    <input type="checkbox" name="hobby" value="ski" checked><b>스키</b>
    <input type="checkbox" name="hobby" value="study"><b>공부</b>
    <input type="checkbox" name="hobby" value="movie"><b>영화</b> <br>
    
    <!-- 파일명담당 img_file_name   -->
    <input type="file" name="upload_f"><p>
    
    
    <input type="submit" value="board저장">
    <input type="reset" value="입력취소">
  </form>
	
<p>
  <a href="index.jsp">[index.jsp]</a>
  <a href="board.do">[신규등록]</a>

</body>
</html>




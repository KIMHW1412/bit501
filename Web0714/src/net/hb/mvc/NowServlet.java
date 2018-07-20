package net.hb.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NowServlet  extends  HttpServlet{
   protected void doMove(HttpServletRequest request, HttpServletResponse response) throws IOException {
  	 request.setCharacterEncoding("utf-8");
  	 response.setContentType("text/html; charset=utf-8"); 
  	 
  	 PrintWriter out = response.getWriter();
  	 out.println("<html>");
  	 out.println("<head><title>현재시간</title></head>");
  	 out.println("<body>");
  	 out.println("현재시간은");
  	 out.println(new Date());
  	 out.println("입니다");
  	 out.println("</body>");
  	 out.println("</html>");
   }//end
}//NowServlet class  END

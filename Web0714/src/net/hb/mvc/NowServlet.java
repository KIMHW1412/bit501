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
  	 out.println("<head><title>����ð�</title></head>");
  	 out.println("<body>");
  	 out.println("����ð���");
  	 out.println(new Date());
  	 out.println("�Դϴ�");
  	 out.println("</body>");
  	 out.println("</html>");
   }//end
}//NowServlet class  END

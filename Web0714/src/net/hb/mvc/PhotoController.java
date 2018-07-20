package net.hb.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PhotoController extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doMove(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doMove(request, response);
	}

	public void doMove(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title> Ȱ������ </title></head>");
		out.println("<body>");
		out.println("<img src='images/a1.png'>");
		out.println("</body>");
		out.println("</html>");

		System.out.println("PhotoController.java ����������");
		System.out.println("PhotoController.java ��������");
	}// end
}// PhotoController class END

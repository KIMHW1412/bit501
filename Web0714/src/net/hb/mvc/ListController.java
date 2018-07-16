package net.hb.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.GuestDAO;
import net.hb.common.GuestDTO;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUser(request, response);
	} // end

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUser(request, response);
	} // end
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자정의 메소드함수 우리가 직접 기술
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<img src='images/aaa.gif'>");
		
		GuestDAO dao = new GuestDAO();
		
		int Gtotal = dao.dbCount();
		ArrayList<GuestDTO> LG = dao.dbSelect(); 
		request.setAttribute("dto", LG);
		request.setAttribute("Gtotal", Gtotal);
		
		RequestDispatcher dis = request.getRequestDispatcher("guestList.jsp");
		dis.forward(request, response);
	} // end

} // class END
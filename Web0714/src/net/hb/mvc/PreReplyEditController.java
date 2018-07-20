package net.hb.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher; // 18.7.17 화요일 추가
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.GuestDAO;
import net.hb.common.GuestDTO;
/**
 * Servlet implementation class InsertController
 */
@WebServlet("/preReplyEdit.do")
public class PreReplyEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUser(request, response);
		System.out.println("doGet메소드 2:06");
	} // end

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUser(request, response);
		System.out.println("doPost메소드 2:12");
	} // end

	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		GuestDAO dao = new GuestDAO();

		String data = request.getParameter("idx");
		String sabun = request.getParameter("sabun");

		GuestDTO dto = dao.dbDetail(sabun);

		request.setAttribute("dto", dto);
		request.setAttribute("idx", data);
		RequestDispatcher dis = request.getRequestDispatcher("replyEdit.do");
		dis.forward(request, response);
	} // end
} // class END

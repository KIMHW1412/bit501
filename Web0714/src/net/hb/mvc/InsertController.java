package net.hb.mvc;

import java.io.IOException;

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
@WebServlet("/insert.do")
public class InsertController extends HttpServlet {
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
		
		GuestDTO dto = new GuestDTO();
		GuestDAO dao = new GuestDAO();
		
		dto.setSabun(Integer.parseInt(request.getParameter("sabun")));
		dto.setName(request.getParameter("name"));
		dto.setTitle(request.getParameter("title"));
		dto.setPay(Integer.parseInt(request.getParameter("pay")));

		System.out.println("InsertController doUser(1, 2)");
		dao.dbInsert(dto);
		response.sendRedirect("list.do");
	} // end
} // class END

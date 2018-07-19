package net.hb.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.ReplyDAO;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/replyDelete.do")
public class ReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUser(request, response);
	} // end

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUser(request, response);
	} // end

	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// ��������� �޼ҵ��Լ� �츮�� ���� ���
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		ReplyDAO rdao = new ReplyDAO();
		String num = request.getParameter("idx");
		String sabun = request.getParameter("sabun");
		
		rdao.replyDelete(num);// ������ ������ ����
		response.sendRedirect("detail.do?idx=" + sabun);
	} // end

} // class END

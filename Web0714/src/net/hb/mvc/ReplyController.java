package net.hb.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher; // 18.7.17 화요일 추가
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.ReplyDAO;
import net.hb.common.ReplyVO;

/**
 * Servlet implementation class InsertController
 */
@WebServlet("/reply.do")
public class ReplyController extends HttpServlet {
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

		String insert = request.getParameter("insert");
		ReplyDAO rdao = new ReplyDAO();

		if (insert == null || insert == "") { // insert가 null이면 조회만
			int data = Integer.parseInt(request.getParameter("idx"));
			System.out.println("댓글출력처리 ReplyController.jsp 넘어온 idx =" + data);
			ArrayList<ReplyVO> rLG = rdao.replySelect(data);
			request.setAttribute("rnaver", rLG);
			request.setAttribute("reply_sabun", data);
			RequestDispatcher dis = request.getRequestDispatcher("guestDetail.jsp");
			dis.forward(request, response);
		} else { // insert가 flag이면 댓글저장
			System.out.println("댓글저장처리 ReplyController.jsp");
			int sabun = Integer.parseInt(request.getParameter("sabun"));
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			rdao.replyInsert(writer, content, sabun);
			response.sendRedirect("detail.do?idx=" + sabun);
		}
	} // end
} // class END

package net.hb.mvc;

import java.io.IOException;
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
		// 사용자정의 메소드함수 우리가 직접 기술
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		GuestDAO dao = new GuestDAO();
		GuestDTO dto1 = new GuestDTO();

		String skey = "", sval = "", returnpage = "";
		skey = request.getParameter("keyfield");
		sval = request.getParameter("keyword");
		dto1.setSkey(skey);
		dto1.setSval(sval);

		int Gtotal = 0, Wtotal = 0;
		int start = 1, end = 10;
		String pnum = "0";
		int startpage = 1, endpage = 10, pagecount, temp;

		if (skey == null || skey == "" || sval == null || sval == "") {
			returnpage = "";
		} else {
			returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		}

		Gtotal = dao.dbCount(dto1);

		pnum = request.getParameter("pageNum");
		if (pnum == "" || pnum == null) {
			pnum = "1";
		}
		int pageNUM = Integer.parseInt(pnum);

		start = (pageNUM - 1) * 10 + 1;
		end = pageNUM * 10;

		if (Gtotal % 10 == 0) {
			pagecount = Gtotal / 10;
		} else {
			pagecount = (Gtotal / 10) + 1;
		}

		temp = (pageNUM - 1) % 10;
		startpage = pageNUM - temp;
		endpage = startpage + 9;

		if (endpage > pagecount) {
			endpage = pagecount;
		}

		dto1.setStart(start);
		dto1.setEnd(end);

		Wtotal = dao.dbCount();

		ArrayList<GuestDTO> dto = dao.dbSelect(dto1);

		request.setAttribute("dto", dto);
		request.setAttribute("Gtotal", Gtotal);
		request.setAttribute("Wtotal", Wtotal);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("pagecount", pagecount);
		request.setAttribute("pageNUM", pageNUM);
		request.setAttribute("skey", skey);
		request.setAttribute("sval", sval);
		request.setAttribute("returnpage", returnpage);

		RequestDispatcher dis = request.getRequestDispatcher("guestList.jsp");
		dis.forward(request, response);
	} // end

} // class END
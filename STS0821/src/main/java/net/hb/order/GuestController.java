package net.hb.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.hb.dao.GuestDAO;
import net.hb.dto.GuestDTO;

@Controller
public class GuestController {
	static final Logger logger = LoggerFactory.getLogger(GuestController.class);

	@Autowired
	GuestDAO dao;

	@RequestMapping(value = "/bk.do")
	public String mybook() {
		String url = "book"; // WEB-INF/views/book.jsp
		return url;
	}// end

	@RequestMapping("/guest.do")
	public String guest_form() {
		String url = "guest"; // WEB-INF/views/guest.jsp
		return url;
	}// end

	@RequestMapping("/insert.do")
	public String guest_insert(GuestDTO dto) {
		dao.dbInsert(dto);
		logger.info("GuestController 저장" + dto.getSabun() + ":" + dto.getTitle());
		System.out.println("GuestController 저장");
		return "redirect:list.do";
	}// end

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView guest_select(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		GuestDTO dto = new GuestDTO();
		//////////////////////////////////////
		int pageNUM = 1, pagecount = 1;
		int start = 1, end = 1, temp = 1, startpage = 1, endpage = 1;
		String pnum = "0", returnpage = "";
		String skey = "0", sval = "0";

		pnum = request.getParameter("pageNum");
		if (pnum == null || pnum == "") {
			pageNUM = 1;
		} else {
			pageNUM = Integer.parseInt(pnum);
		}
		int Gtotal = dao.dbCount();

		if (Gtotal % 10 == 0) {
			pagecount = Gtotal / 10;
		} else {
			pagecount = (Gtotal / 10) + 1;
		}
		start = (pageNUM - 1) * 10 + 1;
		end = pageNUM * 10;

		temp = (pageNUM - 1) % 10;
		startpage = pageNUM - temp;
		endpage = startpage + 9;

		if (endpage > pagecount) {
			endpage = pagecount;
		}

		dto.setStart(start);
		dto.setEnd(end);
		List<GuestDTO> list = dao.dbSelect(dto);
		
		
		mav.addObject("LG", list);
		mav.addObject("Gtotal", Gtotal);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("pagecount", pagecount);
		mav.addObject("pageNUM", pageNUM);
		mav.setViewName("guestList");
		return mav;
	}// end

	@RequestMapping("/detail.do")
	public ModelAndView guest_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String data = request.getParameter("idx");
		GuestDTO dto = dao.dbDetail(data);
		mav.addObject("dto", dto);
		mav.setViewName("guestDetail");
		return mav;
	}// end

	@RequestMapping("/preEdit.do")
	public ModelAndView guest_preEdit(@RequestParam("idx") String data) {
		ModelAndView mav = new ModelAndView();
		GuestDTO dto = dao.dbDetail(data);
		mav.addObject("dto", dto);
		mav.setViewName("guestEdit");
		return mav;
	}

	@RequestMapping("/edit.do")
	public String guest_edit(GuestDTO dto) {
		dao.dbEdit(dto);
		return "redirect:detail.do?idx=" + dto.getSabun();
	}

	@RequestMapping("/delete.do")
	public String guest_delete(@RequestParam("idx") String data) {
		dao.dbDelete(data);
		return "redirect:list.do";
	}// end

}// GuestController class END

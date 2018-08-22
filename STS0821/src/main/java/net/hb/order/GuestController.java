package net.hb.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView guest_insert(GuestDTO dto) {
		ModelAndView mav = new ModelAndView();
		dao.dbInsert(dto);
		mav.setViewName("redirect:list.do");
		return mav;
	}// end

	@RequestMapping("/list.do")
	public ModelAndView guest_select() {
		ModelAndView mav = new ModelAndView();
		List<GuestDTO> list = dao.dbSelect();
		mav.addObject("LG", list);
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

	@RequestMapping("/delete.do")
	public String guest_delete(int data) {
		String url = "guestList"; // WEB-INF/views/guestList.jsp
		return url;
	}// end

}// GuestController class END

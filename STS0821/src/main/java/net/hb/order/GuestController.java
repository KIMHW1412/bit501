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

	@RequestMapping("/list.do")
	public ModelAndView guest_select(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// skey변수는 select값 svalu=keyword값
		String skey = "name", sval = "%%", returnpage = "";
		int pageNUM = 1, start = 1, end = 1, pagesize = 10, limit = 10;
		int pagecount = 1, temp = 0, startpage = 1, endpage = 1;
		String pnum = "0";

		skey = request.getParameter("keyfield");
		sval = request.getParameter("keyword");

		if (skey == null || skey == "" || sval == null || sval == "") {
			skey = "name";
			sval = "";
		}
		returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		System.out.println("선택한필드=" + skey + "\t입력한 검색어=" + sval);

		String AA = "", BB = "", CC = "";
		if (skey.equals("name")) {
			AA = sval;
		} else if (skey.equals("title")) {
			BB = sval;
		} else if (skey.equals("all")) {
			CC = sval;
		}

		// GuestDAO.java자바문서에서 db_searchcount(1,2) 작성함
		// GuestDTO.java자바문서 rn, start, end, skey, sval 추가해야함
		int count = dao.dbCount(); // 레코드갯수 316개
		int searchcount = dao.dbCount(skey, sval); // 레코드갯수 316개

		pnum = request.getParameter("pageNum");
		if (pnum == "" || pnum == null) {
			pnum = "1";
		}
		pageNUM = Integer.parseInt(pnum); // [1]~[3클릭]~[10]

		start = (pageNUM - 1) * limit + 1;
		end = (pageNUM * limit);

		if (searchcount % limit == 0) {
			pagecount = searchcount / limit;
		} else {
			pagecount = (searchcount / limit) + 1;
		}

		temp = (pageNUM - 1) % limit; // [21]~[27클릭]~[30]
		startpage = pageNUM - temp; // 1,11,21,31
		endpage = (startpage + limit) - 1; // 10,20,30, 40까지출력안되고 32까지만 출력함
		// startpage=31, pagecount=32, endpage=40
		if (endpage > pagecount) {
			endpage = pagecount;
		}

		String url = "guestList";
		List LG = dao.dbSelect(start, end, skey, sval); // dbSelect(start, end)

		mav.addObject("LG", LG);
		mav.addObject("total", count); // 전체갯수
		mav.addObject("searchcount", searchcount); // 검색갯수
		mav.addObject("returnpage", returnpage);

		mav.addObject("pageNUM", pageNUM); // [21]~[27클릭한번호]~[30]
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("limit", limit);
		mav.addObject("pagecount", pagecount);

		mav.addObject("AA", AA); // 필드
		mav.addObject("BB", BB); // 필드
		mav.addObject("CC", CC); // 필드
		mav.addObject("skey", skey);
		mav.addObject("sval", sval); // 검색키워드

		mav.setViewName(url);
		return mav;
	}// end

	@RequestMapping("/list2.do")
	public ModelAndView guest_select2() {
		ModelAndView mav = new ModelAndView();
		String url = "guestList2";
		int count = dao.dbCount(); // 레코드갯수
		List LG = dao.dbSelect();
		mav.addObject("naver", LG);
		mav.addObject("total", count);
		mav.setViewName(url);
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

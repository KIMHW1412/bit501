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
		logger.info("GuestController ����" + dto.getSabun() + ":" + dto.getTitle());
		System.out.println("GuestController ����");
		return "redirect:list.do";
	}// end

	@RequestMapping("/list.do")
	public ModelAndView guest_select(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// skey������ select�� svalu=keyword��
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
		System.out.println("�������ʵ�=" + skey + "\t�Է��� �˻���=" + sval);

		String AA = "", BB = "", CC = "";
		if (skey.equals("name")) {
			AA = sval;
		} else if (skey.equals("title")) {
			BB = sval;
		} else if (skey.equals("all")) {
			CC = sval;
		}

		// GuestDAO.java�ڹٹ������� db_searchcount(1,2) �ۼ���
		// GuestDTO.java�ڹٹ��� rn, start, end, skey, sval �߰��ؾ���
		int count = dao.dbCount(); // ���ڵ尹�� 316��
		int searchcount = dao.dbCount(skey, sval); // ���ڵ尹�� 316��

		pnum = request.getParameter("pageNum");
		if (pnum == "" || pnum == null) {
			pnum = "1";
		}
		pageNUM = Integer.parseInt(pnum); // [1]~[3Ŭ��]~[10]

		start = (pageNUM - 1) * limit + 1;
		end = (pageNUM * limit);

		if (searchcount % limit == 0) {
			pagecount = searchcount / limit;
		} else {
			pagecount = (searchcount / limit) + 1;
		}

		temp = (pageNUM - 1) % limit; // [21]~[27Ŭ��]~[30]
		startpage = pageNUM - temp; // 1,11,21,31
		endpage = (startpage + limit) - 1; // 10,20,30, 40������¾ȵǰ� 32������ �����
		// startpage=31, pagecount=32, endpage=40
		if (endpage > pagecount) {
			endpage = pagecount;
		}

		String url = "guestList";
		List LG = dao.dbSelect(start, end, skey, sval); // dbSelect(start, end)

		mav.addObject("LG", LG);
		mav.addObject("total", count); // ��ü����
		mav.addObject("searchcount", searchcount); // �˻�����
		mav.addObject("returnpage", returnpage);

		mav.addObject("pageNUM", pageNUM); // [21]~[27Ŭ���ѹ�ȣ]~[30]
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("limit", limit);
		mav.addObject("pagecount", pagecount);

		mav.addObject("AA", AA); // �ʵ�
		mav.addObject("BB", BB); // �ʵ�
		mav.addObject("CC", CC); // �ʵ�
		mav.addObject("skey", skey);
		mav.addObject("sval", sval); // �˻�Ű����

		mav.setViewName(url);
		return mav;
	}// end

	@RequestMapping("/list2.do")
	public ModelAndView guest_select2() {
		ModelAndView mav = new ModelAndView();
		String url = "guestList2";
		int count = dao.dbCount(); // ���ڵ尹��
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

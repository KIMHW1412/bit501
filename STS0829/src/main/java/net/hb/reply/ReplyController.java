package net.hb.reply;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReplyController {

	@Autowired
	ReplyDAO dao;

//	@RequestMapping("/")
//	public ModelAndView reply_select(HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		int idx = Integer.parseInt(request.getParameter("idx"));
//		List<ReplyDTO> reply = dao.replySelect(idx);
//		String url = "/WEB-INF/views/board_reply.jsp";
//		mav.addObject("reply", reply);
//		mav.setViewName(url);
//		return mav;
//	}

	@RequestMapping("/replayInsert.do")
	public String reply_insert(ReplyDTO dto) {
		dao.replyInsert(dto);
		return "redirect:/detail.do?idx=" + dto.getHobby_idx();
	}

	@RequestMapping("/replyDelete.do")
	public String reply_delete(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		dao.replyDelete(idx);
		return "redirect:/detail.do?idx=" + request.getParameter("num");
	}

}

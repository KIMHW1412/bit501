package net.hb.crud;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext; //servlet-context.xml
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	@Autowired
	BoardDAO dao;

	@Autowired
	ServletContext application;

	@RequestMapping("/board.do")
	public String board_form() {
		String url = "/WEB-INF/views/board.jsp";
		return url;
	}// end

	@RequestMapping("/insert.do")
	public String board_insert(BoardDTO dto) {

		// 상대경로 : 프로젝트가 저장하는 경로
//		String path = application.getRealPath(/resources/upload");
		// 절대경로 : 개발자가 저장하는 경로
		String path = "C:\\Mtest\\Spring\\sts-bundle\\my\\STS0829\\src\\main\\webapp\\resources\\upload";
		System.out.println(path);
		MultipartFile mf = dto.getUpload_f();
		String img = mf.getOriginalFilename();
		System.out.println("컨트롤 가짜파일화=" + dto.getUpload_f());

		// File file=new File(경로, 원래파일);
		File file = new File(path, img);
		try {
			dto.getUpload_f().transferTo(file);// 물리적인 파일화 변환
		} catch (Exception ex) {
		}
		dto.setImg_file_name(img);
		System.out.println("컨트롤 진짜파일화=" + dto.getImg_file_name());

		dao.dbInsert(dto);
		return "redirect:/list.do";
	}// end

	@RequestMapping("/list.do")
	public ModelAndView board_select() {
		ModelAndView mav = new ModelAndView();
		List<BoardDTO> dto = dao.dbSelect();
		String url = "/WEB-INF/views/boardList.jsp";
		mav.addObject("naver", dto);
		mav.setViewName(url);
		return mav;
	}// end

	@RequestMapping("/detail.do")
	public ModelAndView board_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt(request.getParameter("idx"));
		BoardDTO dto = dao.dbDetail(idx);
		String url = "/WEB-INF/views/boardDetail.jsp";
		mav.addObject("dto", dto);
		mav.setViewName(url);
		return mav;
	}

	@RequestMapping("/delete.do")
	public String board_delete(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		dao.dbDelete(idx);
		return "redirect:/list.do";
	}

	@RequestMapping("/preEdit.do")
	public ModelAndView board_preEdit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt(request.getParameter("idx"));
		BoardDTO dto = dao.dbDetail(idx);
		String url = "/WEB-INF/views/boardEdit.jsp";
		mav.addObject("dto", dto);
		mav.setViewName(url);
		return mav;
	}

	@RequestMapping("edit.do")
	public String board_Edit(BoardDTO dto) {
		String path = "C:\\Mtest\\Spring\\sts-bundle\\my\\STS0829\\src\\main\\webapp\\resources\\upload";
		System.out.println(path);
		MultipartFile mf = dto.getUpload_f();
		String img = mf.getOriginalFilename();
		System.out.println("컨트롤 가짜파일화=" + dto.getUpload_f());

		// File file=new File(경로, 원래파일);
		File file = new File(path, img);
		try {
			dto.getUpload_f().transferTo(file);// 물리적인 파일화 변환
		} catch (Exception ex) {
		}
		dto.setImg_file_name(img);
		System.out.println("컨트롤 진짜파일화=" + dto.getImg_file_name());
		System.out.println(dto.getHobby());
		
		dao.dbEdit(dto);
		return "redirect:/detail.do?idx=" + dto.getHobby_idx();
	}

}// BoardController class END

package net.hb.crud;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext; //servlet-context.xml
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.hb.reply.ReplyDAO;
import net.hb.reply.ReplyDTO;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	@Autowired
	BoardDAO dao;
	@Autowired
	ReplyDAO dao1;

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
		String path = "C:\\Users\\bit-user\\git\\STS\\STS0829\\src\\main\\webapp\\resources\\upload";
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

//	@RequestMapping("/list2.do")
//	public ModelAndView board_select2() {
//		ModelAndView mav = new ModelAndView();
//		List<BoardDTO> dto = dao.dbSelect();
//		String url = "/WEB-INF/views/boardList.jsp";
//		mav.addObject("naver", dto);
//		mav.setViewName(url);
//		return mav;
//	}// end

	@RequestMapping("/list.do")
	public ModelAndView board_select(HttpServletRequest request) {
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
		BoardDTO data = new BoardDTO();
		data.setSkey(skey);
		data.setSval(sval);
		int count = dao.dbCountAll(); // 레코드갯수 316개
		int searchcount = dao.dbSearchAll(data); // 레코드갯수 316개

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

		data.setStart(start);
		data.setEnd(end);
		data.setStartpage(startpage);
		data.setEndpage(endpage);

		List<BoardDTO> dto = dao.dbSelect(data);

		String url = "/WEB-INF/views/boardList.jsp";
		mav.addObject("naver", dto);
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

	@RequestMapping("/detail.do")
	public ModelAndView board_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt(request.getParameter("idx"));
		BoardDTO dto = dao.dbDetail(idx);
		List<ReplyDTO> reply = dao1.replySelect(idx);
		String url = "/WEB-INF/views/boardDetail.jsp";
		mav.addObject("dto", dto);
		mav.addObject("reply", reply);
		mav.setViewName(url);
		return mav;
	}// end

	@RequestMapping("/delete.do")
	public String board_delete(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		dao.dbDelete(idx);

		// 실제 저장된 경로에서 파일 삭제
		String path = "C:\\Users\\bit-user\\git\\STS\\STS0829\\src\\main\\webapp\\resources\\upload";
		String filename = request.getParameter("fileName");
		File file = new File(path, filename);
		if (file.exists() == true) {
			file.delete();
			System.out.println("실제 파일 삭제 성공");
		}
		return "redirect:/list.do";
	}// end

	@RequestMapping("/preEdit.do")
	public ModelAndView board_preEdit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt(request.getParameter("idx"));
		BoardDTO dto = dao.dbDetail(idx);
		String url = "/WEB-INF/views/boardEdit.jsp";
		mav.addObject("dto", dto);
		mav.setViewName(url);
		return mav;
	}// end

	@RequestMapping("edit.do")
	public String board_Edit(BoardDTO dto) {
		String path = "C:\\Users\\bit-user\\git\\STS\\STS0829\\src\\main\\webapp\\resources\\uploadd";
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
	}// end

	@RequestMapping("/download.do")
	public String board_download(HttpServletRequest request, HttpServletResponse response) {
		String filename = request.getParameter("fileName");
		String path = application.getRealPath("./resources/upload");

		response.setHeader("Content-Disposition", "attachment;filename=" + filename);
		try {
			File file = new File(path, filename);
			InputStream is = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[(int) file.length()];

			is.read(b, 0, b.length);
			os.write(b);

			// close() 꼭 해줘야 된다.
			is.close();
			os.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("다운에러:" + e);
		}
		System.out.println("다운성공");
		return "redirect:/detail.do?idx=" + request.getParameter("idx");
	}// end

}// BoardController class END

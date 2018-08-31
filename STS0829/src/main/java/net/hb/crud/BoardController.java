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

		// ����� : ������Ʈ�� �����ϴ� ���
//		String path = application.getRealPath(/resources/upload");
		// ������ : �����ڰ� �����ϴ� ���
		String path = "C:\\Users\\bit-user\\git\\STS\\STS0829\\src\\main\\webapp\\resources\\upload";
		System.out.println(path);
		MultipartFile mf = dto.getUpload_f();
		String img = mf.getOriginalFilename();
		System.out.println("��Ʈ�� ��¥����ȭ=" + dto.getUpload_f());

		// File file=new File(���, ��������);
		File file = new File(path, img);
		try {
			dto.getUpload_f().transferTo(file);// �������� ����ȭ ��ȯ
		} catch (Exception ex) {
		}
		dto.setImg_file_name(img);
		System.out.println("��Ʈ�� ��¥����ȭ=" + dto.getImg_file_name());

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
		BoardDTO data = new BoardDTO();
		data.setSkey(skey);
		data.setSval(sval);
		int count = dao.dbCountAll(); // ���ڵ尹�� 316��
		int searchcount = dao.dbSearchAll(data); // ���ڵ尹�� 316��

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

		data.setStart(start);
		data.setEnd(end);
		data.setStartpage(startpage);
		data.setEndpage(endpage);

		List<BoardDTO> dto = dao.dbSelect(data);

		String url = "/WEB-INF/views/boardList.jsp";
		mav.addObject("naver", dto);
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

		// ���� ����� ��ο��� ���� ����
		String path = "C:\\Users\\bit-user\\git\\STS\\STS0829\\src\\main\\webapp\\resources\\upload";
		String filename = request.getParameter("fileName");
		File file = new File(path, filename);
		if (file.exists() == true) {
			file.delete();
			System.out.println("���� ���� ���� ����");
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
		System.out.println("��Ʈ�� ��¥����ȭ=" + dto.getUpload_f());

		// File file=new File(���, ��������);
		File file = new File(path, img);
		try {
			dto.getUpload_f().transferTo(file);// �������� ����ȭ ��ȯ
		} catch (Exception ex) {
		}
		dto.setImg_file_name(img);
		System.out.println("��Ʈ�� ��¥����ȭ=" + dto.getImg_file_name());
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

			// close() �� ����� �ȴ�.
			is.close();
			os.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("�ٿ��:" + e);
		}
		System.out.println("�ٿ��");
		return "redirect:/detail.do?idx=" + request.getParameter("idx");
	}// end

}// BoardController class END

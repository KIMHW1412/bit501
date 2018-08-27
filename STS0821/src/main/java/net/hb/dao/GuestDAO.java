package net.hb.dao;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import net.hb.dto.GuestDTO;

@Component
@Repository
public class GuestDAO { // guest.xml문서연결

	@Autowired
	@Inject
	SqlMapClientTemplate temp;

	public void dbInsert(GuestDTO dto) {
		temp.insert("guest.add", dto);
		System.out.println("guest저장성공");
	}// end

	public List<GuestDTO> dbSelect(int start, int end, String skey, String sval) {
		GuestDTO dto = new GuestDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setSkey(skey);
		dto.setSval(sval);
		List<GuestDTO> list = temp.queryForList("guest.selectAll2", dto);
		return list;
	}// end

	public List<GuestDTO> dbSelect(int start, int end) {// 시작행,끝행
		// DAO단 세터
		GuestDTO dto = new GuestDTO();
		dto.setStart(start);
		dto.setEnd(end);
		List<GuestDTO> list = temp.queryForList("guest.selectAll789", dto);
		return list;
	}// end

	// 05-29-일요일 복사만 해놓고 코드구현은 db_select메소드에서 구현
	public List<GuestDTO> dbSelect() {
		List<GuestDTO> list = temp.queryForList("guest.selectAll");
		return list;
	}// end

	public GuestDTO dbDetail(String data) {
		GuestDTO dto = (GuestDTO) temp.queryForObject("guest.detail", data);
		return dto;
	}// end

	public int dbCount() {
		int count = (Integer) temp.queryForObject("guest.countAll");
		return count;
	}// end

	public int dbCount(String skey, String sval) {// 검색필드,검색키워드
		GuestDTO dto = new GuestDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		int total = (Integer) temp.queryForObject("guest.searchCountAll", dto);
		return total;
	}// end

	public void dbDelete(String data) {
		temp.delete("guest.del", data);
		System.out.println("guest삭제성공");
	}

	public void dbEdit(GuestDTO dto) {
		temp.update("guest.edit", dto);
	}

}// GuestDAO class END

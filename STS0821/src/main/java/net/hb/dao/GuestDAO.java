package net.hb.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;
import net.hb.dto.GuestDTO;

@Repository
public class GuestDAO { // guest.xml문서연결

	@Autowired
	SqlMapClientTemplate temp;

	public void dbInsert(GuestDTO dto) {
		temp.insert("guest.add", dto);
		System.out.println("guest저장성공");
	}// end

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

	public void dbDelete(String data) {
		temp.delete("guest.del", data);
		System.out.println("guest삭제성공");
	}

	public void dbEdit(GuestDTO dto) {
		temp.update("guest.edit", dto);
	}

}// GuestDAO class END

package net.hb.crud;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	SqlSessionTemplate temp;

	public void dbInsert(BoardDTO dto) {
		temp.insert("board.add", dto);
		System.out.println("hobby테이블 데이터 저장성공");
	}// end

//	public List<BoardDTO> dbSelect() {
//		List<BoardDTO> list = temp.selectList("board.selectAll");
//		return list;
//	}// end

	public List<BoardDTO> dbSelect(BoardDTO dto) {
		List<BoardDTO> list = temp.selectList("board.selectAll", dto);
		return list;
	}// end

	public BoardDTO dbDetail(int idx) {
		BoardDTO dto = temp.selectOne("board.detail", idx);
		return dto;
	}

	public int dbCountAll() {
		int total = temp.selectOne("board.countAll");
		return total;
	}

	public int dbSearchAll(BoardDTO dto) {
		int searhtotal = temp.selectOne("board.searchCountAll", dto);
		return searhtotal;
	}

	public void dbDelete(int idx) {
		temp.delete("board.del", idx);
		System.out.println("hobby테이블 데이터 삭제성공");
	}

	public void dbEdit(BoardDTO dto) {
		temp.update("board.edit", dto);
		System.out.println("hobby테이블 데이터 수정성공");
	}

}// BoardDAO class END

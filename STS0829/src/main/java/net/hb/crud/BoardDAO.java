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
		System.out.println("hobby���̺� ������ ���强��");
	}// end

	public List<BoardDTO> dbSelect() {
		List<BoardDTO> list = temp.selectList("board.selectAll");
		return list;
	}// end

	public BoardDTO dbDetail(int idx) {
		BoardDTO dto = temp.selectOne("board.detail", idx);
		return dto;
	}

	public int dbCountAll(int data) {
		int total = temp.selectOne("board.countAll", data);
		return total;
	}

	public void dbDelete(int idx) {
		temp.delete("board.del", idx);
		System.out.println("hobby���̺� ������ ��������");
	}

	public void dbEdit(BoardDTO dto) {
		temp.update("board.edit", dto);
		System.out.println("hobby���̺� ������ ��������");
	}

}// BoardDAO class END

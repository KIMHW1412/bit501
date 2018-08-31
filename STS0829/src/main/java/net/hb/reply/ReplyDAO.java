package net.hb.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Autowired
	SqlSessionTemplate temp;

	public List<ReplyDTO> replySelect(int idx) {
		List<ReplyDTO> reply = temp.selectList("reply.replyAll", idx);
		return reply;
	}

	public void replyInsert(ReplyDTO data) {
		temp.insert("reply.add", data);
		System.out.println("hobby_reply테이블 데이터 저장성공");
	}

	public void replyDelete(int idx) {
		temp.delete("reply.del", idx);
		System.out.println("hobby_reply테이블 데이터 삭제성공");
	}

}

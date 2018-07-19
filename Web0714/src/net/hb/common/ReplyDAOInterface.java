package net.hb.common;

import java.util.ArrayList;

public interface ReplyDAOInterface {
	public void replyInsert(String writer, String content, int sabun);
	public ArrayList<ReplyVO> replySelect(int sabun);
	public void replyDelete(String num);
} // ReplyDAOInterface END
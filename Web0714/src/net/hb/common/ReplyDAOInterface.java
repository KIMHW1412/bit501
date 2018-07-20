package net.hb.common;

import java.util.ArrayList;

public interface ReplyDAOInterface {
	public void replyInsert(String writer, String content, int sabun);
	public ArrayList<ReplyVO> replySelect(int sabun);
	public ArrayList<ReplyVO> replySearch(int num);
	public void replyDelete(String num);
	public void replyEdit(int num, String writer, String content);
} // ReplyDAOInterface END
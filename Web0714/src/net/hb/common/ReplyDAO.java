package net.hb.common;

import java.util.ArrayList;

public class ReplyDAO extends Variable implements ReplyDAOInterface {

	public ReplyDAO() {
		// TODO Auto-generated constructor stub
		CN = DB.getConnection();
	} // 기본생성자 end

	@Override
	public void replyInsert(String writer, String content, int sabun) {
		// TODO Auto-generated method stub
		try {
			msg = "insert into guestreply values(guestreply_seq.nextval, ?,?,?)";
			PST = CN.prepareStatement(msg);
			PST.setString(1, writer);
			PST.setString(2, content);
			PST.setInt(3, sabun);
			PST.executeUpdate();
			System.out.println("guestreply테이블 댓글저장성공");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

	@Override
	public ArrayList<ReplyVO> replySelect(int sabun) {
		// TODO Auto-generated method stub
		ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>();
		try {
			// msg = "select * from guestreply where sabun=?";
			msg = "select g.sabun, r.* from guest g inner join guestreply r on g.sabun=r.sabun and r.sabun=" + sabun
					+ " order by num";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				ReplyVO vo = new ReplyVO();
				vo.setNum(RS.getInt("num"));
				vo.setWriter(RS.getString("writer"));
				vo.setContent(RS.getString("content"));
				vo.setSabun(RS.getInt("sabun"));

				rlist.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return rlist;
	}

	@Override
	public void replyDelete(String num) {
		// TODO Auto-generated method stub
		try {
			int num1 = Integer.parseInt(num);
			msg = "delete from guestreply where num=?";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, num1);
			PST.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

	@Override
	public void replyEdit(int num, String writer, String content) {
		// TODO Auto-generated method stub
		try {
			msg = "update guestreply set writer=?, content=? where num=?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, writer);
			PST.setString(2, content);
			PST.setInt(3, num);

			PST.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

	@Override
	public ArrayList<ReplyVO> replySearch(int num) {
		// TODO Auto-generated method stub
		ArrayList<ReplyVO> rlist = new ArrayList<ReplyVO>();
		try {
			// msg = "select * from guestreply where sabun=?";
			msg = "select * from guestreply where num =" + num;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				ReplyVO vo = new ReplyVO();
				vo.setNum(RS.getInt("num"));
				vo.setWriter(RS.getString("writer"));
				vo.setContent(RS.getString("content"));
				vo.setSabun(RS.getInt("sabun"));

				rlist.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return rlist;
	}

} // class END

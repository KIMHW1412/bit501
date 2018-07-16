package net.hb.common;

import java.sql.*;
import java.util.Date;
import java.util.ArrayList;

public class GuestDAO { // Data Access Object
	// �������� = �ʵ� = filed, ssi.jsp���� ����
	Connection CN; // DB�������,��ɾ����
	Statement ST; // ST��ɾ����
	PreparedStatement PST; // sql�����̸����ؼ� �˸��̾��»���
	ResultSet RS; // select����� ���
	String msg;
	String data; // �����͹޴¿��� data=request.getParamater(" ")
	int Gsabun, Gpay; // ���,�޿�
	String Gname, Gtitle; // �̸�,����
	Date Gnalja, dt; // ��¥
	int total = 316, Gtotal = 316;

	Statement ST3;
	String msg3;
	ResultSet RS3;
	int tot3;

	public GuestDAO() {
		CN = DB.getConnection();
		System.out.println("DBSQL.java������ DB���Ἲ��");
	} // �⺻ ������ end

	public void dbInsert(GuestDTO dto) { // InsertController.java
		try {

			msg = "insert into guest values(?,?,?,sysdate,?)";
			PST = CN.prepareStatement(msg);

			PST.setInt(1, dto.getSabun());
			PST.setString(2, dto.getName());
			PST.setString(3, dto.getTitle());
			PST.setInt(4, dto.getPay());

			int cnt = PST.executeUpdate(); // executeUpdate(msg)�����߻�
			if (cnt > 0) {
				CN.commit();
				PST.close();
				CN.close();
				System.out.println("GuestDAO.java dbInsert ���强��");
			}

		} catch (Exception e) {
			System.out.println("������п��� " + e);
		}
	}// end dbInsert(a, b, c, d)

	public ArrayList<GuestDTO> dbSelect() { // ListController.java
		ArrayList<GuestDTO> my = new ArrayList<GuestDTO>();
		try {
			String x = "select * from (";
			String y = "select rownum rn, g.* from guest g";
			String z = ") where rn >=1 and rn <=10 order by rn";
			msg = x + y + z;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				GuestDTO dto = new GuestDTO();
				dto.setSabun(RS.getInt("sabun"));
				dto.setName(RS.getString("name"));
				dto.setTitle(RS.getString("title"));
				dto.setNalja(RS.getDate("nalja"));
				dto.setPay(RS.getInt("pay"));
				dto.setRn(RS.getInt("rn"));

				my.add(dto);// ������ ����Ͻÿ�.
			} // while end
		} catch (Exception e) {
			System.out.println(e);
		}
		return my;
	} // end

	public ArrayList<DBbean> dbSelect(int start, int end) { // guestList.jsp���� ���ܼ� ���
		ArrayList<DBbean> my = new ArrayList<DBbean>();

		try {
			// msg = "select * from guest order by sabun";
			String x = "select * from (";
			String y = "select rownum rn, g.* from guest g";
			String z = ") where rn >=" + start + " and rn <=" + end + " order by nalja desc";
			// String z = ") where rn between" + start + " and " + end;
			msg = x + y + z;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				DBbean bean = new DBbean();
				bean.setSabun(RS.getInt("sabun"));
				bean.setName(RS.getString("name"));
				bean.setTitle(RS.getString("title"));
				bean.setNalja(RS.getDate("nalja"));
				bean.setPay(RS.getInt("pay"));
				bean.setRn(RS.getInt("rn"));

				my.add(bean);// ������ ����Ͻÿ�.
			} // while end
		} catch (Exception e) {
			System.out.println(e);
		}

		return my;
	} // end

	public int dbCount() {
		int count = 0;
		try {
			ST = CN.createStatement();
			msg = "select count(*) as cnt from guest";
			RS = ST.executeQuery(msg);
			if (RS.next() == true) {
				count = RS.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return count;
	} // end

	public DBbean dbDetail(String data) {
		DBbean bean = new DBbean();
		try {
			msg = "select * from guest where sabun = " + data;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			RS.next();

			bean.setSabun(RS.getInt("sabun"));
			bean.setName(RS.getString("name"));
			bean.setTitle(RS.getString("title"));
			bean.setNalja(RS.getDate("nalja"));
			bean.setPay(RS.getInt("pay"));

		} catch (Exception e) {
			// TODO: handle exception
		}
		return bean;
	}

	public void dbDelete(String data) {
		try {
			msg = "delete from guest where sabun = " + data;
			ST = CN.createStatement();
			int cnt = ST.executeUpdate(msg);
			if (cnt > 0) {
				CN.commit();
				ST.close();
				CN.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void dbUpdate(DBbean bean) {
		try {
			msg = "update guest set name=?, title=?, nalja=sysdate, pay=? where sabun=?";
			PST = CN.prepareStatement(msg);

			PST.setString(1, bean.getName());
			PST.setString(2, bean.getTitle());
			PST.setInt(3, bean.getPay());
			PST.setInt(4, bean.getSabun());

			int cnt = PST.executeUpdate();
			if (cnt > 0) {
				CN.commit();
				PST.close();
				CN.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}
} // GuestDAO class END

package net.hb.common;

import java.sql.*;
import java.util.Date;
import java.util.ArrayList;

public class DBSQL {
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

	public DBSQL() {
		CN = DB.getConnection();
		System.out.println("DBSQL.java������ DB���Ἲ��");
	} // �⺻ ������ end

	public void dbInsert(int a, String b, String c, int d) {
		try {

			msg = "insert into guest values(?,?,?,sysdate,?)";
			PST = CN.prepareStatement(msg);

			PST.setInt(1, a);
			PST.setString(2, b);
			PST.setString(3, c);
			PST.setInt(4, d);

			PST.executeUpdate(); // executeUpdate(msg)�����߻�
			System.out.println("PreparedStatement ���强��");

		} catch (Exception e) {
			System.out.println("������п��� " + e);
		}
	}// end dbInsert(a, b, c, d)

	public void dbInsert(DBbean bean) {
		try {

			msg = "insert into guest values(?,?,?,sysdate,?)";
			PST = CN.prepareStatement(msg);
			// PST.setInt(1, a);
			// PST.setString(2, b);
			// PST.setString(3, c);
			// PST.setInt(4, d);
			PST.executeUpdate(); // executeUpdate(msg)�����߻�
			System.out.println("PreparedStatement ���强��");

		} catch (Exception e) {
			System.out.println("������п��� " + e);
		}
	} // end dbInsert(DBbean)

	public ArrayList<DBbean> dbSelect() {
		ArrayList<DBbean> my = new ArrayList<DBbean>();

		try {
			msg = "select * from guest order by sabun";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next() == true) {
				DBbean bb = new DBbean();
				Gsabun = RS.getInt("sabun");
				bb.setSabun(RS.getInt("sabun"));
				bb.setName(RS.getString("name"));
				bb.setTitle(RS.getString("title"));
				bb.setNalja(RS.getDate("nalja"));
				bb.setPay(RS.getInt("pay"));

				// msg3 = "select where " + Gsabun;
				// ST3 = CN.createStatement();
				// RS3 = ST3.executeQuery(msg3);
				// tot3 = RS3.getInt("rcnt");

				my.add(bb);
			}
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

	public DBbean dbDetail(int data) {
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
} // DBSQL class END

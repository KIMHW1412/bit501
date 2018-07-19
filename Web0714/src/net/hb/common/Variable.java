package net.hb.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class Variable {
	// 전역변수 = 필드 = filed, ssi.jsp문서 복붙
		Connection CN; // DB정보기억,명령어생성
		Statement ST; // ST명령어생성
		PreparedStatement PST; // sql쿼리미리서해석 알맹이없는상태
		ResultSet RS; // select결과값 기억
		String msg;
		String data; // 데이터받는역할 data=request.getParamater(" ")
		int Gsabun, Gpay; // 사번,급여
		String Gname, Gtitle; // 이름,제목
		Date Gnalja, dt; // 날짜
		int total = 316, Gtotal = 316;

		Statement ST3;
		String msg3;
		ResultSet RS3;
		int tot3;
} // class END

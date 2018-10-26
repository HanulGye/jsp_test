package com.hanul.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hanul.util.DBConnector;

public class NoticeDAO {
	
	//sequence 가져오기
	public int getNo() throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "SELECT notice_seq.nextval FROM dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	public int insert(NoticeDTO nDto) throws Exception{
		
		Connection con = DBConnector.getConnect();
		String sql = "INSERT INTO notice VALUES(?,?,?,?,sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, nDto.getNo());
		st.setString(2, nDto.getSubject());
		st.setString(3, nDto.getContent());
		st.setString(4, nDto.getWriter());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		
		return result;
	}
	
}

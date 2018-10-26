package com.hanul.file;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hanul.util.DBConnector;

public class FileDAO {
	public int insert(FileDTO fileDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql="INSERT INTO upload VALUES(file_seq.nextval, ?, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, fileDTO.getFname());
		st.setString(2, fileDTO.getOname());
		st.setInt(3, fileDTO.getNo());
		st.setString(4, fileDTO.getKind());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
		
		
	}
}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {
	
	private static MemberDao dao = null;
	
	private String loginID;
	
	private MemberDao() {
	}
	
	public static MemberDao getInstance() {
		if(dao == null) {
			dao = new MemberDao();
		}
		return dao;
	}
	public boolean getId(String id) {
		
		String sql = "  SELECT ID "
					+ " FROM MEMBER "
					+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean findid = false;
				
		try {
			conn = DBConnection.getConnection();	// db 정보
			
			psmt = conn.prepareStatement(sql);		// query 적용
			psmt.setString(1, id);
			
			rs = psmt.executeQuery(); 				// db로부터 데이터를 취득
			
			if(rs.next()) {		// id 있음
				findid = true;
			}		
		
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
	
		return findid;
	}

	public boolean addMember(MemberDto dto) {
		String sql = " INSERT INTO MEMBER(ID, PWD, NAME, EMAIL, AUTH) "
				+ " VALUES(?, ?, ?, ?, 3) ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		System.out.println("sql:" + sql);
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {		
			DBClose.close(psmt, conn, null);			
		}		
		
		return count>0?true:false;
	}
	
	public MemberDto login(String id, String pwd) {
		
		String sql = " SELECT ID, NAME, EMAIL, AUTH "
					+ " FROM MEMBER "
					+ " WHERE ID=? AND PWD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mem = null;
		
		try {
			conn = DBConnection.getConnection();
		
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			psmt.setString(2, pwd.trim());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String _id = rs.getString(1);	// id
				String _name = rs.getString(2);	// name
				String _email = rs.getString(3);// email
				int auth = rs.getInt(4);	// auth
				
				mem = new MemberDto(_id, null, _name, _email, auth);
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return mem;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
}








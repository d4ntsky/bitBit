package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {

	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnection();
	}
	public static MemberDao getInstance() {
		return dao;
	}
	
	public boolean getId(String id) {	
		// id 확인 -> true/false 
		String sql = " SELECT ID FROM MEMBER "
				+ " WHERE ID=? ";
	//	String sql = " SELECT COUNT(*) FROM MEMBER "	// 이렇게 할 수도 있음
	//				+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean findid = false;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getId success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getId success");
			
			psmt.setString(1, id.trim());
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getId success");
			
			if(rs.next()) {		// 찾았다
				findid = true;
			}			
			
		} catch (Exception e) {			
			e.printStackTrace();
			System.out.println("getId fail");
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return findid;
	}
	public boolean addMember(MemberDto dto) {
		// 회원가입의 데이터 -> DB
		String sql = " INSERT INTO MEMBERMEMBER "
				+ "	(ID, PWD, NAME, EMAIL, AUTH) "
				+ " VALUES(?, ?, ?, ?, 3) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			
			count = psmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("addMember fail");
		} finally {
			DBClose.close(psmt, conn, null);			
		}
		
		return count>0?true:false;
	}
	
//-----------------------------------------------------------------
	//login
	public MemberDto login(String id, String pwd) {	//MemberDto dto여도 됨 // 구별 위해 id,pwd
		
		String sql = " SELECT ID, NAME, EMAIL, AUTH "	//PWD 빠짐
					+" FROM MEMBER "
					+" WHERE ID=? AND PWD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 login success");	//깃대 꼽기
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			System.out.println("2/6 login success");
			
			rs = psmt.executeQuery();	//id,name,email,auth가 넘어옴 
			//auth얻어와서 관리자 사용자 페이지 나뉨
			System.out.println("3/6 login success");
			
			if(rs.next()) {
				String user_id = rs.getString(1);	// id만 쓰면 위와 충돌
				String name = rs.getString(2);
				String email = rs.getString(3);
				int auth = rs.getInt(4);
			
				dto = new MemberDto(user_id, null, name, email, auth);
			}
			System.out.println("4/6 login success");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}
}









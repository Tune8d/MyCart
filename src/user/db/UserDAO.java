package user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {

	private DataSource ds;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;

	public UserDAO() {

		// 생성자로 DB 연결 (보안 위해 context.xml?)
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/OracleDB");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public int logIn(String userID, String userPassword) {
		String sql = null;
		try {
			// 항상 DataSource 인스턴스가 필요하다.
			con = ds.getConnection(); 
			sql = "select userPassword from userList where userID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공; return 의 목적은 함수 강제 종료  
				}else {
					return 0; // 로그인 실패
				}
			}
			return -1; //아이디 없음
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
				if (rs != null) {rs.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return -2; //DB 오류
	}
	
	public int join(UserDTO userDTO){
		String sql = null;
		try {
			con = ds.getConnection();
			sql = "insert into userList values(?, ?, ?, ?, ?, ?, ?)"; //물음표는 따옴표 필요없다...
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userDTO.getUserID());
			pstmt.setString(2, userDTO.getUserPassword());
			pstmt.setString(3, userDTO.getUserName());
			pstmt.setString(4, userDTO.getUserGender());
			pstmt.setString(5, userDTO.getUserEmail());
			pstmt.setInt(6, userDTO.getUserAdmin());
			pstmt.setTimestamp(7, userDTO.getUserJoinDate());
			
			try {
				pstmt.executeUpdate();
				return 1;
			} catch(SQLIntegrityConstraintViolationException id){
				id.printStackTrace();
				return -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {con.close();}
				if (pstmt != null) {pstmt.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	public UserDTO FindPw(String id, String mail) {
		String sql="";
		UserDTO dto = null;
		
		try {
			con = ds.getConnection();
			sql="select * from userList where userID = ? and userEmail=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, mail);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String email = rs.getString("userEmail"); 
				
				if(email.equals(mail)) {
					dto = new UserDTO();
					dto.setUserID(rs.getString("userID"));
					dto.setUserPassword(rs.getString("userPassword"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}	
	public UserDTO findId(String name, String email) throws SQLException{
		String sql = null;
		UserDTO member = null;
		try {
			con = ds.getConnection();
			sql = "select * from userList where userName=? and userEmail=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);//첫번째 물음표가 1번 그 다음이 2번 
			pstmt.setString(2, email);
			//System.out.println("sql "+ sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {		
				String username =rs.getString("userName");
				String useremail = rs.getString("userEmail");
				
				//System.out.println("username :" + username);
				//System.out.println("usereamil :"+useremail);
				
				if(username.equals(name) && useremail.equals(email)){
					
					member = new UserDTO();
					member.setUserID(rs.getString("userID"));
				}
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}	finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		
		return member;
	}
	
}

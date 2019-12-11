package board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private DataSource ds;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;

	public BoardDAO() {

		// 생성자로 DB 연결 (보안 위해 context.xml?)
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/OracleDB");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public Timestamp getDate() { //작성시간 기입
		String sql = null;
		try {
			con = ds.getConnection(); 
			sql = "select systimestamp from dual";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getTimestamp(1);
			}
			
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
		return null; //DB 오류
	}
	
	public int getNext() { //게시글 번호
		String sql = null;
		try {
			con = ds.getConnection(); 
			sql = "select boardID from userMyTableBoard order by boardID desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 게시물인 경우
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
		return -1; //DB 오류
	}
	
	public boolean nextPage(int pageNumber) { //게시글 페이징 처리
		String sql = null;
		
		try {
			con = ds.getConnection(); 
			sql = "select * from userMyTableBoard where boardID < ? and boardAvailable = 1 and boardUserID = ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); //로그인에서부터 readAction 까지 가져온 userID 를 여기에 넣자는 의미. 지금은 땜빵
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
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
		return false; //DB 오류
		
	}
	

	public ArrayList<BoardDTO> read(int pageNumber, String userID) {
		String sql = null;
		
		try {
			ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
			con = ds.getConnection(); 
			sql = "select * from userMyTableBoard where boardID < ?  and boardAvailable = 1 and boardUserID = ?  and rownum <= 10 order by boardID desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); //로그인에서부터 readAction 까지 가져온 userID 를 여기에 넣자는 의미. 지금은 땜빵
			pstmt.setString(2, userID); //로그인에서부터 readAction 까지 가져온 userID 를 여기에 넣자는 의미. 지금은 땜빵
			rs = pstmt.executeQuery();
			
			while(rs.next()) { //로그인한 사람이 이전에 MyTable 을 저장해둔 경우
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBoardID(rs.getInt("boardID"));
				boardDTO.setBoardTitle(rs.getString("boardTitle"));
				boardDTO.setBoardPrice(rs.getInt("boardPrice"));
				boardDTO.setBoardEa(rs.getInt("boardEa"));
				boardDTO.setBoardSeller(rs.getString("boardSeller"));
				boardDTO.setBoardSellerLink(rs.getString("boardSellerLink"));
				boardDTO.setBoardDate(rs.getTimestamp("boardDate"));
				boardDTO.setBoardAvailable(rs.getInt("boardAvailable"));
				boardDTO.setBoardUserID(rs.getString(userID));
				
				boardList.add(boardDTO);
			}
			System.out.println("읽는중 DAO");
			return boardList; 
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
		return null; //DB 오류
		
	}
	
	public int write(BoardDTO boardDTO) {
		
		//String userID;
		String sql = null;
		try {
			con = ds.getConnection(); 
			sql = "insert into userMyTableBoard values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardDTO.getBoardID());
			pstmt.setString(2, boardDTO.getBoardTitle());
			pstmt.setInt(3, boardDTO.getBoardPrice());
			pstmt.setInt(4, boardDTO.getBoardEa());
			pstmt.setString(5, boardDTO.getBoardSeller());
			pstmt.setString(6, boardDTO.getBoardSellerLink());
			pstmt.setTimestamp(7, boardDTO.getBoardDate());
			pstmt.setInt(8, boardDTO.getBoardAvailable()); //boardAvailable; 처음 작성시 글은 보여진다는 의미. 
			pstmt.setString(9, boardDTO.getBoardUserID()); //로그인에서부터 readAction 까지 가져온 userID 를 여기에 넣자는 의미. 지금은 땜빵
			
			pstmt.executeUpdate();
			
			return 1;
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
		return -1; //DB 오류
		
	}

}

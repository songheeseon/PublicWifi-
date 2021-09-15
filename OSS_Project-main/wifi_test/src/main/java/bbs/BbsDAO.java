package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import jsp.util.DBConnection;

public class BbsDAO {
	// 게시글 번호 부여 메소드
	public int getNext() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select bbsID from bbs order by bbsID desc";
		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql.toString());
			// 쿼리 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	// 글쓰기 메소드
	public int write(String bbsTitle, String userID, String bbsContent) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			// 쿼리 생성한다.
			// 가입일의 경우 자동으로 세팅되게 하기 위해 sysdate를 사용
			StringBuffer sql = new StringBuffer();
			sql.append("insert into bbs (bbsID,bbstitle,id,bbsContent,bbsDate,bbsAvailable) values(?, ?, ?, ?, sysdate(), ?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, bbsContent);
			pstmt.setInt(5, 1); // 글의 유효번호
			result = pstmt.executeUpdate();
			conn.commit();
			return result;
		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			// 오류시 롤백
			conn.rollback();
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

	// 게시글 리스트 메소드
	public ArrayList<Bbs> getList(int pageNumber) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10");
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setId(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return list;
	}

	// 페이징 처리 메소드
	public boolean nextPage(int pageNumber) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		String sql = "select * from bbs where bbsID < ? and bbsAvailable = 1";
		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return result;
	}

	// 하나의 게시글을 보는 메소드
	public Bbs getBbs(int bbsID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bbs where bbsID = ?";
		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setId(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 게시글 수정 메소드
	public int update(int bbsID, String bbsTitle, String bbsContent) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			StringBuffer query = new StringBuffer();
			query.append("update bbs set bbstitle = ?, bbsContent = ? where bbsID = ?");
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			result = pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit();
		} catch (Exception sqle) {
			conn.rollback(); // 오류시 롤백
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return result;
	}

	// 게시글 삭제 메소드
	public int delete(int bbsID) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 실제 데이터를 삭제하는 것이 아니라 게시글 유효숫자를 '0'으로 수정한다
		String sql = "update bbs set bbsAvailable = 0 where bbsID = ?";
		int result = 0;
		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();
			// 자동 커밋을 false로 한다.
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			result = pstmt.executeUpdate();
			return result;
		} catch (Exception sqle) {
			conn.rollback(); // 오류시 롤백
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
	}

}
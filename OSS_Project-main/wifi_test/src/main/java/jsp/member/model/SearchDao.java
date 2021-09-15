package jsp.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SearchDao {
	private Connection conn;

	public SearchDao(Connection conn) {
		this.conn = conn;
	}

	public String searchId(String Name, String Phone) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select Id from user " + "where Name = ? and Phone = ? ");
			pstmt.setString(1, Name);
			pstmt.setString(2, Phone);
			rs = pstmt.executeQuery();
			if (rs.next())
				return (rs.getString("Id"));
			else
				return null;
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}

	}

	public String searchPwd(String Id, String Phone) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select Password from user " + "where Id = ? and Phone = ? ");
			pstmt.setString(1, Id);
			pstmt.setString(2, Phone);
			rs = pstmt.executeQuery();
			if (rs.next())
				return (rs.getString("Password"));
			else
				return null;
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}

	}

}

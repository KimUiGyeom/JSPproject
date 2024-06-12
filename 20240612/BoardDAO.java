package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {
	private static BoardDAO instance;

	private BoardDAO() {

	}

	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}

	public int getListCount(String items, String text) {
		String sql;
		if (items == null && text == null)
			sql = "select count(*) from board";
		else
			sql = "select count(*) from board where " + items + " like '%" + text + "%'";

		try (Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next())
				return rs.getInt(1);
		} catch (Exception ex) {
			System.out.println("getListCount() 에러: " + ex);
		}
		return 0;
	}

	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		String sql;
		if (items == null && text == null)
			sql = "select * from board order by num desc";
		else
			sql = "select * from board where " + items + " like '%" + text + "%' order by num desc";

		int total_record = getListCount(items, text);
		int start = (page - 1) * limit;
		int index = start + 1;

		ArrayList<BoardDTO> list = new ArrayList<>();

		try (Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				list.add(board);

				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
		} catch (Exception ex) {
			System.out.println("getBoardList() 에러: " + ex);
		}
		return list;
	}

	public String getLoginNameById(String id) {
		String sql = "select * from member where id =? ";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next())
					return rs.getString("name");
			}
		} catch (Exception ex) {
			System.out.println("getLoginNameById() 에러 : " + ex);
		}
		return null;
	}

	public void insertBoard(BoardDTO board) {
		String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getName());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getRegist_day());
			pstmt.setInt(7, board.getHit());
			pstmt.setString(8, board.getIp());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertBoard() 에러 : " + ex);
		}
	}

	public void updateHit(int num) {
		String selectSql = "select hit from board where num =?";
		String updateSql = "update board set hit=? where num=?";
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement selectPstmt = conn.prepareStatement(selectSql)) {
			selectPstmt.setInt(1, num);
			try (ResultSet rs = selectPstmt.executeQuery()) {
				if (rs.next()) {
					int hit = rs.getInt("hit") + 1;
					try (PreparedStatement updatePstmt = conn.prepareStatement(updateSql)) {
						updatePstmt.setInt(1, hit);
						updatePstmt.setInt(2, num);
						updatePstmt.executeUpdate();
					}
				}
			}
		} catch (Exception ex) {
			System.out.println("updateHit() 에러: " + ex);
		}
	}

	public BoardDTO getBoardByNum(int num, int page) {
		updateHit(num);
		String sql = "select * from board where num =?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, num);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					BoardDTO board = new BoardDTO();
					board.setNum(rs.getInt("num"));
					board.setId(rs.getString("id"));
					board.setName(rs.getString("name"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegist_day(rs.getString("regist_day"));
					board.setHit(rs.getInt("hit"));
					board.setIp(rs.getString("ip"));
					return board;
				}
			}
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 에러: " + ex);
		}
		return null;
	}

	public void updateBoard(BoardDTO board) {
		String sql = "update board set name=?, subject=?, content=? where num=?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			conn.setAutoCommit(false);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getNum());
			pstmt.executeUpdate();
			conn.commit();
		} catch (Exception ex) {
			System.out.println("updateBoard() 에러: " + ex);
		}
	}

	public void deleteBoard(int num) {
		String sql = "delete from board where num=?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteBoard() 에러: " + ex);
		}
	}
}

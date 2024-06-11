<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
String foodID = request.getParameter("id");

PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	String sql = "SELECT * FROM food WHERE foodID=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, foodID);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "DELETE FROM food WHERE foodID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, foodID);
		pstmt.executeUpdate();
	} else {
		out.println("일치하는 음식이 없습니다");
	}
} catch (SQLException e) {
	e.printStackTrace();
	out.println("오류가 발생했습니다: " + e.getMessage());
} finally {
	if (rs != null) {
		try {
	rs.close();
		} catch (SQLException e) {
	e.printStackTrace();
		}
	}
	if (pstmt != null) {
		try {
	pstmt.close();
		} catch (SQLException e) {
	e.printStackTrace();
		}
	}
	if (conn != null) {
		try {
	conn.close();
		} catch (SQLException e) {
	e.printStackTrace();
		}
	}
}

response.sendRedirect("editFood.jsp?edit=delete");
%>

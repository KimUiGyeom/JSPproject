<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Food"%>
<%@ page import="dao.FoodRepository"%>
<%@ include file="dbconn.jsp"%>

<%
String id = request.getParameter("id");
if (id == null || id.trim().equals("")) {
	response.sendRedirect("foods.jsp");
	return;
}

PreparedStatement pstmt = null;
ResultSet rs = null;
Food food = null;
try {
	String sql = "SELECT * FROM food WHERE foodID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		food = new Food();
		food.setFoodID(rs.getString("foodID"));
		food.setName(rs.getString("name"));
		food.setUnitPrice(rs.getInt("unitPrice"));
		food.setCoo(rs.getString("coo"));
		food.setDescription(rs.getString("description"));
		food.setCal(rs.getInt("cal"));
		food.setFoodImage(rs.getString("foodImage"));
	}
} catch (SQLException e) {
	e.printStackTrace();
} finally {
	if (rs != null)
		try {
	rs.close();
		} catch (SQLException e) {
	e.printStackTrace();
		}
	if (pstmt != null)
		try {
	pstmt.close();
		} catch (SQLException e) {
	e.printStackTrace();
		}
	if (conn != null)
		try {
	conn.close();
		} catch (SQLException e) {
	e.printStackTrace();
		}
}

if (food == null) {
	response.sendRedirect("exceptionNoFoodId.jsp");
	return;
}

ArrayList<Food> list = (ArrayList<Food>) session.getAttribute("cartlist");
if (list == null) {
	list = new ArrayList<Food>();
	session.setAttribute("cartlist", list);
}

int cnt = 0;
for (int i = 0; i < list.size(); i++) {
	Food goodsQnt = list.get(i);
	if (goodsQnt.getFoodID().equals(id)) {
		cnt++;
		int orderQuantity = goodsQnt.getQuantity() + 1;
		goodsQnt.setQuantity(orderQuantity);
		break;
	}
}

if (cnt == 0) {
	food.setQuantity(1);
	list.add(food);
}

response.sendRedirect("foodDetail.jsp?id=" + id);
%>

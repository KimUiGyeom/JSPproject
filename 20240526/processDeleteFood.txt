<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="dao.FoodRepository"%>

<%
request.setCharacterEncoding("UTF-8");

String foodId = request.getParameter("foodID");

FoodRepository dao = (FoodRepository) application.getAttribute("foodDAO");
if (dao == null) {
	dao = FoodRepository.getInstance();
	application.setAttribute("foodDAO", dao);
}

dao.deleteFood(foodId);

response.sendRedirect("foods.jsp");
%>

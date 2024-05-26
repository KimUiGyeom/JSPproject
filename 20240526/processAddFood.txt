<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="dto.Food" import="dao.FoodRepository"%>

<%
request.setCharacterEncoding("UTF-8");

String foodId = request.getParameter("foodID");
String name = request.getParameter("name");
String unitPrice = request.getParameter("unitPrice");
String coo = request.getParameter("coo");
String cal = request.getParameter("cal");
String description = request.getParameter("description");
String foodType = request.getParameter("foodType");

Integer price;
if (unitPrice.isEmpty()) {
	price = 0;
} else {
	price = Integer.valueOf(unitPrice);
}

Integer calories;
if (cal.isEmpty()) {
	calories = 0;
} else {
	calories = Integer.valueOf(cal);
}

FoodRepository dao = (FoodRepository) application.getAttribute("foodDAO");
if (dao == null) {
	dao = FoodRepository.getInstance();
	application.setAttribute("foodDAO", dao);
}

Food newFood = new Food();
newFood.setFoodID(foodId);
newFood.setName(name);
newFood.setUnitPrice(price);
newFood.setCoo(coo);
newFood.setCal(calories);
newFood.setDescription(description);

if ("general".equals(foodType)) {
	dao.addGeneralFood(newFood);
} else if ("seasonal".equals(foodType)) {
	dao.addSeasonalFood(newFood);
} else if ("other".equals(foodType)) {
	dao.addOtherFood(newFood);
}

response.sendRedirect("foods.jsp");
%>

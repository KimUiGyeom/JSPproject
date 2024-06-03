<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList" import="dto.Food"
	import="dao.FoodRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 비우기</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("foods.jsp");
		return;
	}
	FoodRepository dao = FoodRepository.getInstance();

	Food food = dao.getFoodById(id);
	if (food == null) {
		response.sendRedirect("exceptionNoFoodId.jsp");
	}

	ArrayList<Food> cartList = (ArrayList<Food>) session.getAttribute("cartlist");
	Food goodsQnt = new Food();
	for (int i = 0; i < cartList.size(); i++) {
		goodsQnt = cartList.get(i);
		if (goodsQnt.getFoodID().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}
	response.sendRedirect("cart.jsp");
	%>
</body>
</html>
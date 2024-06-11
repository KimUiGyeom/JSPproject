<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie orderDateTime = new Cookie("Shipping_orderDateTime", URLEncoder.encode(request.getParameter("orderDateTime"), "utf-8"));
	Cookie deliveryTime = new Cookie("Shipping_deliveryTime", URLEncoder.encode(request.getParameter("deliveryTime"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));
	
	
	cartId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);
	orderDateTime.setMaxAge(24 * 60 * 60);
	deliveryTime.setMaxAge(24 * 60 * 60);
	addressName.setMaxAge(24 * 60 * 60);
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(orderDateTime);
	response.addCookie(deliveryTime);
	response.addCookie(addressName);
	
	response.sendRedirect("orderConfirmation.jsp");
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>주문 완료</title>
</head>
<body>
	<%
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_orderDateTime = "";
	String shipping_deliveryTime = "";
	String shipping_addressName = "";

	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
		shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_deliveryTime"))
		shipping_deliveryTime = URLDecoder.decode((thisCookie.getValue()), "utf-8");

		}
	}
	%>
	<div class="container py-4">
		<%@ include file="header.jsp"%>

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">주문 완료</h1>
				<p class="col-md-8 fs-4">Order Completed</p>
			</div>
		</div>
		<div class="row align-items-md-stretch">
			<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
			<p>
				주문은
				<%
			out.println(shipping_deliveryTime);
			%>에 배달될 예정입니다!
			</p>
			<p>
				주문번호:<%
			out.println(shipping_cartId);
			%>
			</p>
		</div>
		<div class="container">
			<p>
				<a href="./foods.jsp" class="btn btn-secondary">&laquo;음식 목록</a>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>
<%
session.invalidate();

for (int i = 0; i < cookies.length; i++) {
	Cookie thisCookie = cookies[i];
	String n = thisCookie.getName();
	if (n.equals("Shipping_cartId"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_name"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_orderDateTime"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_deliveryTime"))
		thisCookie.setMaxAge(0);
	if (n.equals("Shipping_addressName"))
		thisCookie.setMaxAge(0);

	response.addCookie(thisCookie);
}
%>
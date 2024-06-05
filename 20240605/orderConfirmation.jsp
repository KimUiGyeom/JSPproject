<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"
	import="java.net.URLDecoder" import="dto.Food"
	import="dao.FoodRepository"%>

<%
request.setCharacterEncoding("UTF-8");

String cartId = session.getId();

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
		if (n.equals("Shipping_name"))
	shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_orderDateTime"))
	shipping_orderDateTime = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_deliveryTime"))
	shipping_deliveryTime = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_addressName"))
	shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	}
}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 정보</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="header.jsp"%>

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">주문 정보</h1>
				<p class="col-md-8 fs-4">Order Info</p>
			</div>
		</div>
		<div class="row align-items-md-stretch alert alert-info">
			<div class="text-center">
				<h1>영수증</h1>
			</div>
			<div class="row justify-content-between">
				<div class="col-4" align="left">
					<strong>배달 주소</strong> <br> 주문자명:
					<%
 out.println(shipping_name);
 %><br> 주소 :
					<%
 out.println(shipping_addressName);
 %>
				</div>
				<div class="col-4" align="right">
					<p>
						<em>배달예정시간: <%
						out.println(shipping_deliveryTime);
						%></em>
					</p>
				</div>
			</div>
			<div class="py-5">
				<table class="table table-hover">
					<tr>
						<th class="text-center">음식</th>
						<th class="text-center">#</th>
						<th class="text-center">가격</th>
						<th class="text-center">소계</th>
					</tr>
					<%
					int sum = 0;
					ArrayList<Food> cartList = (ArrayList<Food>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Food>();
					for (int i = 0; i < cartList.size(); i++) {
						Food food = cartList.get(i);
						int total = food.getUnitPrice() * food.getQuantity();
						sum = sum + total;
					%>
					<tr>
						<td class="text-center"><em><%=food.getName()%></em></td>
						<td class="text-center"><%=food.getQuantity()%></td>
						<td class="text-center"><%=food.getUnitPrice()%>원</td>
						<td class="text-center"><%=total%>원</td>
					</tr>
					<%
					}
					%>
					<tr>
						<td></td>
						<td></td>
						<td class="text-right"><strong>총액: </strong></td>
						<td class="text-center text-danger"><strong><%=sum%>원</strong></td>
					</tr>
				</table>
				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>"
					class="btn btn-secondary" role="button">이전</a> <a
					href="./thankCustomer.jsp" class="btn btn-success" role="button">주문
					완료</a> <a href="./checkOutCancelled.jsp" class="btn btn-secondary"
					role="button">취소</a>
			</div>
		</div>
	</div>
</body>
</html>

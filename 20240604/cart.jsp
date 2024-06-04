<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList" import="dto.Food"
	import="dao.FoodRepository"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
String cartId = session.getId();
%>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="header.jsp"%>

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">장바구니</h1>
				<p class="col-md-8 fs-4">Cart</p>
			</div>
		</div>

		<div class="row align-items-md-stretch">
			<div class="row">
				<table width="100%">
					<tr>
						<td align="left"><a
							href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
						<td align="right"><a
							href="./shippingInfo.jsp?cartId=<%=cartId%>"
							class="btn btn-success">주문하기</a></td>
					</tr>
				</table>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>음식</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
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
						<td><%=food.getFoodID()%> - <%=food.getName()%></td>
						<td><%=food.getUnitPrice()%></td>
						<td><%=food.getQuantity()%></td>
						<td><%=total%></td>
						<td><a href="./removeCart.jsp?id=<%=food.getFoodID()%>"
							class="badge text-bg-danger">삭제</a></td>
					</tr>
					<%
					}
					%>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><%=sum%></th>
						<th></th>
					</tr>
				</table>
				<a href="./foods.jsp" class="btn btn-secondary"> &laquo; 주문 계속하기</a>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
</body>
</html>
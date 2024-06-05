<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>배송 정보</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="header.jsp"%>

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">배달 정보</h1>
				<p class="col-md-8 fs-4">Shipping Info</p>
			</div>
		</div>
		<div class="row align-items-md-stretch">
			<form action="./processShippingInfo.jsp" method="post">
				<input type="hidden" name="cartId"
					value="<%=request.getParameter("cartId")%>">
				<div class="mb-3 row">
					<label class="col-sm-2">주문자명</label>
					<div class="col-sm-3">
						<input type="text" name="name" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">주문일시</label>
					<div class="col-sm-3">
						<input type="text" name="orderDateTime" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">배달예정시간</label>
					<div class="col-sm-3">
						<input type="text" name="deliveryTime" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-3">
						<input type="text" name="addressName" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
						<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>"
							class="btn btn-secondary" role="button">이전</a> <input
							type="submit" class="btn btn-primary" value="등록" /> <a
							href="./checkOutCancelled.jsp" class="btn btn-secondary"
							role="button">취소</a>
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
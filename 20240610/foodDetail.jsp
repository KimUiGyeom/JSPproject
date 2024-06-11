<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoFoodId.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 상세 정보</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function addToCart() {
		if (confirm("음식을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
<style>
.food-img {
	width: 300px;
	height: 300px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="row align-items-md-stretch text-center">
		<%@ include file="dbconn.jsp"%>

		<div class="container py-4">


			<div class="p-5 mb-4 bg-light rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">음식 상세 정보</h1>
					<p class="col-md-8 fs-4">여기에서 음식의 상세 정보를 확인할 수 있습니다.</p>
				</div>
			</div>
			<%
			String id = request.getParameter("id");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM food WHERE foodID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
			%>

			<div class="row align-items-md-stretch">
				<div class="col-md-12">
					<p>
						<img src="./images/<%=rs.getString("foodImage")%>"
							alt="<%=rs.getString("name")%>" class="food-img" />
					</p>
					<h3>
						<b><%=rs.getString("name")%></b>
					</h3>
					<p><%=rs.getString("description")%></p>
					<p>
						<b>음식 코드:</b> <span class="badge bg-secondary"><%=rs.getString("foodID")%></span>
					</p>
					<p>
						<b>원산지:</b>
						<%=rs.getString("coo")%></p>
					<p>
						<b>칼로리:</b>
						<%=rs.getString("cal")%>
						kcal
					</p>
					<h4>
						가격:
						<%=rs.getString("unitPrice")%>원
					</h4>
					<form name="addForm"
						action="./addCart.jsp?id=<%=rs.getString("foodID")%>"
						method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">음식 주문
							&raquo;</a> <a href="./cart.jsp" class="btn btn-warning">장바구니
							&raquo;</a> <a href="./foods.jsp" class="btn btn-secondary">음식 목록
							&raquo;</a>
					</form>
					<br>
					<div>
						<form action="processDeleteFood.jsp" method="post"
							style="display: inline;">
							<input type="hidden" name="foodID"
								value="<%=rs.getString("foodID")%>" /> <input type="submit"
								class="btn btn-danger" value="삭제" />
						</form>
					</div>
					<%
					}
					if (rs != null)
					rs.close();
					if (pstmt != null)
					pstmt.close();
					if (conn != null)
					conn.close();
					%>
				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp" />
	</div>

</body>
</html>

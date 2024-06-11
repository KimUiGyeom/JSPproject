<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>음식 수정</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="header.jsp"%>

		<div class="p-5 mb-4 bg-light rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">음식 수정</h1>
				<p class="col-md-8 fs-4">Food Updating</p>
			</div>
		</div>
		<%@ include file="dbconn.jsp"%>
		<%
		String foodID = request.getParameter("foodID");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM food WHERE foodID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, foodID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
		%>
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="./images/<%=rs.getString("foodImage")%>" alt="image"
					class="img-fluid" />
			</div>
			<div class="col-md-7">
				<form name="newFood" action="./processUpdateFood.jsp" method="post"
					enctype="multipart/form-data">
					<div class="mb-3 row">
						<label for="foodID" class="col-sm-2 col-form-label">음식 코드</label>
						<div class="col-sm-5">
							<input type="text" name="foodID" id="foodID" class="form-control"
								value='<%=rs.getString("foodID")%>' readonly>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="name" class="col-sm-2 col-form-label">음식명</label>
						<div class="col-sm-5">
							<input type="text" name="name" id="name" class="form-control"
								value='<%=rs.getString("name")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="coo" class="col-sm-2 col-form-label">원산지</label>
						<div class="col-sm-5">
							<input type="text" name="coo" id="coo" class="form-control"
								value='<%=rs.getString("coo")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="cal" class="col-sm-2 col-form-label">칼로리</label>
						<div class="col-sm-5">
							<input type="text" name="cal" id="cal" class="form-control"
								value='<%=rs.getString("cal")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="description" class="col-sm-2 col-form-label">상세정보</label>
						<div class="col-sm-8">
							<textarea name="description" id="description" cols="50" rows="2"
								class="form-control" placeholder="5자 이상 적어주세요"><%=rs.getString("description")%></textarea>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="unitPrice" class="col-sm-2 col-form-label">가격</label>
						<div class="col-sm-5">
							<input type="text" name="unitPrice" id="unitPrice"
								class="form-control" value='<%=rs.getString("unitPrice")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="file" class="col-sm-2 col-form-label">음식 이미지</label>
						<div class="col-sm-5">
							<input type="file" name="file" id="file" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-10">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
			<%
			}
			} catch (SQLException e) {
			e.printStackTrace();
			out.println("<p>There was an error: " + e.getMessage() + "</p>");
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
			%>
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>

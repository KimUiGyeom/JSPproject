<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>음식 목록</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="header.jsp"%>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">음식목록</h1>
				<p class="col-md-8 fs-4">FoodList</p>
			</div>
		</div>
		<%@ include file="dbconn.jsp"%>
		<div class="row align-items-md-stretch text-center">
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM food";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div class="col-md-4">
				<div class="h-100 p-2">
					<img src="./images/<%=rs.getString("foodImage")%>"
						style="width: 250px; height: 350px" />
					<h5>
						<b><%=rs.getString("name")%></b>
					</h5>
					<p><%=rs.getString("coo")%></p>
					<p><%=rs.getString("cal")%>kcal
					</p>
					<p><%=rs.getString("description")%></p>
					<p><%=rs.getString("unitPrice")%>원
					</p>
					<p>
						<a href="./foodDetail.jsp?id=<%=rs.getString("foodID")%>"
							class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
					</p>
				</div>
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
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>

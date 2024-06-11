<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>음식 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 음식을 삭제합니다") == true)
			location.href = "./deleteFood.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
String edit = request.getParameter("edit");
if(edit==null){
	edit="update";
}
%>
<body>
	<div class="container py-4">
		<%@ include file="header.jsp"%>

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">음식 편집</h1>
				<p class="col-md-8 fs-4">FoodEditing</p>
			</div>
		</div>
		<%@ include file="dbconn.jsp"%>
		<div class="row align-items-md-stretch text-center">
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM food";
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (!rs.isBeforeFirst()) {
			%>
			<p>No food items found.</p>
			<%
			} else {
			while (rs.next()) {
			%>
			<div class="col-md-4">
				<div class="h-100 p-2 rounded-3">
					<img src="./images/<%=rs.getString("foodImage")%>"
						style="width: 250px; height: 350px" />
					<h5>
						<b><%=rs.getString("name")%></b>
					</h5>
					<p><%=rs.getString("coo")%></p>
					<p><%=rs.getString("cal")%>
						kcal
					</p>
					<p><%=rs.getString("description")%></p>
					<p><%=rs.getString("unitPrice")%>
						원
					</p>
					<%
					if ("update".equals(edit)) {
					%>
					<a href="./updateFood.jsp?foodID=<%=rs.getString("foodID")%>"
						class="btn btn-success" role="button">수정 &raquo;</a>
					<%
					} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("foodID")%>')"
						class="btn btn-danger" role="button">삭제 &raquo;</a>
					<%
					}
					%>
				</div>
			</div>
			<%
			}
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
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>

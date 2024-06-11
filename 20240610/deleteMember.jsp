<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<title>회원 삭제</title>
</head>
<body>
	<form method="post" action="deleteMember.jsp">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="password"></p>
		<p><input type="submit" value="삭제"></p>
	</form>

	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if (id != null && !id.isEmpty() && password != null && !password.isEmpty()) {
	%>

	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/jspdb" driver="com.mysql.jdbc.Driver"
		user="root" password="1234" />

	<sql:update dataSource="${dataSource}" var="resultSet">
        DELETE FROM member WHERE id = ? AND password = ?
        <sql:param value="<%=id%>" />
		<sql:param value="<%=password%>" />
	</sql:update>

	<c:choose>
		<c:when test="${resultSet >= 1}">
			<p>회원 정보가 성공적으로 삭제되었습니다.</p>
		</c:when>
		<c:otherwise>
			<p>회원 정보를 찾을 수 없거나 비밀번호가 올바르지 않습니다.</p>
		</c:otherwise>
	</c:choose>

	<%
	} else {
	out.println("삭제할 아이디와 비밀번호를 입력해주세요.");
	}
	%>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String mail = request.getParameter("mail");
String phone = request.getParameter("phone");
String address = request.getParameter("address");

java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String regist_day = sdf.format(new java.util.Date());
%>
<html>
<head>
<title>회원가입 처리</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/jspdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="1234" />

	<sql:update dataSource="${dataSource}" var="resultSet">
		INSERT INTO member(id, password, name, gender, birth, mail, phone, address, regist_day) 
		VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
		<sql:param value="<%=id%>" />
		<sql:param value="<%=password%>" />
		<sql:param value="<%=name%>" />
		<sql:param value="<%=gender%>" />
		<sql:param value="<%=birth%>" />
		<sql:param value="<%=mail%>" />
		<sql:param value="<%=phone%>" />
		<sql:param value="<%=address%>" />
		<sql:param value="<%=regist_day%>" />
	</sql:update>

	<c:import url="resultMember.jsp">
		<c:param name="id" value="<%=id%>" />
		<c:param name="name" value="<%=name%>" />
		<c:param name="gender" value="<%=gender%>" />
		<c:param name="birth" value="<%=birth%>" />
		<c:param name="mail" value="<%=mail%>" />
		<c:param name="phone" value="<%=phone%>" />
		<c:param name="address" value="<%=address%>" />
		<c:param name="regist_day" value="<%=regist_day%>" />
	</c:import>

</body>
</html>

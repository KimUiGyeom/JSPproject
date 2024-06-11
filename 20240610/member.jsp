<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/jspdb" driver="com.mysql.jdbc.Driver"
		user="root" password="1234" />

	<sql:query var="resultSet" dataSource="${dataSource }">
		SELECT * FROM member
		</sql:query>

	<table border="1">
		<tr>
			<c:forEach var="columnName" items="${resultSet.columnNames }">
				<th width="100"><c:out value="${columnName}" /></th>
			</c:forEach>
		</tr>
		<c:forEach var="row" items="${resultSet.rowsByIndex}">
			<tr>
				<c:forEach var="column" items="${row}" varStatus="i">
					<td><c:choose>
							<c:when test="${column != null}">
								<c:out value="${column}" />
							</c:when>
							<c:otherwise>
								&nbsp;
							</c:otherwise>
						</c:choose></td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>

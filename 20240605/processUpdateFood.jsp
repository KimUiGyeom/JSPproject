<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page
	import="java.util.*, 
	java.sql.*, 
	org.apache.commons.fileupload.FileItem, 
	org.apache.commons.fileupload.disk.DiskFileItemFactory,
	 org.apache.commons.fileupload.servlet.ServletFileUpload,
	  java.io.File"%>
<%@ include file="dbconn.jsp"%>

<%
request.setCharacterEncoding("UTF-8");

if (!ServletFileUpload.isMultipartContent(request)) {
	response.getWriter().println("Form must have enctype=multipart/form-data.");
	return;
}

String foodID = null;
String name = null;
String unitPriceStr = null;
String coo = null;
String calStr = null;
String description = null;
String fileName = null;

try {
	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List<FileItem> formItems = upload.parseRequest(request);

	for (FileItem item : formItems) {
		if (item.isFormField()) {
	String fieldName = item.getFieldName();
	String fieldValue = item.getString("UTF-8");
	switch (fieldName) {
	case "foodID":
		foodID = fieldValue;
		break;
	case "name":
		name = fieldValue;
		break;
	case "unitPrice":
		unitPriceStr = fieldValue;
		break;
	case "coo":
		coo = fieldValue;
		break;
	case "cal":
		calStr = fieldValue;
		break;
	case "description":
		description = fieldValue;
		break;
	}
		} else {
	if (!item.getName().isEmpty()) {
		fileName = new File(item.getName()).getName();
		String filePath = getServletContext().getRealPath("/") + "images" + File.separator + fileName;
		File storeFile = new File(filePath);
		item.write(storeFile);
	}
		}
	}
} catch (Exception ex) {
	ex.printStackTrace();
	response.getWriter().println("There was an error: " + ex.getMessage());
	return;
}

int unitPrice = 0;
if (unitPriceStr != null && !unitPriceStr.isEmpty()) {
	try {
		unitPrice = Integer.parseInt(unitPriceStr);
	} catch (NumberFormatException e) {
		e.printStackTrace();
	}
}

int cal = 0;
if (calStr != null && !calStr.isEmpty()) {
	try {
		cal = Integer.parseInt(calStr);
	} catch (NumberFormatException e) {
		e.printStackTrace();
	}
}

PreparedStatement pstmt = null;

try {
	String sql = "UPDATE food SET name=?, unitPrice=?, coo=?, description=?, cal=?, foodImage=? WHERE foodID=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, unitPrice);
	pstmt.setString(3, coo);
	pstmt.setString(4, description);
	pstmt.setInt(5, cal);
	pstmt.setString(6, fileName);
	pstmt.setString(7, foodID);
	pstmt.executeUpdate();
} catch (SQLException e) {
	e.printStackTrace();
	response.getWriter().println("There was an error: " + e.getMessage());
} finally {
	if (pstmt != null) {
		try {
	pstmt.close();
		} catch (SQLException e) {
	e.printStackTrace();
		}
	}
	if (conn != null) {
		try {
	conn.close();
		} catch (SQLException e) {
	e.printStackTrace();
		}
	}
}

response.sendRedirect("editFood.jsp?edit=update");
%>

<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page
	import="org.apache.commons.fileupload.FileItem, org.apache.commons.fileupload.disk.DiskFileItemFactory, org.apache.commons.fileupload.servlet.ServletFileUpload, java.sql.*, java.util.*, java.io.File"%>
<%@ include file="dbconn.jsp"%>

<%
request.setCharacterEncoding("UTF-8");

if (!ServletFileUpload.isMultipartContent(request)) {
	response.getWriter().println("Error: Form must have enctype=multipart/form-data.");
	return;
}

DiskFileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);

upload.setFileSizeMax(1024 * 1024 * 5);
upload.setSizeMax(1024 * 1024 * 10);

String uploadPath = getServletContext().getRealPath("/") + "images";
File uploadDir = new File(uploadPath);
if (!uploadDir.exists()) {
	uploadDir.mkdirs();
}

String foodID = null;
String name = null;
Integer unitPrice = null;
String coo = null;
Integer cal = null;
String description = null;
String foodType = null;
String fileName = null;

try {
	List<FileItem> formItems = upload.parseRequest(request);

	if (formItems != null && formItems.size() > 0) {
		for (FileItem item : formItems) {
	if (!item.isFormField()) {
		String originalFileName = new File(item.getName()).getName();
		fileName = System.currentTimeMillis() + "_" + originalFileName;
		String filePath = uploadPath + File.separator + fileName;
		File storeFile = new File(filePath);
		item.write(storeFile);
	} else {
		switch (item.getFieldName()) {
		case "foodID":
			foodID = item.getString("UTF-8");
			break;
		case "name":
			name = item.getString("UTF-8");
			break;
		case "unitPrice":
			unitPrice = Integer.valueOf(item.getString("UTF-8"));
			break;
		case "coo":
			coo = item.getString("UTF-8");
			break;
		case "cal":
			cal = Integer.valueOf(item.getString("UTF-8"));
			break;
		case "description":
			description = item.getString("UTF-8");
			break;
		case "foodType":
			foodType = item.getString("UTF-8");
			break;
		}
	}
		}
	}

	PreparedStatement pstmt = null;
	String sql = "INSERT INTO food (foodID, name, unitPrice, coo, description, cal, foodImage) VALUES (?, ?, ?, ?, ?, ?, ?)";

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, foodID);
		pstmt.setString(2, name);
		pstmt.setInt(3, unitPrice);
		pstmt.setString(4, coo);
		pstmt.setString(5, description);
		pstmt.setInt(6, cal);
		pstmt.setString(7, fileName);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
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

	response.sendRedirect("foods.jsp");

} catch (Exception ex) {
	ex.printStackTrace();
	response.getWriter().println("There was an error: " + ex.getMessage());
}
%>

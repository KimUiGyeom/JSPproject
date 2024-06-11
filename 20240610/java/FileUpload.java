import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.FoodRepository;
import dto.Food;

@WebServlet("/fileupload")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "images";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!ServletFileUpload.isMultipartContent(request)) {
			response.getWriter().println("Error: Form must has enctype=multipart/form-data.");
			return;
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		upload.setFileSizeMax(1024 * 1024 * 5);
		upload.setSizeMax(1024 * 1024 * 10);

		ServletContext context = getServletContext();
		String uploadPath = context.getRealPath("") + File.separator + UPLOAD_DIRECTORY;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		try {
			List<FileItem> formItems = upload.parseRequest(request);

			String foodID = null;
			String name = null;
			Integer unitPrice = null;
			String coo = null;
			Integer cal = null;
			String description = null;
			String foodType = null;
			String fileName = null;

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

			Food newFood = new Food();
			newFood.setFoodID(foodID);
			newFood.setName(name);
			newFood.setUnitPrice(unitPrice);
			newFood.setCoo(coo);
			newFood.setCal(cal);
			newFood.setDescription(description);
			newFood.setFoodImage(fileName);

			FoodRepository dao = (FoodRepository) getServletContext().getAttribute("foodDAO");
			if (dao == null) {
				dao = FoodRepository.getInstance();
				getServletContext().setAttribute("foodDAO", dao);
			}

			if ("general".equals(foodType)) {
				dao.addGeneralFood(newFood);
			} else if ("seasonal".equals(foodType)) {
				dao.addSeasonalFood(newFood);
			} else if ("other".equals(foodType)) {
				dao.addOtherFood(newFood);
			}

			response.sendRedirect("foods.jsp");

		} catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().println("There was an error: " + ex.getMessage());
        }
	}
}

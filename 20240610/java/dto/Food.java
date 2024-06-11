package dto;

import java.io.Serializable;

public class Food implements Serializable {

	private String foodID;
	private String name;
	private int unitPrice;
	private String coo; // ¿ø»êÁö(country of origin)
	private String description;
	private int cal;
	private String foodImage;

	public String getFoodImage() {
		return foodImage;
	}

	public void setFoodImage(String foodImage) {
		this.foodImage = foodImage;
	}

	private int quantity;

	public Food() {
		super();
	}

	public Food(String foodId, String name, Integer unitPrice) {
		this.foodID = foodId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	public String getFoodID() {
		return foodID;
	}

	public void setFoodID(String foodID) {
		this.foodID = foodID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getCoo() {
		return coo;
	}

	public void setCoo(String coo) {
		this.coo = coo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCal() {
		return cal;
	}

	public void setCal(int cal) {
		this.cal = cal;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}

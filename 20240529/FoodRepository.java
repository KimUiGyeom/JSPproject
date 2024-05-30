package dao;

import java.util.ArrayList;
import dto.Food;

public class FoodRepository {

	private ArrayList<Food> generalFoods = new ArrayList<>();
	private ArrayList<Food> seasonalFoods = new ArrayList<>();
	private ArrayList<Food> otherFoods = new ArrayList<>();
	private static FoodRepository instance = new FoodRepository();

	public static FoodRepository getInstance() {
		return instance;
	}

	public FoodRepository() {

		Food food1 = new Food("KUG12", "��ġ�", 8000);
		food1.setCoo("������");
		food1.setDescription("��ū�ϰ� ĮĮ�� �ѱ� ��ǥ����");
		food1.setCal(250);
		generalFoods.add(food1);

		Food food2 = new Food("KUG13", "��ū�����", 8000);
		food2.setCoo("������");
		food2.setDescription("������ ������� �˽��� û����߸� ������ Ư���� ��");
		food2.setCal(230);
		generalFoods.add(food2);

		Food food3 = new Food("KUG14", "��������", 9000);
		food3.setCoo("������");
		food3.setDescription("�������� �� ���� ���� �� ���̸� ��");
		food3.setCal(500);
		generalFoods.add(food3);

		Food food4 = new Food("KUG15", "�ҹ��Ұ��", 9000);
		food4.setCoo("������");
		food4.setDescription("������ ǳ���� �Ұ�⸦ ����� ������ ����޴� ����");
		food4.setCal(500);
		generalFoods.add(food4);

		Food food5 = new Food("KUG16", "�ߺ�����", 25000);
		food5.setCoo("������");
		food5.setDescription("�����ϰ� ���� ���� ���� Ư¡�� �ѱ��� �α� �ִ� �丮");
		food5.setCal(550);
		generalFoods.add(food5);

		Food food6 = new Food("KUG17", "�������", 6000);
		food6.setCoo("������");
		food6.setDescription("�ε巴�� ����� ���� ��ǰ�� �ѱ��� ��ǥ���� ����");
		food6.setCal(285);
		generalFoods.add(food6);

		Food food7 = new Food("KUG18", "������", 9500);
		food7.setCoo("�̱���");
		food7.setDescription("ǳ���� ���� �ε巯�� ������Ⱑ ��췯�� ��� ���� ��");
		food7.setCal(550);
		generalFoods.add(food7);

		Food food8 = new Food("KUG19", "��¡���", 8500);
		food8.setCoo("������");
		food8.setDescription("�ſ���� ������ ���� �� ��췯�� ����");
		food8.setCal(250);
		generalFoods.add(food8);

		Food food9 = new Food("KUG20", "���κ��", 8000);
		food9.setCoo("������");
		food9.setDescription("�ε巴�� ����� ���κο� ������ ������ ��ȭ�� �̷�� ����");
		food9.setCal(350);
		generalFoods.add(food9);

		Food food10 = new Food("KUG21", "�����", 8000);
		food10.setCoo("������");
		food10.setDescription("��ū�ϸ鼭�� ������ ���� �ڶ��ϴ� ����(�ܿ�ö �����޴�)");
		food10.setCal(235);
		seasonalFoods.add(food10);

		Food food11 = new Food("KUG22", "�ᱹ��", 6000);
		food11.setCoo("������");
		food11.setDescription("�ÿ��ϰ� ����� ���� ��ǰ�� ����ö ����(����ö �����޴�)");
		food11.setCal(500);
		seasonalFoods.add(food11);

		Food food12 = new Food("KUG23", "��������", 6000);
		food12.setCoo("������");
		food12.setDescription("�ÿ��ϰ� �ƻ��� ������ġ�� �̱��� ����� ��췯�� ����ö�� Ư�� ����޴� ����(����ö �����޴�)");
		food12.setCal(400);
		seasonalFoods.add(food12);

		Food food13 = new Food("KUG24", "�����", 1000);
		food13.setCoo("������");
		food13.setDescription("�����");
		food13.setCal(310);
		otherFoods.add(food13);

		Food food14 = new Food("KUG25", "����", 4000);
		food14.setCoo("������");
		food14.setDescription("���ڿ��� ���� ��� �Բ� ���� Ÿ�� �Ѿ�� �ÿ��� ����(19�� �̸� �ֹ� �Ұ��մϴ�.)");
		food14.setCal(400);
		otherFoods.add(food14);

		Food food15 = new Food("KUG26", "����", 4000);
		food15.setCoo("������");
		food15.setDescription("���� ������ ������ ���ӿ��� �δ� ���� ���⿡ ���� ����(19�� �̸� �ֹ� �Ұ��մϴ�.)");
		food15.setCal(150);
		otherFoods.add(food15);
	}

	public ArrayList<Food> getGeneralFoods() {
		return generalFoods;
	}

	public ArrayList<Food> getSeasonalFoods() {
		return seasonalFoods;
	}

	public ArrayList<Food> getOtherFoods() {
		return otherFoods;
	}

	public Food getFoodById(String foodId) {
		Food foodById = null;

		ArrayList<Food> allFoods = new ArrayList<>();
		allFoods.addAll(generalFoods);
		allFoods.addAll(seasonalFoods);
		allFoods.addAll(otherFoods);

		for (Food food : allFoods) {
			if (food != null && food.getFoodID() != null && food.getFoodID().equals(foodId)) {
				foodById = food;
				break;
			}
		}

		return foodById;
	}

	public void addGeneralFood(Food food) {
		if (food != null) {
			generalFoods.add(food);
		}
	}

	public void addSeasonalFood(Food food) {
		if (food != null) {
			seasonalFoods.add(food);
		}
	}

	public void addOtherFood(Food food) {
		if (food != null) {
			otherFoods.add(food);
		}
	}

	public void deleteFood(String foodId) {
		generalFoods.removeIf(food -> food.getFoodID().equals(foodId));
		seasonalFoods.removeIf(food -> food.getFoodID().equals(foodId));
		otherFoods.removeIf(food -> food.getFoodID().equals(foodId));
	}
}
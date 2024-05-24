package dao;

import java.util.ArrayList;
import dto.Food;

public class FoodRepository {

	private ArrayList<Food> generalFoods = new ArrayList<>();
	private ArrayList<Food> seasonalFoods = new ArrayList<>();
	private ArrayList<Food> otherFoods = new ArrayList<>();

	public FoodRepository() {

		Food food1 = new Food("KUG12", "��ġ�", 8000);
		food1.setCoo("�ѱ���");
		food1.setDescription("��ū�ϰ� ĮĮ�� �ѱ� ��ǥ����");
		food1.setCal(250);

		Food food2 = new Food("KUG13", "��ū�����", 8000);
		food2.setCoo("�ѱ���");
		food2.setDescription("������ ������� �˽��� û����߸� ������ Ư���� ��");
		food2.setCal(230);

		Food food3 = new Food("KUG14", "��������", 9000);
		food3.setCoo("�ѱ���");
		food3.setDescription("�������� �� ���� ���� �� ���̸� ��");
		food3.setCal(500);

		Food food4 = new Food("KUG15", "�ҹ��Ұ��", 9000);
		food4.setCoo("�ѱ���");
		food4.setDescription("������ ǳ���� �Ұ�⸦ ����� ������ ����޴� ����");
		food4.setCal(500);

		Food food5 = new Food("KUG16", "�ߺ�����", 25000);
		food5.setCoo("�ѱ���");
		food5.setDescription("�����ϰ� ���� ���� ���� Ư¡�� �ѱ��� �α� �ִ� �丮");
		food5.setCal(550);

		Food food6 = new Food("KUG17", "�������", 6000);
		food6.setCoo("�ѱ���");
		food6.setDescription("�ε巴�� ����� ���� ��ǰ�� �ѱ��� ��ǥ���� ����");
		food6.setCal(285);

		Food food7 = new Food("KUG18", "������", 9500);
		food7.setCoo("�̱���");
		food7.setDescription("ǳ���� ���� �ε巯�� ������Ⱑ ��췯�� ��� ���� ��");
		food7.setCal(550);

		Food food8 = new Food("KUG19", "��¡���", 8500);
		food8.setCoo("�ѱ���");
		food8.setDescription("�ſ���� ������ ���� �� ��췯�� ����");
		food8.setCal(250);

		Food food9 = new Food("KUG20", "���κ��", 8000);
		food9.setCoo("�ѱ���");
		food9.setDescription("�ε巴�� ����� ���κο� ������ ������ ��ȭ�� �̷�� ����");
		food9.setCal(350);

		generalFoods.add(food1);
		generalFoods.add(food2);
		generalFoods.add(food3);
		generalFoods.add(food4);
		generalFoods.add(food5);
		generalFoods.add(food6);
		generalFoods.add(food7);
		generalFoods.add(food8);
		generalFoods.add(food9);

		Food food10 = new Food("KUG21", "�����", 8000);
		food10.setCoo("�ѱ���");
		food10.setDescription("��ū�ϸ鼭�� ������ ���� �ڶ��ϴ� ����(�ܿ�ö �����޴�)");
		food10.setCal(235);

		Food food11 = new Food("KUG22", "�ᱹ��", 6000);
		food11.setCoo("�ѱ���");
		food11.setDescription("�ÿ��ϰ� ����� ���� ��ǰ�� ����ö ����(����ö �����޴�)");
		food11.setCal(500);

		Food food12 = new Food("KUG23", "��������", 6000);
		food12.setCoo("�ѱ���");
		food12.setDescription("�ÿ��ϰ� �ƻ��� ������ġ�� �̱��� ����� ��췯�� ����ö�� Ư�� ����޴� ����(����ö �����޴�)");
		food12.setCal(400);

		seasonalFoods.add(food10);
		seasonalFoods.add(food11);
		seasonalFoods.add(food12);

		Food food13 = new Food("KUG24", "�����", 1000);
		food13.setCoo("�ѱ���");
		food13.setDescription("�����");
		food13.setCal(310);

		Food food14 = new Food("KUG25", "����", 4000);
		food14.setCoo("�ѱ���");
		food14.setDescription("���ڿ��� ���� ��� �Բ� ���� Ÿ�� �Ѿ�� �ÿ��� ����(19�� �̸� �ֹ� �Ұ��մϴ�.)");
		food14.setCal(400);

		Food food15 = new Food("KUG26", "����", 4000);
		food15.setCoo("�ѱ���");
		food15.setDescription("���� ������ ������ ���ӿ��� �δ� ���� ���⿡ ���� ����(19�� �̸� �ֹ� �Ұ��մϴ�.)");
		food15.setCal(150);

		otherFoods.add(food13);
		otherFoods.add(food14);
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
}

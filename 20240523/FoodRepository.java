package dao;

import java.util.ArrayList;
import dto.Food;

public class FoodRepository {

	private ArrayList<Food> listOfFoods = new ArrayList<Food>();

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

		Food food7 = new Food("KUG18", "�����", 8000);
		food7.setCoo("�ѱ���");
		food7.setDescription("��ū�ϸ鼭�� ������ ���� �ڶ��ϴ� ����");
		food7.setCal(235);

		Food food8 = new Food("KUG19", "�ᱹ��", 6000);
		food8.setCoo("�ѱ���");
		food8.setDescription("�ÿ��ϰ� ����� ���� ��ǰ�� ����ö ����");
		food8.setCal(500);

		Food food9 = new Food("KUG20", "��������", 6000);
		food9.setCoo("�ѱ���");
		food9.setDescription("�ÿ��ϰ� �ƻ��� ������ġ�� �̱��� ����� ��췯�� ����ö�� Ư�� ����޴� ����");
		food9.setCal(400);

		Food food10 = new Food("KUG21", "�����", 1000);
		food10.setCoo("�ѱ���");
		food10.setDescription("�����");
		food10.setCal(310);

		Food food11 = new Food("KUG22", "����", 4000);
		food11.setCoo("�ѱ���");
		food11.setDescription("���ڿ��� ���� ��� �Բ� ���� Ÿ�� �Ѿ�� �ÿ��� ����");
		food11.setCal(400);

		Food food12 = new Food("KUG23", "����", 4000);
		food12.setCoo("�ѱ���");
		food12.setDescription("���� ������ ������ ���ӿ��� �δ� ���� ���⿡ ���� ����");
		food12.setCal(150);

		listOfFoods.add(food1);
		listOfFoods.add(food2);
		listOfFoods.add(food3);
		listOfFoods.add(food4);
		listOfFoods.add(food5);
		listOfFoods.add(food6);
		listOfFoods.add(food7);
		listOfFoods.add(food8);
		listOfFoods.add(food9);
		listOfFoods.add(food10);
		listOfFoods.add(food11);
		listOfFoods.add(food12);
	}

	public ArrayList<Food> getAllFoods() {
		return listOfFoods;
	}
}

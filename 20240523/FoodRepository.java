package dao;

import java.util.ArrayList;
import dto.Food;

public class FoodRepository {

	private ArrayList<Food> listOfFoods = new ArrayList<Food>();

	public FoodRepository() {
		Food food1 = new Food("KUG12", "김치찌개", 8000);
		food1.setCoo("한국산");
		food1.setDescription("얼큰하고 칼칼한 한국 대표음식");
		food1.setCal(250);

		Food food2 = new Food("KUG13", "얼큰된장찌개", 8000);
		food2.setCoo("한국산");
		food2.setDescription("구수한 된장찌개에 알싸한 청양고추를 가미한 특별한 맛");
		food2.setCal(230);

		Food food3 = new Food("KUG14", "제육볶음", 9000);
		food3.setCoo("한국산");
		food3.setDescription("제육볶음 한 점에 소주 한 잔이면 끝");
		food3.setCal(500);

		Food food4 = new Food("KUG15", "뚝배기불고기", 9000);
		food4.setCoo("한국산");
		food4.setDescription("육즙이 풍부한 소고기를 사용한 남녀노소 사랑받는 음식");
		food4.setCal(500);

		Food food5 = new Food("KUG16", "닭볶음탕", 25000);
		food5.setCoo("한국산");
		food5.setDescription("매콤하고 진한 국물 맛이 특징인 한국의 인기 있는 요리");
		food5.setCal(550);

		Food food6 = new Food("KUG17", "계란말이", 6000);
		food6.setCoo("한국산");
		food6.setDescription("부드럽고 고소한 맛이 일품인 한국의 대표적인 음식");
		food6.setCal(285);

		Food food7 = new Food("KUG18", "동태찌개", 8000);
		food7.setCoo("한국산");
		food7.setDescription("얼큰하면서도 개운한 맛을 자랑하는 음식");
		food7.setCal(235);

		Food food8 = new Food("KUG19", "콩국수", 6000);
		food8.setCoo("한국산");
		food8.setDescription("시원하고 고소한 맛이 일품인 여름철 별미");
		food8.setCal(500);

		Food food9 = new Food("KUG20", "열무국수", 6000);
		food9.setCoo("한국산");
		food9.setDescription("시원하고 아삭한 열무김치와 쫄깃한 면발이 어우러져 여름철에 특히 사랑받는 음식");
		food9.setCal(400);

		Food food10 = new Food("KUG21", "공기밥", 1000);
		food10.setCoo("한국산");
		food10.setDescription("고봉밥");
		food10.setCal(310);

		Food food11 = new Food("KUG22", "소주", 4000);
		food11.setCoo("한국산");
		food11.setDescription("알코올의 강한 향과 함께 목을 타고 넘어가는 시원한 느낌");
		food11.setCal(400);

		Food food12 = new Food("KUG23", "맥주", 4000);
		food12.setCoo("한국산");
		food12.setDescription("더운 날씨나 가벼운 모임에서 부담 없이 즐기기에 좋은 맥주");
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

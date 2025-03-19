package day0227;

import java.util.Calendar;

public class QuizShopTest {

	public static void main(String[] args) {
		
		QuizShop qs = new QuizShop();
		qs.setName("땅콩버터");
		qs.setAmount(100);
		qs.setPrice(11000);
		
		
		QuizShop.storeName = "이마트 강동지점";
		
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		int d = cal.get(Calendar.DATE);
		
		System.out.println("오늘의 입고상품("+y+"/"+m+"/"+d+")");
		System.out.println("=========================");
		System.out.println("입고물품"+QuizShop.cnt);
		System.out.println("상점명: "+QuizShop.storeName);
		System.out.println("상품명: "+qs.getName());
		System.out.println("수량: "+qs.getAmount());
		System.out.println("단가: "+qs.getPrice());
		
		QuizShop qs2 = new QuizShop();
		qs2.setName("사과");
		qs2.setAmount(200);
		qs2.setPrice(5000);
		
		System.out.println("=========================");
		System.out.println("입고물품"+QuizShop.cnt);
		System.out.println("상점명: "+QuizShop.storeName);
		System.out.println("상품명: "+qs2.getName());
		System.out.println("수량: "+qs2.getAmount());
		System.out.println("단가: "+qs2.getPrice());
		
	}

}

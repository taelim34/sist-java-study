package day0304;

public class Ex11Main {

	public static void main(String[] args) {
		//Ex11FoodShop fs = new ex11FoodShop(); 인터페이스도 new로 생성못함
		Ex11FoodShop fs = new Ex11Food();
		fs.order();
		fs.bedal();
 
	}

}

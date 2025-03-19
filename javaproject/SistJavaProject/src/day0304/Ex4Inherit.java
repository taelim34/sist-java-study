package day0304;


class Shop{
	
	private String sangpum;
	private int su;
	
	// 디폴트 생성자(상품명=딸기, 수량=50)
	public  Shop() {
		sangpum = "딸기";
		su = 50;

	}
	
	// 명시적 생성자(상품명,수량)
	public Shop(String name, int s) {
		this.sangpum = name;
		this.su = s;

	}
	//출력 writeShop(상품명: 초코파이
	//              수량:100개)
	public void writeShop() {
		System.out.println("상품명: "+sangpum);
		System.out.println("수량: "+su);
	}
}

///////////////////////////////////Shop을 상속받는다,생성자 2개와 메소드 하나도 완성한다

class Myget extends Shop{
	private int price;
	public Myget() {
		price=2500;
	}
	public Myget(String name, int s, int p) {
		super(name, s);
		this.price = p;
	}
	
	//오버라이딩
	@Override
	public void writeShop() {
		// TODO Auto-generated method stub
		super.writeShop();
	}
	
	
}
////////////////////////2개의 객체를 생성후 출력한다, 1.디폴트 생성자로 출력 2.인자있는 생성자로 출력
public class Ex4Inherit {

	public static void main(String[] args) {
		
		Myget mg = new Myget();
		mg.writeShop();
		Myget mg1=new Myget("사과", 2000, 500);
		mg1.writeShop();
		

	}

}

package day0227;

public class Ex1ObjectTest {

	public static void main(String[] args) {
		
		//static은 바로사용가능
		System.out.println(Ex1Object.b); // int는 초기화 안하면 자동 0
		
		Ex1Object.b = 10;
		
		//a생성
		Ex1Object ob1= new Ex1Object();
		Ex1Object ob2= new Ex1Object();
		
		
		System.out.println(ob1.a);//0
		
		ob1.a = 100;
		ob2.a = 200;
		System.out.println(ob1.a);//100
		System.out.println(ob2.a);//200

	}

}

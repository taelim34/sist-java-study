package day0305;

interface InterWork{
	
	public void work();//{}구현부가 없는 미완의 메서드
}

interface InterFood{
	public void order();
	public void bedal();
}

//자바 클래스는 다중구현이 가능
class InterImpl implements InterWork,InterFood{

	@Override
	public void order() {
		// TODO Auto-generated method stub
		System.out.println("음식주문을 합니다");
		
	}

	@Override
	public void bedal() {
		// TODO Auto-generated method stub
		System.out.println("음식 배달을 합니다");
	}

	@Override
	public void work() {
		// TODO Auto-generated method stub
		System.out.println("페인팅 작업을 합니다");
	}
	
}

public class Ex2Implements {

	public static void main(String[] args) {
		
		InterImpl in1 = new InterImpl();
		in1.order();
		in1.bedal();
		in1.work();
		
		System.out.println("**다형성_부모로 선언하고 자식으로 생성**");
		InterWork iw = new InterImpl();
		iw.work();

		InterFood inf = new InterImpl();
		inf.order();
		inf.bedal();
	}

}

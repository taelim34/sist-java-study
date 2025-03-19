package day0304;

class Point{
	
	int x;
	int y;
	//디폴트 생성자
	public Point() {
		System.out.println("Super_디폴트 생성자 호출");
	}
	
	//명시적 생성자
	public Point(int x, int y) {
		
		System.out.println("Super_인자값있는 명시적 생성자 호출");
		this.x=x;
		this.y=y;
		
	}
	
	//메서드
	public void write() {
		System.out.println("x좌표는="+x+", y좌표는 y="+y);
	}
}
//////////////////////point 상속받기, 부모의 생성자 2개 받기, 메서드 오버라이딩
class SubPoint extends Point{
	
	
	String msg;
	public SubPoint() {
		// TODO Auto-generated constructor stub
	}
	public SubPoint(int x,int y,String msg) {
		super(x, y);
		this.msg=msg;
	}
	//부모의 메서드 재구현_오버라이딩
	@Override
	public void write() {
		// TODO Auto-generated method stub
		super.write();
		System.out.println("오늘의 메세지는: "+msg);
	}
}

public class Ex3SuperSub {

	public static void main(String[] args) {
		SubPoint sp = new SubPoint();
		sp.write();

		SubPoint sp1=new SubPoint(100, 200, "눈이 옵니다");
		sp1.write();
		
	}

}

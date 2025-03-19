package day0226;

public class Ex9Object {
	
	String name; //인스턴스 멤버변수...인스턴스 변수로 호출가능...객체 생성후 각각 다른값 가질수있다
	
	static final String MESSAGE ="Happy Day";
	// static은 주로 상수선언할때 인스턴스변수없이 클래스명으로 접근가능

	public static void main(String[] args) {
		

		System.out.println("static 멤버변수는 new로 생성없이 호출가능하다");
		System.out.println(Ex9Object.MESSAGE);//클래스명.변수명으로 호출가능
		System.out.println(MESSAGE);//같은 클래스 내에서는 클래스명 생략이 가능하다
		
		//MESSAGE 초기값 재지정
		//MESSAGE = "오늘 따뜻하다"; //final이라서 값변경 안됨
	
		Ex9Object ab = new Ex9Object(); //클래스명 참조변수명 = new 클래스명();
		Ex9Object cd = new Ex9Object();
		Ex9Object ef = new Ex9Object();
		ef.name="김연아";
		cd.name="손흥민";
		ab.name="최태림";
		System.out.println(ab.name);
		System.out.println(cd.name);
		System.out.println(ef.name);
		
		System.out.println("다같이 사용하는 메세지: "+MESSAGE);
	}

}

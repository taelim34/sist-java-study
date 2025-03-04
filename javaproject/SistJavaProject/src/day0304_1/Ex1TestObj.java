package day0304_1;

import day0304.Ex1SuperObj;

class SubObj extends Ex1SuperObj{
	
	private String addr;
	
	public SubObj(String name, int age, String addr) {
		
		super(name, age); //반드시 첫줄, 부모생성자 호출
		this.addr=addr;
		
	}
	
	//메서드
	
	public void writeData() {
		System.out.println("이름: "+this.name);
		System.out.println("나이: "+this.age);
		System.out.println("주소: "+this.addr);
	}


	
}

public class Ex1TestObj {

	public static void main(String[] args) {
		
	SubObj sub1 = new SubObj("손흥민", 21, "서울시 강남구");
	
	sub1.writeData();

	}

}

package day0227;

class YourInfo{
	
	String myName;
	static String Message;
	
	
}
/////////////////////////////////////

public class Ex7InfoTest {
	
	private String city; //사는지역
	int age;     //나이
	

	public static void main(String[] args) {
		/*
		 * [개인정보]
		 * 주민명:민영기
		 * 메세지:행복하게살자
		 * 지역:대전
		 * 나이:23세
		 * */
		YourInfo.Message="행복하게 살자";
		YourInfo jumin = new YourInfo();
		jumin.myName = "민영기";
		
		
		Ex7InfoTest in = new Ex7InfoTest();
		in.city = "대전";
		in.age = 23;
		
		
		System.out.println("[개인정보]");
		System.out.println("주민명: "+jumin.myName);
		System.out.println("메세지: "+YourInfo.Message);
		System.out.println("지역: "+in.city);
		System.out.println("나이: "+in.age);
		
		
		
		
		

	}

}

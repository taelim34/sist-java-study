package day0226;

public class Ex11CardTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Ex10CardTest.width=10;
		Ex10CardTest.height=20;
		
		
		System.out.println(Ex10CardTest.width);
		System.out.println(Ex10CardTest.height);
		
		//인스턴스 변수생성
		Ex10CardTest c1=new Ex10CardTest();
		
		System.out.println(c1.kind);     //null
		System.out.println(c1.number);   //0
		
		//c2생성해서 heart,7로 변경
		Ex10CardTest c2 = new Ex10CardTest();
		
		c2.kind="heart";
		c2.number=7;
		
		System.out.println(c2.kind);
		System.out.println(c2.number);
		
		Ex10CardTest c3 = new Ex10CardTest();
		c3.kind ="diamond";
		c3.number = 9;
		
		System.out.println(c3.kind+","+c3.number+","+Ex10CardTest.width+","+Ex10CardTest.height);
		System.out.println(c2.kind+","+c2.number+","+Ex10CardTest.width+","+Ex10CardTest.height);
				
		

	}

}

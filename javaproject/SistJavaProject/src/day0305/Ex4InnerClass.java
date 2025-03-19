package day0305;

class OuterObj{
	
	
	class InnerObj{
		
		public void write() 
		{
			System.out.println("내부클래스의 메서드");
		}
	}
	
	
	public void show() 
	{
		System.out.println("외부클래스의 메서드");
		System.out.println("외부에서 내부클래스의 메서드 호출");
		
		//내부클래스 객체생성_자기멤버처럼 생성이 자유롭다
		InnerObj inobj = new InnerObj();
		inobj.write();
	}
}

///////////////////////////////

public class Ex4InnerClass {

	public static void main(String[] args) {
		
		//show메서드 호출
		OuterObj out = new OuterObj();
		out.show();
		System.out.println("======================");
		System.out.println("메인에서 직접 내부클래스 생성은 안되고 외부클래스 통해서만 가능");
		OuterObj.InnerObj obj = out.new InnerObj();
		obj.write();
		System.out.println("======================");
		
		OuterObj.InnerObj obj2 = new OuterObj().new InnerObj();
		obj2.write();
		

	}

}

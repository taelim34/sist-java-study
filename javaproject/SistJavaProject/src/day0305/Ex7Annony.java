package day0305;

abstract class AbstAnnony{
	abstract public void order();
	abstract public void bedal();
	
}
////////////////
class Abst{
	
	//AbstAnnony
	AbstAnnony aa = new AbstAnnony() {
		
		@Override
		public void order() {
			// TODO Auto-generated method stub
			System.out.println("주문중");
			
		}
		
		@Override
		public void bedal() {
			// TODO Auto-generated method stub
			System.out.println("배달중");
		}
	};
	
}
public class Ex7Annony {

	public static void main(String[] args) {
		// 익명내부클래스 메서드 호출
		Abst abst = new Abst();
		abst.aa.order();
		abst.aa.bedal();

	}

}

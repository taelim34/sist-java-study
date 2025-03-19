package day0226;

public class Ex11Counter {
	static int count=0;     //static 변수는 메모리를 공유..메모리 효율이 높아진다
	//count는 c1,c2 가 서로 다른 메모리를 가지고 있기때문에 카운트가 증가하지 않는다 1,1
	//객체변수는 항상 독립적
	//static에서는 1,2로 증가
	
	
	//생성자
	public Ex11Counter() {
		
		count++;
		System.out.println(count);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Ex11Counter c1 = new Ex11Counter();
        Ex11Counter c2 = new Ex11Counter();
        
        
	}

}

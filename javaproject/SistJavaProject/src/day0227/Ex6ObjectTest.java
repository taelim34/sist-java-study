package day0227;

class Mydata{
	
	private int year;
	private int month;
	private int day;
	
	//명시적 생성자 (인자 3개)
	public Mydata(int y,int m,int d) {
		this.year=y;
		month = m;
		day = d;
	}
	
	//getter메서드
	
	public int getYear()
	{
		return year;
	}
	public int getMonth()
	{
		return month;
	}
	public int getDay()
	{
		return day;
	}

	
}
//////////////////////////////////////
public class Ex6ObjectTest {

	public static void main(String[] args) {
		// 파라메터에 여러분들의 출생년월일 을 넣어서 출력해보세요
		
		Mydata ab = new Mydata(2000, 06, 19);
		
		System.out.println(ab.getYear()+"년"+ab.getMonth()+"월"+ab.getDay()+"일");

	}

}

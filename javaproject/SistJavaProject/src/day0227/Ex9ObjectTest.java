package day0227;

class Mycar{
	private String carName;
	private int carPrice;
	private String carColor;
	
	//setter
	public void setCarName(String carName)
	{
		this.carName=carName;
	}
	public void setCarPrice(int carPrice)
	{
		this.carPrice=carPrice;
	}
	public void setCarColor(String carColor)
	{
		this.carColor=carColor;
	}
	
	//getter
	public String getCarName() 
	{
		return carName;
	}
	public int getCarPrice() 
	{
		return carPrice;
	}
	public String getCarColor() 
	{
		return carColor;
	}
	
	//출력용 메서드
	public void writeCarInfo()
	{
		System.out.println("자동차명: "+this.carName); //this 써도 상관없음
		System.out.println("자동차 가격: "+carPrice);
		System.out.println("자동차 색상: "+carColor);
	}
	
	
}
////////////////////////
public class Ex9ObjectTest {

	public static void main(String[] args) {
		Mycar car = new Mycar();
		car.setCarName("그랜져");
		car.setCarPrice(45000000);
		car.setCarColor("블랙");
		
		System.out.println("[나의 자동차 정보]");
		//getter 메서드로 읽어오기
	    System.out.println(car.getCarName());
	    System.out.println(car.getCarPrice());
	    System.out.println(car.getCarColor());
	    
	    System.out.println("[나의 자동차 정보수정]");
	    //setter 메서드로 수정
	    car.setCarName("아우디");
	    car.setCarPrice(650000000);
	    car.setCarColor("화이트");
	    
	    //출력 메서드
	    car.writeCarInfo();
	    

	}

}

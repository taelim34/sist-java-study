package day0227;
class Myinfo{
	
	private String name;
	private int age;
	
	
	//setter 메서드
	public void setName(String name)
	{
		this.name = name;
	}
	public void setAge(int age)
	{
		this.age = age;
	}
	
	
	//getter 메서드
	public String getName()
	{
		return name;
	}
	public int getAge() 
	{
		return age;
	}
}

public class Ex3WorkerMethod {

	public static void main(String[] args) {
		// 
		
		Myinfo my1 = new Myinfo();
		//set메서드로 수정
		my1.setName("이수연");
		my1.setAge(22);
		//get메서드로 값얻기
		String name = my1.getName();
		int age = my1.getAge();
		
		//출력
		System.out.println(name);
		System.out.println(age);

	}

}

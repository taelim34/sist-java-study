package day0227;

import java.io.ObjectInputStream.GetField;

class Junbo{
	
	private String name;
	private int age;
	private String job;
	private String hobby;
	
	//setter & getter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
	//출력 메서드
	public void writeJunbo() {
		System.out.println("이름: "+this.name+", 나이: "+this.age+", 직업: "+this.job+", 취미: "+this.hobby);
		
	}
	

	
	
}

public class Ex10ObjectTest {

	public static void main(String[] args) {
		
		
		Junbo jb = new Junbo();
		
		jb.writeJunbo();
		
		jb.setName("김연아");
		jb.setAge(33);
		jb.setJob("주부");
		jb.setHobby("여행");
		
		jb.writeJunbo();
		///////////////////////////////////
		//2번째 객체 생성해서 setter이용 수정getter이용 출력
		
		Junbo jb2 = new Junbo();
		
		jb2.setName("손흥민");
		jb2.setAge(31);
		jb2.setJob("운동선수");
		jb2.setHobby("게임");
		
		System.out.println("이름: "+jb2.getName()+", 나이: "+jb2.getAge()+", 직업: "+jb2.getJob()+", 취미: "+jb2.getHobby());
		
	}

}

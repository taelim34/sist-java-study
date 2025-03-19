package day0304;

class School{
	
	public static final String SCHOOLNAME="쌍용고등학교";
	private String schoolAddr;
	private int countStu;
	private int countTeacher;
	
	//setter & getter
	public String getSchoolAddr() {
		return schoolAddr;
	}
	public void setSchoolAddr(String schoolAddr) {
		this.schoolAddr = schoolAddr;
	}
	public int getCountStu() {
		return countStu;
	}
	public void setCountStu(int countStu) {
		this.countStu = countStu;
	}
	public int getCountTeacher() {
		return countTeacher;
	}
	public void setCountTeacher(int countTeacher) {
		this.countTeacher = countTeacher;
	}
	
	public School() {
		/*schoolAddr = "강남구";
		countStu=200;
		countTeacher=15;*/
		
		this("강남구", 200, 15);//다른 생성자 호출 this()
	}

	public School(String addr,int cnsS,int cntT) {
		this.schoolAddr =addr;
		this.countStu=cnsS;
		this.countTeacher=cntT;
	}
	//출력 메서드
	public void writeSchoolData() {
		System.out.println("학교주소: "+schoolAddr);
		System.out.println("학생수: "+countStu+" 선생님수: "+countTeacher);
	}
	
	
}
//////////////////////
class Student extends School{
	private String stuName;
	private int score;
	//setter getter
	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
	public Student() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Student(String schoolAddr,int countStu,int countTeacher,String stuName,int score) {
		super(schoolAddr, score, countTeacher);
		this.stuName=stuName;
		this.score=score;
	}
	
	
	//오버라이딩 메서드
	
	public void writeSchoolData() {
		
		System.out.println("학교명: "+SCHOOLNAME);
		super.writeSchoolData();
		System.out.println("학생명: "+stuName);
		System.out.println("성적: "+score);
	}
	
}
//////////////////////////
public class Ex6InheritTest {

	public static void main(String[] args) {
		// 디폴트생성자,명시적생성자
		Student st = new Student();
		st.writeSchoolData();
		Student st1 = new Student("부산시 해운대구", 300, 200, "손흥민", 88);
		st1.writeSchoolData();

		
		//수정
		st.setStuName("이수연");
		st.setScore(100);
		st.writeSchoolData();
	}

}

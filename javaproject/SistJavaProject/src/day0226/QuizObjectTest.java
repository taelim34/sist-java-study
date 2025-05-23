package day0226;

public class QuizObjectTest {

	public static void main(String[] args) {
		/*
		 * 과정명: 쌍용 교육센터 자바교육 4강의장
		 * ============================
		 * 학생1정보
		 * 이름: 손흥민
		 * 나이: 29세
		 * 지역: 부산
		 * 취미: 헬스
		 * 
		 * 학생2정보
		 * 이름: 김연아
		 * 나이: 26세
		 * 지역: 서울
		 * 취미: 여행
		 * 
		 * */
		 QuizObject.processName = "쌍용 교육센터 자바교육 4강의장";

	        // 학생1 객체생성 및 값 설정
	        QuizObject stu1 = new QuizObject();
	        stu1.stuName="손흥민";
	        stu1.age=29;
	        stu1.setCity("부산");
	        stu1.setHobby("헬스");
	        String city1 = stu1.getCity();
	        String hobby1= stu1.getHobby();

	        // 학생2 객체생성 및 값 설정
	        QuizObject stu2 = new QuizObject();
	        stu2.stuName="김연아";
	        stu2.age=26;
	        stu2.setCity("서울");
	        stu2.setHobby("여행");
	        String city2 = stu2.getCity();
	        String hobby2= stu2.getHobby();

	        // 출력
	        System.out.println("과정명: " + QuizObject.processName);
	        System.out.println("============================");

	        System.out.println("학생1정보");
	        System.out.println("이름: " + stu1.stuName);
	        System.out.println("나이: " + stu1.age + "세");
	        System.out.println("지역: " + city1);
	        System.out.println("취미: " + hobby1);
	        System.out.println();

	        System.out.println("학생2정보");
	        System.out.println("이름: " + stu2.stuName);
	        System.out.println("나이: " + stu2.age + "세");
	        System.out.println("지역: " + city2);
	        System.out.println("취미: " + hobby2);
	    }

}

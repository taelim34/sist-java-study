package day0219;

public class IfTest_08 {

	public static void main(String[] args) {
		// 점수를 통해서 학점 구하기(A,B,C,D,F)
		
		int score=88;
		char grade;
		
		//if~else if~else 사용하여 구하기
		if(score>=90)
			grade='A';
		else if(score>=80)
			grade='B';
		else if (score>=70)
			grade='C';
		else if (score>=60)
		    grade='D';	
		else 
			grade='F';
		
		System.out.println("if:학점은"+grade+"입니다");
		
		//삼항 연산자
		grade = score>=90?'a':
			    score>=80?'b':
			    score>=70?'c':
			    score>=60?'d':'f';	
		System.out.println("삼항연산자: 학점은"+grade+"입니다");
		
			
		

	}

}

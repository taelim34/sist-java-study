package day0218;

public class QuizParseArgs_08 {

	public static void main(String[] args) {
		// 메인 파라메타값(args)으로 3과목의 점수를 읽어서 총점과 평균(소수점2자리)을 출력하시오
        // 3과목은 java,oracle,html 총점 tot 평균 avg
	
	    // 변수선언
	    int java=Integer.parseInt(args[0]);
		int oracle=Integer.parseInt(args[1]);
		int html=Integer.parseInt(args[2]);
		int tot=java+oracle+html;
		//int cnt=3;    세 과목을 의미 
		//계산
		double avg=(double)tot/3;
		
		//출력
		System.out.println("java="+java);
		System.out.println("oracle="+oracle);
		System.out.println("html="+html);
		System.out.println("tot="+tot);
		System.out.printf("avg=%.2f",avg);
	
		
		
	}

}

package day0221;

import java.util.Scanner;

public class BreakContinueTest_01 {

	public static void main(String[] args) {
		// continue : 남은 코드 실행하지 않고 조건식(증감식)으로 돌아간다
        // break : 반복문을 벗어난다
		
		// 점수를 입력해서 합계를 구한다
		// 1~100이 아닌경우는 제외
		// 0을 입력시 빠져나오면서 합계를 출력
		
		Scanner sc = new Scanner(System.in);
		
		int score;
		int sum = 0;
		
		while (true)
		{
			System.out.println("점수를 입력하세요");
			score = sc.nextInt();
			
			if(score==0)
				break;
			
			if(score<0 || score>100)
				continue; //다시 점수 입력
			
			sum += score;
			
		}
			System.out.println("총 합계: "+sum);	
	}

}

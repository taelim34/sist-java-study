package day0221;

import java.util.Scanner;

public class ForSumScan_08 {

	public static void main(String[] args) {
		// 점수를 3번 반복해서 입력후 합계를 구하기오(1~100까지 입력할것)
		// 1번째 점수를 입력하세요(1~100)
		// 2번째 점수를 입력하세요(1~100)
		// 3번째 점수를 입력하세요(1~100)
		// 해당 범위를 벗어나면 잘못입력했습니다. 반복문 진행하되 한번뺀다
		
		
		Scanner sc = new Scanner(System.in);
		
		int su;
		int sum = 0;
		
		for(int i = 1;i<=3;i++)
		{
			System.out.println(i+"번째 점수를 입력하세요(1~100)");
			su = sc.nextInt();
			
			if(su<1 || su>100)
			{
				System.out.println("잘못 입력했습니다. 다시입력해주세요");
				i--;
			    //continue;  //i++
			}
			sum+=su;
		}
		System.out.println("총합계: "+sum);

	}

}

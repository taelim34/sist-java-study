package day0221;

import java.util.Scanner;

public class ForScanSum_09 {

	public static void main(String[] args) {
		/*
		 * 총 5개의 점수를 입력받아 1~100이 아닐경우 다시입력 받을것
		 * 1번 점수 :88
		 * 2번 점수 :99
		 * 3번 점수 :110
		 *        잘못 입력했어요
		 * 3번 점수 :77
		 * 4번 점수 :44
		 * 5번 점수 :-77
		 *         잘못 입력했어요
		 * ===========================
		 * 총점: ****
		 * */
		Scanner sc = new Scanner(System.in);
		
		int su;
		int sum = 0;
		
		for(int i = 1;i<=5;i++)
		{
			System.out.println(i+"번째 점수를 입력하시오");
			su = sc.nextInt();
			
			if(su<0 || su>100)
			{
				System.out.println("잘못입력했어요(1~100)");
				i--;
				continue;
			}
			sum += su;
			
		}
		System.out.println("총점: "+sum);
   
	
		}
		
	}



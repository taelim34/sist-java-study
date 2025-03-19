package day0221;

import java.util.Scanner;

public class GuguScan_07 {

	public static void main(String[] args) {
		// 원하는 구구단 입력하시오
		// 5
		// 5단만 출력하시오!!!
		// 반복적으로 출력하다가 0을 누르면 종료되게
		
		Scanner sc = new Scanner(System.in);
		
		int su;
		
		
		while(true)
		{	
			System.out.println("원하는 구구단 입력하시오 (종료=0)");
			su = sc.nextInt();
			
			// 종료조건
			if (su==0) 
			{
				System.out.println("종료합니다");
				break;
			}
			//잘못 입력된 경우 ...2~9까지만 입력 가능하게
			if(su<2 || su>9)
			{
				System.out.println("잘못 입력했어요\n2에~9단까지만 입력해주세요");
				continue;
			}
			
		//구구단 출력
		for(int i = 1;i<=9;i++)
		{
			System.out.println(su+"X"+i+"="+su*i);
		
		}
		}

	}

}

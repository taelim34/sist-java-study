package day0221;

import java.util.Scanner;

public class Quiz0221 {
	
	public static void quiz1() {
		//5번의 숫자를 양수 음수 상관없이 입력한후 각각 양수의 갯수와 음수의 갯수구하기
		/*
		 * 1: 20
		 * 2: -2
		 * 3: 20
		 * 4: -100
		 * 5: 99
		 * ============
		 * 양수갯수:3개
		 * 음수갯수:2개
		 * */
		
		
		Scanner sc = new Scanner(System.in);
		
		int su;
		int cnt1 = 0;
		int cnt2 = 0;
		
		for(int i = 1;i<=5;i++) 
		{
			System.out.println(i+"번쨰 숫자를 입력해주세요");
			su = sc.nextInt();
			if(su>0) 
			{
				cnt1 ++;
			}
			else 
			{
				cnt2 ++;
			}
		}
		System.out.println("양수 갯수:"+cnt1+"개");
		System.out.println("음수 갯수:"+cnt2+"개");
		
	}
	public static void quiz2(){
		/*
		 * 나이를 반복해서 입력받는다 0이되면 빠져나와 출력
		 * 나이가 50이상이면 a 변수증가
		 * 나이가 30이상이면 b 변수증가
		 * 나이가 나머지는 c 변수증가
		 * ==================
		 * 나이입력: 53
		 * 나이입력: 47
		 * 나이입력: 66
		 * 나이입력: 35
		 * 나이입력: 11
		 * 나이입력: 12
		 * ==================
		 * 50세 이상: 2명
		 * 30세 이상: 3명
		 * 그 이외: 1명
		 * */
		
		Scanner sc = new Scanner(System.in);
		
		int su;
		int cnt1 = 0;
		int cnt2 = 0;
		int cnt3 = 0;
		
	    while(true)
	    {
	    	System.out.println("나이 입력: ");
	    	su = sc.nextInt();
	    	if (su==0)
	    		break;
	  
	    	if(su>=50) {
	    	cnt1 ++;
	    	}
	    	else if (su>=30) {
	    	cnt2 ++;
	    	}
	    	else
	    	cnt3 ++;
	    }
	    System.out.println("=======================");
		System.out.println("50세 이상: "+cnt1+"명");
		System.out.println("30세 이상: "+cnt2+"명");
		System.out.println("그 이외: "+cnt3+"명");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//quiz1();
		quiz2();
		
		
	}

}

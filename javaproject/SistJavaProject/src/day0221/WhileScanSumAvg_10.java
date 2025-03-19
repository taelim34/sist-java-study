package day0221;

import java.awt.geom.Arc2D.Double;
import java.util.Scanner;

public class WhileScanSumAvg_10 {

	public static void main(String[] args) {
		/*
		 * 점수(1~100) 입력받다가 Q or q 입력시 빠져나온후 총갯수와 총점 평균 구하기
		 * 
		 * ex)
		 * 77
		 * 88
		 * -10
		 *     다시입력바람
		 * 99
		 * 110
		 *     다시입력바람
		 * =================
		 * 총갯수: 3
		 * 총점:**
		 * 평균:**.**   
		 * */
		
		Scanner sc = new Scanner(System.in);
		
		String su;
		int tot=0;
		double avg;
		int cnt = 0;
		
		while (true) 
		{
			System.out.println("점수를 입력하시오(1~100)");
			su = sc.nextLine();
			/*if(su==0)
				break;*/
			//입력한 문자의 첫글자가 q나Q면 반복문 빠져나가기	
			if(su.charAt(0)=='Q' || su.charAt(0)=='q')
				break;
				
			
			/*if(su<0 || su>100)
			{
				System.out.println("\t다시 입력바람");
				continue;
			}*/
			cnt ++;
			tot +=Integer.parseInt(su); //정수로 변환후 합계변수에 더하기
		}
		avg = (double)tot/cnt;
		System.out.println("==========");
		System.out.println("총 갯수: "+cnt+"개");
		System.out.println("총점: "+tot+"점");
		System.out.printf("평균: %.2f점",avg);
		
		

	}

}

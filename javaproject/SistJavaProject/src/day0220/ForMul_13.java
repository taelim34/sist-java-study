package day0220;

import java.util.Scanner;

public class ForMul_13 {

	public static void main(String[] args) {
		// 팩토리얼 1!=1 2!=2 3!=6 4!=24 5!=120 6!=720
		// 1~10까지 팩토리얼 구하기
		int result = 1;
		for(int i =1;i<=10;i++)
		{
			result*=i;
			System.out.println(i+"!= "+result);
		}
		
		//Q. 숫자를 입력하면 입력한수의 팩토리얼 구하기
		Scanner sc = new Scanner(System.in);
		int a;
		int tot=1;
		System.out.println("숫자를 입력하세요");
		a = sc.nextInt();
		tot*=a;
		for (int i=1;i<=a;i++)
		
			tot*=i;
			System.out.println(a+"!= "+tot);
	

	}

}

package day0220;

import java.util.Scanner;

public class SwitchTest_02 {
	
	public static void main(String[] args) {
		// switch 이용예제
		
		
		int n = 1;
		
		//break가 없을경우 끝까지 실행
		switch(n) 
		{
		case 1:
			System.out.println("n is 1");
			break;
		case 2:
			System.out.println("n is 2");
			break;
		case 3:
			System.out.println("n is 3");
			break;
		default:
		    System.out.println("n 은 3보다 크다");
		
		}
		
		//예제2
		char ch = 'A';
		
		switch(ch)
		{
		case 'A':
			System.out.println("apple");
			break;
		case 'B':
			System.out.println("Banana");
			break;
		default:
			System.out.println("다른과일 입니다");
		}
		
		//학점을 switch문으로
		
		int score = 77;
		char grade;
		
		switch(score/10)
		{
		case 10: case 9:
			grade='A';
			break;
		case 8:
			grade='b';
			break;
		case 7:
			grade='c';
			break;
		case 6:
			grade='D';
			break;
		default:
			grade='f';
			break;
			
		}
		System.out.println(score+"==>"+grade);
		
	}

}

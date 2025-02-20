package day0219;

import java.util.Scanner;

public class Quiz0219_12 {

	public static void main(String[] args) {
		/*
		 * 숫자를 입력하시오
		 * 4
		 * **if문**
		 * 4는 짝수
		 * **삼항연산자**
		 * 4는 짝수             */
		
		
	Scanner sc= new Scanner(System.in);
	
    int a;
    
    System.out.println("숫자를 입력하시오");
    a = sc.nextInt();
    
    System.out.println("**if문**");
    if (a%2==0)
    	System.out.printf("%d는 짝수",a);
    else
    	System.out.printf("%d는 홀수",a);
    
    System.out.println();
    
    System.out.println("**삼항연산자**");
    
    System.out.println(a+"는 "+(a%2==0?"짝수":"홀수"));
    
    //Switch문으로
    
    System.out.println("**switch**");
    
    switch(a%2)
    {
    case 0:
    	System.out.println("짝수");
    	break;
    case 1:
    	System.out.println("홀수");
    	break;
    }
    
    	
	}

}

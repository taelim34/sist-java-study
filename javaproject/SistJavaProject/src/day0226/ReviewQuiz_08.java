package day0226;

import java.util.Scanner;

public class ReviewQuiz_08 {
	public static void quiz1()
	{
		//문제1: 숫자n을 입력하면 1부터 n까지의 합계를 구하시오(for or while)
		//1부터 n까지의 합계:***
		
        Scanner sc = new Scanner(System.in);
		int n;
		int sum = 0;
		System.out.println("숫자를 입력하시오");
		n = sc.nextInt();
		
		for(int i=0;i<=n;i++)
		{
			sum += i;
		}
		System.out.println("1부터 n까지의 합계: "+sum);
			
		
		
	}	
	public static void quiz2()
	{
		//문제2 5명의 나이를 입력후 40세이상과 40세미만이 각각 몇명인지 출력하고 
		//평균도 구하시오(for)
		//40세 이상 인원수:3
		//40세 미만 인원수:2
		//평균 나이:**세
		
		Scanner sc = new Scanner(System.in);
		int age;
		int cnt1=0;
		int cnt2=0;
		int tot=0;
		double avg;
		
		
		for(int i=1;i<=5;i++)
		{
			System.out.println("5명의 나이를 입력하시오");
			age = sc.nextInt();
			
			if(age>=40)
			{
				
				cnt1++;
			}
			else
			{
			    cnt2++;
			}	
			tot += age;
		}
		avg = tot/5;
		System.out.println("40세 이상 인원수: "+cnt1);
		System.out.println("40세 미만 인원수: "+cnt2);
		System.out.println("평균나이 :"+avg);
		
		
		
	}
	public static void quiz3()
	{
		/*
		 * 배열에 1~50사이의 난수 20개를 구하여 넣고 
		 * 오름차순으로 정렬하여 출력하시오
		 * */
		int [] su = new int [20];
		
		for(int i=0;i<su.length;i++)
		{
			
				su[i] = (int)(Math.random()*50)+1;
			
		}
		

		for(int i=0;i<su.length-1;i++)
		{
			for(int j=i+1;j<su.length;j++)
			{
				if(su[i]>su[j])
				{
					int temp = su[i];
					su[i]=su[j];
					su[j]=temp;
					
				}	
			}
		}
		
		for(int i = 0;i<su.length;i++)
		{
			System.out.print(su[i]+" ");
		}
	
		
		
		
		
	}

	public static void main(String[] args) {
		quiz3();

	}

}

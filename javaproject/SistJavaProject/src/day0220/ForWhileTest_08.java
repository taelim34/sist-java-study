package day0220;

public class ForWhileTest_08 {

	public static void main(String[] args) {
		// for문 10 9 8 7 6 .......0
		for(int i=10;i>=0;i--)
		{
			System.out.print(i+" ");
		}
		
		System.out.println();
		
		//while문
		int a=10;
		
		while(a>=0)
		{
			System.out.print(a--+" ");
		}
		System.out.println();
        //5 4 3 2 1을 for문으로 출력해보세요
		for (int i=5;i>=1;i--)
		{
			System.out.print(i+" ");
		}
		
		
		
		
	}

}

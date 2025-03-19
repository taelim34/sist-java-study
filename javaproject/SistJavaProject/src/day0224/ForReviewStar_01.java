package day0224;

public class ForReviewStar_01 {

	public static void main(String[] args) {
		
		
		System.out.println("**다중 for문으로 star()*출력하기**");
		
		//5행5열로 star 출력
		for(int i=1;i<=5;i++) //행 갯수
		{
			for(int j=1;j<=5;j++) //열 갯수
			{
				System.out.print("*");
			}
			System.out.println();
		}
		//5행5열 star (1행:1열  2행:2열까지....)
		System.out.println("1행:1열  2행:2열까지....");
		
		for(int i=1;i<=5;i++) //행 갯수
		{
			for(int j=1;j<=i;j++) //열 갯수(i 값 만큼만 반복)
			{
				System.out.print("*");
			}
			System.out.println();
		}
		//5행5열 star : 2번과 반대로 (i가 1일때 5번,2일때 4번...5일때 1번)
		System.out.println("5행5열 star : 2번과 반대로 (i가 1일때 5번,2일때 4번...5일때 1번)");
		for(int i=1;i<=5;i++) //행 갯수
		{
			for(int j=5;j>=i;j--) //열 갯수
			{
				System.out.print("*");
			}
			System.out.println();
		}

	}

}

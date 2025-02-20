package day0220;

public class ForTest_11 {

	public static void main(String[] args) {
		// 
		int i;
		for(i=1;i<=10;i++)
		{
			System.out.print(i+" ");  //1~10
		}
		System.out.println("\n빠져나온후의 i값: "+i);
		
		int a=10;
		for(;a<=50;a+=5) //초기값을 반복문 밖에 주었을 경우 생략가능(;은 써야한다)
		{
			System.out.print(a+" ");
		}
		System.out.println("\n빠져나온후의 a값: "+a);
		
		
		
		

	}

}

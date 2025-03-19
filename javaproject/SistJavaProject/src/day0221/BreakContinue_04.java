package day0221;

public class BreakContinue_04 {

	public static void main(String[] args) {
		// 
		
		for(int i=1;i<=10;i++)
		{
			if(i%5==0)
				break;         //5에서 빠져나가 for문을 끝냄
			System.out.print(i+" ");
		}
		System.out.println();
		
		for(int i=1;i<=10;i++)
		{
			if(i%5==0)
				continue;      //5의 배수일경우 증감식으로 이동 (i++로 이동)
			System.out.print(i+" ");
		}
		System.out.println();

	}

}

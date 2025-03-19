package day0220;

public class ForSum_12 {

	public static void main(String[] args) {
		// 1~10까지의 반복문으로 합구하기_for
		
		int sum = 0;
		for(int i = 1;i<=10;i++)
		{
			sum += i; //sum = sum + i
		}
		System.out.println("1~10까지의 합은"+sum+"입니다.");
		
		// 1~10까지의 반복문으로 합구하기_while
		int tot = 0;
		int i = 1;
		while(i<=10) {
			
			//합계변수에 i를 누적시킨다
            tot = tot+i; // tot+=i;
            i++;
		}
		System.out.println("1~10까지의 합은"+tot+"입니다.");
		
		
		//1~20까지의 합을 구하되 2씩 증가한다
		int total = 0;
		for(int b = 1;b<=20;b+=2)
		{
			total += b;
		}
		System.out.println("(2씩 증가)1~20까지의 합은"+total+"입니다.");
		
		//Q.1 2 4 5 7 8 10   : continue 이용
		for(int a = 0;a<=10;a++)
		{
			if(a%3==0)
				continue;
			System.out.print(a+" ");
		}
		System.out.println();
		

	}

}

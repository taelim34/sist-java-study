package day0224;

public class ArrayStringTest_05 {

	public static void main(String[] args) {
		// 문자배열 선언 및 초기화
		String [] str;
		str = new String[5]; //5개의 주소값 할당 null
		
		//초기값 지정안하고 출력
		for(int i = 0;i<str.length;i++)
		{
			System.out.println(i+": "+str[i]);
		}
		System.out.println("======================");
		//초기값 지정
		str[0]="원주희";
		str[1]="유혜지";
		str[2]="조태민";
		str[3]="박용희";
		str[4]="김희찬";
		
		//초기값 지정출력
		for(int i = 0;i<str.length;i++)
		{
		System.out.println(i+": "+str[i]);
		}
		System.out.println("======================");
		//for~each문 출력
		for(String a:str)
		{
			System.out.println(a);
		}
			
	}

}

package day0224;

public class ArrayStringTest_08 {

	public static void main(String[] args) {
		// String 배열선언과 동시에 초기값
		
		String [] str1= {"피자","파스타","햄버거","쌀국수","분짜","비빔밥"};
		String [] str2=new String[5];
		
		//str2에 문자열 초기화
		str2[0]="레드";
		str2[2]="옐로우";
		str2[4]="그린";
		
		System.out.println("str1출력_for_메뉴1:피자..");
		
		for(int i=0;i<str1.length;i++)
		{
			System.out.print("메뉴"+(i+1)+": "+str1[i]);
		}System.out.println();
		
		System.out.println("str1출력_for~each문");
		for(String s:str1)
			System.out.print(s+" ");
		System.out.println();
        System.out.println("=====================");
        System.out.println("str2출력_for_Color1:레드....");
        
        for(int i=0;i<str2.length;i++)
        {
        	System.out.println("Color"+(i+1)+": "+str2[i]);
        }System.out.println();
        
        System.out.println("str2출력_for~each문...가로로 나열");
        for(String s2:str2)
        {
        	System.out.print(s2+"  ");
        }
	}
}

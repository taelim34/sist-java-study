package day0221;

public class GuguBreak_06 {

	public static void main(String[] args) {
		// 
		
		for(int i=2;i<=9;i++)
		{
			for(int j=1;j<=9;j++)
			{
				if (j==5)
					break;
				System.out.println(i+"X"+j+"="+i*j);
			}
			System.out.println();
		}

		//ㅏ반복문앞에 이름을 붙여 break 사용함으로서 둘 이상의 반복문을 빠져나가는 것이 가능하다	
	loop1 :	for(int i=2;i<=9;i++)
		{
			for(int j=1;j<=9;j++)
			{
				if(j==4)
					break loop1;
				System.out.println(i+"X"+j+"="+i*j);
			}
			System.out.println();
		}
	}

}

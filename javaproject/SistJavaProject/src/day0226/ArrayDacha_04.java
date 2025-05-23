package day0226;

public class ArrayDacha_04 {

	public static void main(String[] args) {
		// 다차원 배열 선언과 동시에 초기화
		
		int [][] arr= {
				{22,33},
				{44,55,66},
				{77,88,99,100}
			};

		//출력
		System.out.println("총 행갯수: "+arr.length);
		System.out.println("0번행의 열갯수: "+arr[0].length);
		System.out.println("1번행의 열갯수: "+arr[1].length);
		System.out.println("2번행의 열갯수: "+arr[2].length);
		
		//출력
		//[0][0]=22
		for (int i=0;i<arr.length;i++)
		{
			for (int j=0;j<arr[i].length;j++)
			{
				System.out.printf("[%d][%d]%d\t",i,j,arr[i][j]);
			}
			System.out.println();
		}
		//for~each
		for(int [] a:arr)
		{
			for(int n:a)
			{
				System.out.print(n+"\t");
			}
			System.out.println();
		}
		
	}

}

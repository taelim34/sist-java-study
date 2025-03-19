package day0226;

public class ArrayDachaScore_05 {

	public static void main(String[] args) {
		// 다차원배열 성적표 출력
		/*
		 * 이름 자바 오라클 총점
		 * 이효리 88 77  ***
		 * 이상순 77 55  ***
		 * 김민희 66 77  ***
		 * */
		
		String [] name = {"이효리","이상순","김민희"};
		int [][] score = {{88,77,88,0},{77,55,99,0},{66,77,77,0}};
		
		//총점구하기
		for(int i=0;i<score.length;i++)
		{
			for(int j=0;j<3;j++)
			{
				score[i][3]+=score[i][j];
			}
		}
		
		System.out.println("이름\t자바\t오라클\t스프링\t총점");
		for(int i=0;i<name.length;i++)
		{
			System.out.print(name[i]+"\t");
			for(int j=0;j<score[i].length;j++)
			{
				System.out.print(score[i][j]+"\t");
			}
			System.out.println();
		}
		
		
		
		

	}

}

package day0225;

import java.util.Scanner;

public class ArrayIntIndex_01 {

	public static void main(String[] args) {
		// 숫자배열중에서 내가 입력한 숫자가 있는지 있다면 몇번째있는지 찾아보자
		
		int [] nums = {35,23,13,6,3,14,34,8,73,96,58};  //0~10
		
		//System.out.println(nums.length);
		Scanner sc = new Scanner(System.in);
		int su;
		boolean flag;  //숫자가 있는지 없는지에 대한 변수
		
		while (true)
		{
			System.out.println("검색할 숫자 입력하세요");
			su = sc.nextInt();
			
			
			//종료조건 break문 
			if(su==0)
			{
				System.out.println("숫자검색을 종료합니다");
				break;
			}
			
			flag = false;//찾으면 true로 변경
			
			//값찾기
			for(int i = 0; i<nums.length;i++)
			{
				//true조건
				if (su==nums[i])
				{
					flag = true;
				    System.out.println(i+"번지에서 검색됨");
				}  
			}
			if(!flag) //flag==false
				System.out.println(su+"는 데이타에 없습니다.");
		}			
		
	}

}

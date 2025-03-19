package day0224;

public class ArrayTest_04 {

	public static void main(String[] args) {
		// 배열선언..기본형 배열은 객체로 인식
		
		int [] arr,arr2;
		arr = new int[3];  //메모리 할당
		arr2 = new int[5]; //할당만 해도 값은 0으로 초기화
		
		// 배열에 값 넣기...초기화
		arr[0] = 100;
		arr[1] = 50;
		arr[2] = 200;
		
		// 배열의 갯수
		System.out.println("arr의 갯수: "+arr.length);
		System.out.println("arr2의 갯수: "+arr2.length);
		System.out.println("========================");
		
        //출력
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		System.out.println(arr[2]);
		System.out.println("========================");
		//배열은 for문으로 출력
		for(int i=0;i<arr.length;i++)  //0~2
		{
			System.out.println(arr[i]);
		}
		
		//arr2 for문 출력
		System.out.println("========================");
		for(int i=0;i<arr2.length;i++)
		{
			System.out.println((i+1)+": "+arr2[i]);
		}
		System.out.println("========================");
		// for~each문..arr
		System.out.println("arr을 for~each문");
		for(int a:arr)  // for(자료형 변수명:배열명)
		{
			System.out.println(a);
		}
		System.out.println("========================");
		System.out.println("arr2을 for~each문");
		for(int b:arr2)
		{
			System.out.println(b);
		}
	}

}

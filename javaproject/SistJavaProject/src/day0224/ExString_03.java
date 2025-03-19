package day0224;

public class ExString_03 {

	public static void main(String[] args) {
		System.out.println("String 객체에 대한 맴버메서드");
		
		String str1="apple";
		String str2="Apple";
		String str3="Have a Nice Day!!!";
		String str4=" Happy day ";
		
		System.out.println("str의 길이: "+str3.length()); //공백도 길이에 포함
		System.out.println("str3의 앞뒤 공백제거후 길이: "+str3.trim().length()); //앞뒤 공백만 제거가능
		System.out.println("str4의 앞뒤 공백제거후 길이: "+str4.trim().length()); //앞뒤 공백만 제거가능
		
		System.out.println("str3에서 N의 인덱스: "+str3.indexOf("N"));
		//subString 이용해서 Nice출력
		System.out.println("subString 이용해서 Nice 출력: "+str3.substring(7,11));
		//equals는 대소문자 일치해야 true,다르면 false
		System.out.println("문자열 비교: "+str1.equals(str2));
		System.out.println("문자열 비교: "+str1.equalsIgnoreCase(str2));
		
		// a.compareTo(b)
		// a와 b가 같을경우 0
		// a가 작을경우 -값(알파벳 차이만큼 마이너스 값)
		// a가 클 경우 +값(알파벳 차이만큼 플러스 값)
		System.out.println(str1.compareTo(str2));  //32 a:97  A:65
		System.out.println(str1.compareTo(str1));  //0
		System.out.println(str2.compareTo(str1));  //-32
		
		System.out.println("computer".compareTo("command")); //3 (p와 m을 비교)
		
		// 문자열의 일부를 변경
		System.out.println(str3.replace('a', '*'));
		System.out.println(str3.replace("Nice", "Good"));
		
		//int ==>String 
		String a = String.valueOf(100);  //int ==>String
		String b = String.valueOf(100.3);//double ==>String
		String c = 100+" "; //연산시 String 이 있으면 결과는 String
		String d = 42.195+" ";
		
	}

}

package day0219;

public class OperTest_06 {

	public static void main(String[] args) {
		// 대입 연산자 +=,-=,*=,/=
		
		int a,b,c,d,e;
		a=b=c=d=e=10;
		
	 
		a+=2;  //a=a+2  a에 2을 더한값이 다시a
		b-=3;
		c*=2;
		d/=3;
		e%=3;
		
		System.out.println("a="+a);
		System.out.println("b="+b);
		System.out.println("c="+c);
		System.out.println("d="+d);
		System.out.println("e="+e);

	}

}

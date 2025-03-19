package day0304;

import java.util.Scanner;

/* 보너스는 개발부만 백만 나머지부서는 50만원 특별지급
 * 사원명?
 * 홍길동
 * 부서?
 * 개발부
 * 기본급?
 * 2000000
 * ==========================================
 * 사원명      부서       기본급    보너스     총급여
 * 홍길동     개발부     2000000  1000000  3000000
 * */

class Sawon{
	private String sawonName,buseo;
	private int gibonpay;
	
	
	//명시적생성자(3가지 인자 초기화하는 값 넘기기)
	public Sawon(String sname, String buseo, int gibonpay) {
		this.sawonName=sname;
		this.buseo=buseo;
		this.gibonpay=gibonpay;
		
	}
	//메서드_getBonus
	public int getBonus() {
		int bonus=0;
		if(buseo.equals("개발부"))
			bonus = 1000000;
		else
			bonus = 500000;
		return bonus;
	}
	
	//최종급여 출력
    public void showSawon() {
    	System.out.println("================================================");
    	System.out.println("사원명\t부서\t기본급\t보너스\t총급여");
    	System.out.printf("%s\t%s\t%d\t%d\t%d",sawonName,buseo,gibonpay,getBonus(),(gibonpay+getBonus()));
    }
	
}

public class QuizSawon {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		
		System.out.println("사원명?");
		String name = sc.nextLine();
		System.out.println("부서?");
		String buseo = sc.nextLine();
		System.out.println("기본급?");
		int gibonpay = sc.nextInt();
		
		 Sawon sawon = new Sawon(name, buseo, gibonpay);
	     sawon.showSawon();
		
		
		

	}

}

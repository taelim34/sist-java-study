package day0305;

import java.text.NumberFormat;
import java.util.Scanner;

class Company{
	
	private String staff,position; //직원명,직급
	private int famSu; //가족수
	
	//디폴트생성자
	public Company() {
		
	}
	//사원명,직급,가족수를 인자로 받는 생성자
	public Company(String staff,String position,int famSu) {
		this.staff = staff;
		this.famSu = famSu;
		this.position = position;
	}
	//각각의 setters & getters
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position1) {
		this.position = position1;
	}
	public int getFamSu() {
		return famSu;
	}
	public void setFamSu(int famSu) {
		this.famSu = famSu;
	}
	
	//직급에 따라 기본급:  부장->450 과장->350 대리->280 사원->220  getGibonPay()
	public int getGibonPay()
	{
		
		if(position.equals("부장"))
			return 4500000;
		else if(position.equals("과장"))
			return 3500000;
		else if(position.equals("대리"))
			return 2800000;
		else if(position.equals("사원"))
			return 2200000;
		else
			return 0;
		
	}
	
	//직급에 따라 수당: 부장,과장->100 대리,사원->70만원  getSudangPay()
	public int getSudangPay()
	{
		
		if(position.equals("부장") || position.equals("과장"))
			return 1000000;
		else if(position.equals("대리") || position.equals("사원"))
			return 700000;
		else
			return 0;
		
	}
	
	//가족수가 5인이상:30만원 5인미만2인이상은:10만원 나머지는0원 getFamSudang()
	public int getFamSudang()
	{
		int famSudang;
		if(famSu>=5)
			famSudang = 300000;
		else if(famSu<5)
			famSudang = 100000;
		else if(famSu>=2)
			famSudang = 100000;
		else
			famSudang=0;
		return famSudang;	
	}
	
	//세금:  기본급의 5%를 반환받아서 세금 getTax()
	public double getTax()
	{
		double tax;
		tax = (double)getGibonPay()*0.05;
		return tax;
	}
	
	//실수령액: 기본급+수당+가족수당-세금 getNetPay()
	public double getNetPay()
	{
		double netPay;
		netPay = getGibonPay()+getSudangPay()+getFamSudang()-getTax();
		return netPay;
	}
	
}
/////////////////
public class QuizClass {

	//제목출력 (showTitle())
	//사원명      직급     기본급    수당    가족수당    세금    실수령액
	public static void showTitle() 
	{
		System.out.println("사원명\t직급\t기본급\t수당\t가족수당\t세금\t실수령액");
		System.out.println("====================================================================");
	}
	
	//한개의 사원데이터 출력 메서드 writeSawon()
	public static void writeSawon(Company [] company) 
	{
		//NumberFormat nf = NumberFormat.getInstance();
		
		for(int i=0;i<company.length;i++)
		{
			System.out.println(company[i].getStaff()+"\t"+company[i].getPosition()+"\t"+company[i].getGibonPay()
					+"\t"+company[i].getSudangPay()+"\t"+company[i].getFamSudang()
					+"\t"+company[i].getTax()+"\t"+company[i].getNetPay()+"\t");
		}
		
	}
	

	public static void main(String[] args) {
		// 인원수를 입력후 인원수만큼 배열메모리에 할당
		int inwon,famSu,tax,totSudang;
		String name,position;
		Company [] myCompany;
		Scanner sc = new Scanner(System.in);
		
		System.out.println("인원을 입력하세요");
		inwon = Integer.parseInt(sc.nextLine());
		
		myCompany = new Company[inwon];
		// 배열의 데이터를 입력후 생성자를 통해서 데이타 저장하기
		for(int i=0;i<inwon;i++) {
			System.out.println((i+1)+"번째");
			System.out.println("이름을 입력하세요");
			name = sc.nextLine();
			System.out.println("직급을 입력하세요");
			position = sc.nextLine();
			System.out.println("가족수를 입력하세요");
			famSu = Integer.parseInt(sc.nextLine());
			
			myCompany [i] = new Company(name, position, famSu);
			
			
		}
		// 제목출력
		showTitle();
		
		// 반복문통해서 데이터 출력하는 메서드 호출
		writeSawon(myCompany);

	}

}

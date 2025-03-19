package day0228;

import java.util.Scanner;

class StudentScore{
	
	private String stuName;
	private int java;
	private int html;
	private int mysql;
	
	//setters & getters
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public int getJava() {
		return java;
	}
	public void setJava(int java) {
		this.java = java;
	}
	public int getHtml() {
		return html;
	}
	public void setHtml(int html) {
		this.html = html;
	}
	public int getMysql() {
		return mysql;
	}
	public void setMysql(int mysql) {
		this.mysql = mysql;
	}
	
	public int getTotal() {
		int tot = 0;
		tot = java+html+mysql;
		
		return tot;
		
	}
	public double getAverage() {
		double avg;
		avg = (getTotal()/3.0);
		return avg;
		
	}
	public String getPungga() {
		String pungga = null;
		if ((java+html+mysql/3.0)>=90)
		{
			pungga =("장학생");
		}
		else if((java+html+mysql/3.0)>=80)
		{
			pungga =("우수생");
		}
		else 
			pungga =("재수강");
		return pungga;
	}
	
	//출력
	public static void showTitle() {
		
		System.out.println("이름\tjava\tHtml\tMysql\t총점\t평균\t평가");
		System.out.println("===============================================");
	}
	
}



public class StudentScoreResult {
	
	
	public static void showStuInfo(StudentScore [] stuScore) {
		
		StudentScore.showTitle();
		for(StudentScore s : stuScore) {
			
			System.out.printf("%s\t%d\t%d\t%d\t%d\t%.2f\t%s\n",
					s.getStuName(),s.getJava(),s.getHtml(),s.getMysql(),s.getTotal(),s.getAverage(),s.getPungga());
		}
		
	}
	

	
	
	
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int inwon;
		
		StudentScore [] stuScores;
		
		System.out.println("입력할 학생수는?");
		inwon=Integer.parseInt(sc.nextLine());
		
		stuScores = new StudentScore[inwon];
		for(int i=0;i<inwon;i++)
		{
			stuScores[i] = new StudentScore();  //디폴트 생성자
			
			System.out.println("이름");
			String name = sc.nextLine();
			
			System.out.println("자바");
			int java = Integer.parseInt(sc.nextLine());
			
			System.out.println("html");
			int ht = Integer.parseInt(sc.nextLine());
			
			System.out.println("mysql");
			int sql=Integer.parseInt(sc.nextLine());
		
			stuScores[i] = new StudentScore();
			stuScores[i].setJava(java);
			stuScores[i].setHtml(ht);
			stuScores[i].setMysql(sql);
			stuScores[i].setStuName(name);
			
			
		
		}
		showStuInfo(stuScores);
	}
	
}
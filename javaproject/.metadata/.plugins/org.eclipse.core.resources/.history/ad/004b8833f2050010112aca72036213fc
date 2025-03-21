package day0319;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class MyClubCrud {

	DBConnect db = new DBConnect();
	Scanner sc = new Scanner(System.in);
	
	public void insertClub()
	{
		System.out.println("회원명?");
		String cname = sc.nextLine();
		System.out.println("주소?");
		String caddress = sc.nextLine();
		System.out.println("직급?");
		String cposition = sc.nextLine();
		System.out.println("전화번호?");
		String chp=sc.nextLine();
		
		
		String sql="insert into myclub (cno,cname,caddress,cposition,chp,gaipday) values(seq_club.nextval,'"+cname+"','"+caddress+"','"+cposition+"','"+chp+"', sysdate)";
		System.out.println(sql);
		
		Connection conn=db.getConnection();
		Statement stmt = null;
		
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
			
			System.out.println("회원가입 완료!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("회원가입 실패!!");
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void selectClub()
	{
		System.out.println("회원번호\t회원명\t주소\t\t직급(회장,부회장,총무,회원...)\t핸드폰번호\t\t회비\t가입일");
		System.out.println("===================================================================================================");
		
		String sql="select * from myclub order by cno";
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				System.out.println(rs.getInt("cno")+"\t"+rs.getString("cname")+
						"\t"+rs.getString("caddress")+"\t"+rs.getString("cposition")+
						"\t\t\t"+rs.getString("chp")+"\t"+rs.getInt("cfee")+"\t"+rs.getDate("gaipday"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
		
		
	}
	
	public void updateClub()
	{
		
			System.out.println("수정할 회원번호는?");
			int num=Integer.parseInt(sc.nextLine());
			System.out.println("수정할 회원명은?");
			String cname=sc.nextLine();
			System.out.println("수정할 주소는?");
			String caddress=sc.nextLine();
			System.out.println("수정할 직급?");
			String cposition=sc.nextLine();
			System.out.println("수정할 핸드폰 번호?");
			String chp=sc.nextLine();
			System.out.println("수정할 회비?");
			int cfee=Integer.parseInt(sc.nextLine());
			
			String sql="update myclub set cname='"+cname+"',caddress='"+caddress+"',cposition='"+cposition
					+"',chp='"+chp+"',cfee="+cfee+" where cno="+num;
			System.out.println(sql);
			
			Connection conn = db.getConnection();
			Statement stmt=null;
			
			try {
				stmt=conn.createStatement();
				int a=stmt.executeUpdate(sql);
				
				if(a==0)
					System.out.println("수정할데이터가 존재하지 않음");
				else
					System.out.println("수정되었습니다");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(stmt, conn);
			}
		
	}
	
	public void deleteClub()
	{
		System.out.println("삭제할 시퀀스를 입력해주세요");
		int num=Integer.parseInt(sc.nextLine());
		
		String sql="delete from myclub where cno ="+num;
		
		Connection conn = db.getConnection();
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			//stmt.execute(sql);
			int a=stmt.executeUpdate(sql);
			
			if(a==0)
				System.out.println(num+"시퀀스는 회원명단에 없는 번호입니다");
			else
				System.out.println(num+"번 시퀀스가 삭제되었습니다");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		MyClubCrud mc=new MyClubCrud();
		Scanner sc=new Scanner(System.in);
		
		while(true)
		{
			
			System.out.println("***클럽 정보***");
			System.out.println("**1.회원가입 2.전체회원 출력 3.회원정보수정 4.회원정보삭제 9.종료");
			
			int num;
			num=Integer.parseInt(sc.nextLine());
			if(num==1)
				mc.insertClub();
			if(num==2)
				mc.selectClub();
			if(num==3)
				mc.updateClub();
			if(num==4)
				mc.deleteClub();
			if(num==9)
			{
				System.out.println("종료합니다");
				break;
			}
		}
		
		
	}

}

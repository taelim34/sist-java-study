package day0227;

public class Ex11MemberTest {

	public static void main(String[] args) {
		Ex11Member mb1 = new Ex11Member();
		Ex11Member mb2 = new Ex11Member();
	    Ex11Member.ban = "JAVA 4강의장";
		mb1.setMemberData("손흥민", "남자", "서울");
		mb2.setMemberData("김연아", "여자", "대전");
		
		
		mb1.getMemberData();
		System.out.println("=======================");
		mb2.getMemberData();
		

	}

}

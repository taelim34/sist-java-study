package day0227;

class Input{
	private String irum;
	private String juso;
	private int nai;
	
	
	public void setIrum(String irum) {
		this.irum=irum;
	}
	public void setJuso(String juso) {
		this.juso=juso;
	}
	public void setNai(int nai) {
		this.nai=nai;
	}
	
	public String getIrum() {
		return irum;
	}
	public String getJuso() {
		return juso;
	}
	public int getNai() {
		return nai;
	}
    //3개의 멤버변수를 한꺼번에 변경하는 메소드 setInputDatas
	public void setInputDatas(String irum,String juso,int nai) {
		/*this.irum=irum;
		this.juso=juso;
		this.nai=nai;*/
		this.setIrum(irum);
		setJuso(juso);
		setNai(nai);
	}
	
	//3개의 멤버 변수값을 한꺼번에 리턴
	public String getInputDatas() {
		
		String s="이름: "+irum+"\n주소: "+juso+"\n나이: "+nai;
		
		return s;
	}
	
	
}
////////////////////////////////////////
public class Ex12ObjectTest {

	public static void main(String[] args) {
		Input in = new Input();
		in.setIrum("손흥민");
		in.setJuso("서울");
		in.setNai(31);
		
		
		System.out.println("값출력 하나하나 get메서드로 하기");
		System.out.println("이름: "+in.getIrum());
		System.out.println("주소: "+in.getJuso());
		System.out.println("나이: "+in.getNai());
		
		//생성2
		Input in2 = new Input();
		in2.setInputDatas("김연아","경기", 26);
		System.out.println(in2.getInputDatas());

	}

}

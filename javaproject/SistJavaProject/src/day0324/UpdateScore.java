package day0324;

import java.awt.Color;
import java.awt.Container;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import day0310.SwingEx1;

public class UpdateScore extends JFrame{

	Container cp;
	JTextField tfName,tfJava,tfJsp,tfSpring;
	JComboBox<String> cbBan;
	JButton btnMod;  //수정버튼
	String num;      //수정할 번호

	public UpdateScore(String title) {
			super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 보게하자
			
			//위치 너비
			this.setBounds(900, 100, 240, 400);
					
			cp=this.getContentPane();
			//this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			cp.setBackground(new Color(150, 200, 220));
			initDesign();
			//this.setVisible(true);
		}
	
		public void initDesign()
		{
			this.setLayout(null);
			JLabel title1=new JLabel("학생명");
			JLabel title2=new JLabel("반");
			JLabel title3=new JLabel("Java");
			JLabel title4=new JLabel("Jsp");
			JLabel title5=new JLabel("Spring");
			
			title1.setBounds(30, 20, 60, 30);
			this.add(title1);
			
			title2.setBounds(30, 70, 60, 30);
			this.add(title2);
			
			title3.setBounds(30, 120, 60, 30);
			this.add(title3);
			
			title4.setBounds(30, 170, 60, 30);
			this.add(title4);
			
			title5.setBounds(30, 220, 60, 30);
			this.add(title5);
			
			tfName=new JTextField(4);
			String [] ban = {"1강의장","2강의장","3강의장","4강의장"};
			cbBan=new JComboBox<String>(ban);
			tfJava=new JTextField(4);
			tfJsp=new JTextField(4);
			tfSpring=new JTextField(4);
			
			tfName.setBounds(90, 25, 70, 20);
			this.add(tfName);
			
			cbBan.setBounds(90, 75, 70, 20);
			this.add(cbBan);
			
			tfJava.setBounds(90, 125, 70, 20);
			this.add(tfJava);
			
			tfJsp.setBounds(90, 175, 70, 20);
			this.add(tfJsp);
			
			tfSpring.setBounds(90, 225, 70, 20);
			this.add(tfSpring);
			
			//버튼
			btnMod=new JButton("점수수정");
			btnMod.setBounds(70, 300, 90, 25);
			this.add(btnMod);
			
		}

		/*public static void main(String[] args) {
			
			AddScore sw1 = new AddScore("성적 추가폼 #1");
			
			
			
		}*/

}

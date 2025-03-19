package day0310;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class BtnEventColor6 extends JFrame{

	Container cp;
	
	JButton btn1,btn2;
	
	
	public BtnEventColor6(String title) {
		super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 보게하자
		
		//위치 너비
		this.setBounds(500, 100, 500, 800);
		//색상
		//this.setBackground(Color.blue);
		//this.getContentPane().setBackground(Color.pink);  //Color클래스의 상수변수
		//this.getContentPane().setBackground(new Color(255,165,0));
		
		cp=this.getContentPane();
		cp.setBackground(new Color(127, 255, 212));
		initDesign();
		this.setVisible(true);
	}
	public void initDesign()
	{
		this.setLayout(new FlowLayout());
		
		btn1=new JButton("배경색을 핫핑크로 변경");
		this.add(btn1);
		
		//익명내부클래스로 이벤트
		btn1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				cp.setBackground(Color.MAGENTA);
			}
		});
		
		btn2=new JButton("배경색을 노랑색으로 변경");
		this.add(btn2);
		btn2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				cp.setBackground(Color.YELLOW);
			}
		});
		
	}

	public static void main(String[] args) {
		
		BtnEventColor6 sw1 = new BtnEventColor6("스윙기본 #6");
		
		
		
	}
}

package day0327;

import java.awt.Color;
import java.awt.Container;

import javax.swing.JButton;
import javax.swing.JFrame;

import day0310.SwingEx1;

public class Kiosk extends JFrame{

	
	Container cp;
	JButton btn1,btn2,btn3,btn4;

	public Kiosk(String title) {
			super(title);
			
			//위치 너비
			this.setBounds(1000, 0, 800, 1000);
					
			cp=this.getContentPane();
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			cp.setBackground(Color.white);
			initDesign();
			this.setVisible(true);
		}
	
	
	
	public void initDesign()
	{
		
	}

		public static void main(String[] args) {
			
			new Kiosk("***kiosk***");
			
			
			
		}
	
	
	
}

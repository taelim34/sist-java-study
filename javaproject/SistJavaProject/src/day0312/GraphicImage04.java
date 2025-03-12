package day0312;

import java.awt.Color;
import java.awt.Container;
import java.awt.Graphics;
import java.awt.Image;

import javax.swing.ImageIcon;
import javax.swing.JFrame;

public class GraphicImage04 extends JFrame{
	
	Container cp;
	static final String fileName1 = "C:\\sist0217\\image\\logoImg\\a02.png";
	static final String fileName2 = "C:\\sist0217\\image\\logoImg\\incon2.png";
	static final String fileName3 = "C:\\sist0217\\image\\logoImg\\incon2.png";

	public GraphicImage04(String title) {
		super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 보게하자
		
		//위치 너비
		this.setBounds(500, 100, 808, 700);
				
		cp=this.getContentPane();
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		cp.setBackground(Color.white);
		
		this.setVisible(true);
	}
	
	@Override
	public void paint(Graphics g) {
		// TODO Auto-generated method stub
		super.paint(g);
		g.setColor(Color.green);
		g.drawLine(20, 60, 300, 50);  //선
		
		
		g.setColor(Color.magenta);
		g.drawOval(20, 80, 50, 50);  //테두리만 있는원
		g.fillOval(100, 80, 50, 50);
		
		g.setColor(Color.blue);
		g.drawRect(180, 80, 50, 50);
		g.fillRect(250, 80, 50, 50);
		
		
		//이미지
		Image image1 = new ImageIcon(fileName1).getImage();
		g.drawImage(image1, 10, 80, GraphicImage04.this);
		
		Image image2 = new ImageIcon(fileName2).getImage();
		g.drawImage(image2, 60, 30, GraphicImage04.this);
		
		Image image3 = new ImageIcon(fileName3).getImage();
		g.drawImage(image3, 100, 200, this);
	}

	public static void main(String[] args) {
		
		GraphicImage04 sw1 = new GraphicImage04("스윙그래픽 이미지 #4");
		
		
		
	}
}

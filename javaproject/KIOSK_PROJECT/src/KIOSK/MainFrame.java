package KIOSK;

import java.awt.Color;
import java.awt.Container;

import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.Border;

public class MainFrame extends JFrame
{
	Container cp;
	
	public MainFrame(String title)
	{
		super(title);
		
		this.setBounds(500, 0, 900, 1030);
		cp = this.getContentPane();
		cp.setBackground(new Color(242, 209, 36));
		cp.setLayout(null);
		
		KioskTop kbTop= new KioskTop();
		this.add(kbTop.getPanel());
		KioskBottom kb = new KioskBottom();
		this.add(kb.getPanel());
		
		this.setVisible(true);
		this.setResizable(false);
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
	}
	
	public static void main(String[] args) 
	{
		new MainFrame("카페 키오스크");

	}

}

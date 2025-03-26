package KIOSK;

import java.awt.Color;

import javax.swing.BorderFactory;
import javax.swing.JPanel;
import javax.swing.border.Border;

public class KioskBottom
{
	JPanel jp;
	
	public KioskBottom()
	{		
		jp = new JPanel();
		jp.setBounds(0, 730, 900, 1030);
		jp.setLayout(null);
		Border lineBorder = BorderFactory.createLineBorder(Color.BLACK);
		jp.setBorder(lineBorder);
	}
	
	public JPanel getPanel()
	{
		return this.jp;
	}
}

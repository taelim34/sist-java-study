package KIOSK;

import java.awt.Color;

import javax.swing.BorderFactory;
import javax.swing.JPanel;
import javax.swing.border.Border;

public class KioskTop {
	JPanel jp;
	
	public KioskTop()
	{		
		jp = new JPanel();
		jp.setBounds(0, 0, 900, 80);
		jp.setLayout(null);
		Border lineBorder = BorderFactory.createLineBorder(Color.black);
		jp.setBorder(lineBorder);
	}
	
	public JPanel getPanel()
	{
		return this.jp;
	}
}

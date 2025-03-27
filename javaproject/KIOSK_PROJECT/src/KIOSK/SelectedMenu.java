package KIOSK;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.Border;

public class SelectedMenu implements ActionListener
{
	private JPanel panel;
	private MenuDTO dto;
	private ImageViewer viewer;
	
	private JButton btnPlus;	// 수량 증가
	private JButton btnMinus;	// 수량 감소
	private JLabel lblAmount;	// 수량 표시할 라벨
	private int amount = 1;		// 수량	// 기본은 1
	
	String imgPathUI = "C:\\sist0217\\work\\javaproject\\KIOSK_PROJECT\\UI\\";
	KioskBottom kb;
	
	public SelectedMenu(MenuDTO dto, KioskBottom kb)
	{
		this.dto = dto;
		
		initDesign();
		this.kb = kb;
	}
	
	
	public void initDesign()
	{
		panel = new JPanel();
		panel.setBounds(0, 0, 180, 180);
		panel.setBackground(Color.WHITE);
		panel.setLayout(null);
		Border lineBorder = BorderFactory.createLineBorder(Color.BLACK);
		panel.setBorder(lineBorder);
		
		panel.setVisible(false);
		
		viewer = new ImageViewer();
		viewer.setBounds(40, 20, 110, 110);
		panel.add(viewer);
		
		// 수량 추가버튼
		ImageIcon plusIcon = new ImageIcon(imgPathUI + "plus.png");
		Image scaledPlus = plusIcon.getImage().getScaledInstance(40, 40, Image.SCALE_SMOOTH);
		btnPlus = new JButton(new ImageIcon(scaledPlus));
		btnPlus.setBorderPainted(false);
		btnPlus.setContentAreaFilled(false);
		btnPlus.setFocusPainted(false);
		btnPlus.setBounds(130, 115, 50, 70);
		btnPlus.addActionListener(this);
		panel.add(btnPlus);
		panel.setComponentZOrder(btnPlus, 0);
		
		// 수량 감소버튼
		ImageIcon minusIcon = new ImageIcon(imgPathUI + "minus.png");
		Image scaledMinus = minusIcon.getImage().getScaledInstance(42, 44, Image.SCALE_SMOOTH);
		btnMinus = new JButton(new ImageIcon(scaledMinus));
		btnMinus.setBorderPainted(false);
		btnMinus.setContentAreaFilled(false);
		btnMinus.setFocusPainted(false);
		btnMinus.setBounds(0, 115, 50, 70);
		btnMinus.addActionListener(this);
		panel.add(btnMinus);
		panel.setComponentZOrder(btnMinus, 0);
		
		// 수량 표시 라벨
		lblAmount = new JLabel("", SwingConstants.CENTER);
		lblAmount.setText(String.valueOf(amount));
		lblAmount.setFont(new Font("", Font.BOLD, 30));
		lblAmount.setBounds(38, 98, 100, 100);
		panel.add(lblAmount);
	}
	
	private void updateAmount()
	{
		lblAmount.setText(String.valueOf(amount));
	}
	
	public void addAmount()
	{
		amount++;
		updateAmount();
		kb.calculateTotal();
	}
	
	@Override
	public void actionPerformed(ActionEvent e) 
	{
		Object ob = e.getSource();
		
		if (ob == btnPlus)
		{
			if (amount < 100)
			{
				addAmount();
			}
		}
		else if (ob == btnMinus)
		{
			if (amount > 1)
			{
				amount--;
				updateAmount();
				kb.calculateTotal();
			}
		}
		
	}
	
	public JPanel getPanel()
	{
		return this.panel;
	}
	
	public MenuDTO getDTO()
	{
		return this.dto;
	}
	
	public ImageViewer getViewer()
	{
		return this.viewer;
	}
	
	public int getAmount()
	{
		return this.amount;
	}
	
	class ImageViewer extends Canvas
	{
		private static final long serialVersionUID = 1L;

		@Override
		public void paint(Graphics g) 
		{
			super.paint(g);
			
			if (dto.getImage() != null)
			{
				Image image = new ImageIcon(dto.getImage()).getImage();
				g.drawImage(image, 0, 0, 100, 100, this);
			}
		}
	}

}

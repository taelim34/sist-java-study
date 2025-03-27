package KIOSK;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.DecimalFormat;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.Border;

public class KioskBottom implements ActionListener
{
	private JPanel panel;
	private JButton btnLeft;
	private JButton btnRight;
	private JButton btnRemove1;
	private JButton btnRemove2;
	private JButton btnRemove3;
	
	private JPanel panelRight;		// 우측 패널	// 총 가격표시, 결제버튼
	private JButton btnRemoveAll;	// 전체삭제 버튼
	private JButton btnPay;			// 결제 버튼
	private JLabel lblTotalText;	// '총 결제 금액' 쓰여있는
	private JLabel lblTotalPay;		// 실제 금액이 적힐 라벨
	private int total;				// 총 얼마야
	
	private int currentPage;
	private int selectedSrcX = 30;
	private int selectedSrcY = 40;
	
	Vector<SelectedMenu> sMenuContainer = new Vector<SelectedMenu>();
	Vector<SelectedMenu> tempContainer = new Vector<SelectedMenu>();
	Vector<JButton> removeContainer = new Vector<JButton>();
	
	String imgPath = "C:\\Users\\user\\Desktop\\자료\\JDBC_PROJECT\\imgs\\menu\\menu\\";
	String imgPathUI = "C:\\sist0217\\work\\javaproject\\KIOSK_PROJECT\\UI\\";
	
	public KioskBottom()
	{		
		initDesign();
		
		/// 테스트코드
		MenuDTO dto1 = new MenuDTO();
		MenuDTO dto2 = new MenuDTO();
		MenuDTO dto3 = new MenuDTO();
		MenuDTO dto4 = new MenuDTO();
		MenuDTO dto5 = new MenuDTO();
		
		dto1.setImage(imgPath + "smoody&Frappe\\cookie.jpg");
		dto2.setImage(imgPath + "smoody&Frappe\\mint.jpg");
		dto3.setImage(imgPath + "smoody&Frappe\\nokcha.jpg");
		dto4.setImage(imgPath + "smoody&Frappe\\unicon.jpg");
		dto5.setImage(imgPath + "smoody&Frappe\\bluebarry.jpg");
		
		//createSelectedMenu(dto1);
		//createSelectedMenu(dto2);
		//createSelectedMenu(dto3);
		//createSelectedMenu(dto4);
		//createSelectedMenu(dto5);
		///
	}
	
	public void initDesign()
	{
		createDefaultPanel();
		createRightPanel();
		
		// 시작할 때 표시할 index
		currentPage = 0;
		
		createPageButtons();	
		createRemoveButtons();
	}
	
	private void createDefaultPanel()
	{
		// 패널
		panel = new JPanel();
		panel.setBounds(0, 730, 900, 1030);
		panel.setBackground(new Color(220, 220, 220));
		panel.setLayout(null);
		Border lineBorder = BorderFactory.createLineBorder(Color.BLACK);
		panel.setBorder(lineBorder);
	}
	
	// 우측 패널
	private void createRightPanel()
	{
		Border lineBorder = BorderFactory.createLineBorder(Color.BLACK);
		
		panelRight = new JPanel();
		panelRight.setBounds(650, 0, 235, 265);
		panelRight.setBackground(new Color(105, 105, 105));
		panelRight.setLayout(null);
		panelRight.setBorder(lineBorder);
		panel.setComponentZOrder(panelRight, 0);
		panel.add(panelRight);
		
		btnRemoveAll = new JButton("전체취소");
		btnRemoveAll.setBounds(0, 160, 115, 100);
		btnRemoveAll.setBackground(new Color(139, 0, 0));
		btnRemoveAll.setForeground(Color.white);
		btnRemoveAll.addActionListener(this);
		panelRight.add(btnRemoveAll);
		
		btnPay = new JButton("결제하기");
		btnPay.setBounds(115, 160, 120, 100);
		btnPay.setBackground(new Color(242, 209, 36));
		btnPay.addActionListener(this);
		panelRight.add(btnPay);
		
		lblTotalText = new JLabel("총 결제 금액");
		lblTotalText.setBounds(50, -10, 140, 100);
		lblTotalText.setFont(new Font("", Font.BOLD, 25));
		panelRight.add(lblTotalText);
		
		lblTotalPay = new JLabel("");
		lblTotalPay.setBounds(50, 40, 140, 100);
		lblTotalPay.setFont(new Font("", Font.BOLD, 25));
		lblTotalPay.setForeground(Color.WHITE);
		panelRight.add(lblTotalPay);
	}
	
	private void createPageButtons()
	{
		// 왼쪽 버튼	// page -1
		ImageIcon leftIcon = new ImageIcon(imgPathUI + "left.png");
		Image scaledLeft = leftIcon.getImage().getScaledInstance(50, 50, Image.SCALE_SMOOTH);
		
		btnLeft = new JButton(new ImageIcon(scaledLeft));
		btnLeft.setBorderPainted(false);		// 테두리 제거
		btnLeft.setContentAreaFilled(false);	// 배경 제거
		btnLeft.setFocusPainted(false);			// 클릭 시 강조 제거
		btnLeft.setBounds(0, 100, 30, 55);
		btnLeft.addActionListener(this);
		
		
		// 오른쪽 버튼	// page +1
		ImageIcon rightIcon = new ImageIcon(imgPathUI + "right.png");
		Image scaledRight = rightIcon.getImage().getScaledInstance(50, 50, Image.SCALE_SMOOTH);
		
		btnRight = new JButton(new ImageIcon(scaledRight));
		btnRight.setBorderPainted(false);
		btnRight.setContentAreaFilled(false);
		btnRight.setFocusPainted(false);
		btnRight.setBounds(610, 100, 30, 55);
		btnRight.addActionListener(this);
		
		panel.add(btnLeft);
		panel.add(btnRight);
	}
	
	private void createRemoveButtons()
	{
		// 삭제 버튼
		ImageIcon removeIcon = new ImageIcon(imgPathUI + "remove.png");
		Image scaledRemove = removeIcon.getImage().getScaledInstance(37, 37, Image.SCALE_SMOOTH);
		
		btnRemove1 = new JButton(new ImageIcon(scaledRemove));
		btnRemove1.setBorderPainted(false);		// 테두리 제거
		btnRemove1.setContentAreaFilled(false);	// 배경 제거
		btnRemove1.setFocusPainted(false);		// 클릭 시 강조 제거
		btnRemove1.setBounds(150, 0, 100, 100);
		btnRemove1.addActionListener(this);
		btnRemove1.setVisible(false);
		panel.add(btnRemove1);
		removeContainer.add(btnRemove1);
		
		btnRemove2 = new JButton(new ImageIcon(scaledRemove));
		btnRemove2.setBorderPainted(false);		// 테두리 제거
		btnRemove2.setContentAreaFilled(false);	// 배경 제거
		btnRemove2.setFocusPainted(false);		// 클릭 시 강조 제거
		btnRemove2.setBounds(350, 0, 100, 100);
		btnRemove2.addActionListener(this);
		btnRemove2.setVisible(false);
		panel.add(btnRemove2);
		removeContainer.add(btnRemove2);
		
		btnRemove3 = new JButton(new ImageIcon(scaledRemove));
		btnRemove3.setBorderPainted(false);		// 테두리 제거
		btnRemove3.setContentAreaFilled(false);	// 배경 제거
		btnRemove3.setFocusPainted(false);		// 클릭 시 강조 제거
		btnRemove3.setBounds(550, 0, 100, 100);
		btnRemove3.addActionListener(this);
		btnRemove3.setVisible(false);
		panel.add(btnRemove3);
		removeContainer.add(btnRemove3);
	}
	
	// 하단 패널 생성
	public void createSelectedMenu(MenuDTO dto)
	{	
		MenuDTO tempDTO = new MenuDTO();
		tempDTO.setName(dto.getName());
		tempDTO.setPrice(dto.getPrice());
		tempDTO.setImage(dto.getImage());
		
		SelectedMenu sm = new SelectedMenu(tempDTO, this);
		
		panel.add(sm.getPanel());
		sMenuContainer.add(sm);
		
		calculateTotal();
		showSelectedMenu();
	}
	
	public void createSelectedMenu(String name, int price, String img)
	{	
		// 중복체크
		boolean duplicate = false;
		
		for (int i = 0; i < sMenuContainer.size(); i++)
		{		
			if (name.equals(sMenuContainer.get(i).getDTO().getName()))
			{
				duplicate = true;
			}
			
			if (duplicate)
			{
				sMenuContainer.get(i).addAmount();
				return;
			}
		}
		
		MenuDTO dto = new MenuDTO();
		dto.setName(name);
		dto.setPrice(price);
		dto.setImage(img);
		
		
		SelectedMenu sm = new SelectedMenu(dto, this);
		
		panel.add(sm.getPanel());
		sMenuContainer.add(sm);
		
		calculateTotal();
		showSelectedMenu();
	}
	
	// 하단 목록 업데이트
	public void showSelectedMenu()
	{
		// 새로 표시하기 전 전부 비활성화
		for (int i = 0; i < removeContainer.size(); i++)
		{
			removeContainer.get(i).setVisible(false);
		}
		
		for (int i = 0; i < sMenuContainer.size(); i++)
		{
			sMenuContainer.get(i).getPanel().setVisible(false);
		}	
		
		tempContainer.clear();
		
		// 메뉴가 3개보다 많을 경우
		if (sMenuContainer.size() > 3)
		{		
			// 페이지의 index부터 3개를 선택해서 다른 vector에 넣어준다
			// ex) currentPage가 3이면 표시할 index는 3,4,5
			for (int i = currentPage; i < currentPage + 3; i++)
			{
				tempContainer.add(sMenuContainer.get(i));			
			}
			
			for (int i = 0; i < tempContainer.size(); i++)
			{
				tempContainer.get(i).getPanel().setBounds(selectedSrcX + (200 * i), 
						selectedSrcY, 180, 180);
				
				tempContainer.get(i).getPanel().setVisible(true);
				tempContainer.get(i).getViewer().repaint();
				
				removeContainer.get(i).setVisible(true);
			}
		}
		// 3개 이하일 경우
		else
		{
			for (int i = 0; i < sMenuContainer.size(); i++)
			{
				sMenuContainer.get(i).getPanel().setBounds(selectedSrcX + (200 * i), 
						selectedSrcY, 180, 180);
				
				sMenuContainer.get(i).getPanel().setVisible(true);
				sMenuContainer.get(i).getViewer().repaint();
				
				tempContainer.add(sMenuContainer.get(i));
				removeContainer.get(i).setVisible(true);
			}
		}
	}
	
	public void calculateTotal()
	{
		total = 0;
		
		for (int i = 0; i < sMenuContainer.size(); i++)
		{
			int price = sMenuContainer.get(i).getDTO().getPrice() * sMenuContainer.get(i).getAmount();
			
			total += price;
		}
		
		DecimalFormat formatter = new DecimalFormat("#,###");
		
		lblTotalPay.setText(formatter.format(total) + "원");
		System.out.println(total);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) 
	{
		Object ob = e.getSource();
		
		if (ob == btnLeft)
		{
			if (currentPage > 0)
			{
				currentPage--;
				showSelectedMenu();
			}
		}
		else if (ob == btnRight)
		{
			if (currentPage < sMenuContainer.size() - 3)
			{
				currentPage++;
				showSelectedMenu();
			}
		}
		else if (ob == btnRemove1)
		{
			SelectedMenu toRemove = sMenuContainer.get(0);
			
			
		    // 패널에서 제거
		    panel.remove(toRemove.getPanel());
			
			sMenuContainer.remove(0);
			
			calculateTotal();
			
			panel.revalidate();
			panel.repaint();
			showSelectedMenu();
		}
		else if (ob == btnRemove2)
		{
			SelectedMenu toRemove = sMenuContainer.get(1);
			
			
		    // 패널에서 제거
		    panel.remove(toRemove.getPanel());
			
			sMenuContainer.remove(1);
			
			calculateTotal();
			
			panel.revalidate();
			panel.repaint();
			showSelectedMenu();
		}
		else if (ob == btnRemove3)
		{
			SelectedMenu toRemove = sMenuContainer.get(2);
			
			
		    // 패널에서 제거
		    panel.remove(toRemove.getPanel());
			
			sMenuContainer.remove(2);
			
			calculateTotal();
			
			panel.revalidate();
			panel.repaint();
			showSelectedMenu();
		}
		else if (ob == btnRemoveAll)
		{
			for(int i = 0; i < sMenuContainer.size(); i++)
			{
				panel.remove(sMenuContainer.get(i).getPanel());
				panel.revalidate();
			}
			
			sMenuContainer.clear();
			showSelectedMenu();
			
			calculateTotal();
			panel.repaint();
		}
		else if (ob == btnPay)
		{
			int result = JOptionPane.showConfirmDialog(
	                null, 
	                "결제하시겠습니까?", 
	                "결제확인", 
	                JOptionPane.YES_NO_OPTION
	        );
			
			 if (result == JOptionPane.YES_OPTION) 
			 {
				 JOptionPane.showMessageDialog(null, "결제완료");
				 for(int i = 0; i < sMenuContainer.size(); i++)
					{
						panel.remove(sMenuContainer.get(i).getPanel());
						panel.revalidate();
					}
					
					
					sMenuContainer.clear();
					showSelectedMenu();
					
					calculateTotal();
					panel.repaint();
		     } 
			 else if (result == JOptionPane.NO_OPTION) 
		     {
		         return;
		     }
		}
		
	}
	
	public JPanel getPanel()
	{
		return this.panel;
	}

}

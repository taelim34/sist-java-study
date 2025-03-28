package KIOSK;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.Border;

public class KioskTop implements ActionListener{
	JPanel jpTop,jpMidle;
	String [] buttonLabels = { "커피", "에이드&주스", "스무디&프라페", "디저트" };
	String [] buttonLabels1 = { "버튼 1", "버튼 2", "버튼 3", "버튼 4", "버튼 5", "버튼 6" };
	Color [] buttonColors = { Color.ORANGE, Color.GREEN, Color.CYAN, Color.PINK };
	Color [] buttonColors2= { Color.WHITE,Color.WHITE,Color.WHITE,Color.WHITE,Color.WHITE,Color.WHITE,};
	JButton[] topButtons = new JButton[buttonLabels.length];
	JButton[] menuButtons = new JButton[6];
	Map<JButton, String> buttonImageMap = new HashMap<>();
	Map<JButton, Integer> buttonIdxMap = new HashMap<>();
	
	
	MenuDTO dto=new MenuDTO();
	
	DBConnect db=new DBConnect();
	KioskBottom kb;
	
	public KioskTop(KioskBottom kb)
	{		
		jpTop = new JPanel();
		jpTop.setBounds(0, 0, 900, 80);
		jpTop.setLayout(new GridLayout(1, 4, 0, 0));
		//jp.setLayout(null);
		Border lineBorder = BorderFactory.createLineBorder(Color.black);
		jpTop.setBorder(lineBorder);
		
		Font buttonFont = new Font("맑은고딕", Font.BOLD, 20);
		
		for (int i = 0; i < buttonLabels.length; i++) {
            JButton btn = new JButton(buttonLabels[i]);
            btn.setBackground(buttonColors[i]);
            btn.setFont(buttonFont);
            jpTop.add(btn);
            btn.addActionListener(this);
            
            topButtons[i] = btn;
        }
		jpMidle= new JPanel();
		//jpMidle.setBounds(0, 80, 900, 650);
		//jpMidle.setLayout(new GridLayout(2, 3, 120, 120));
		jpMidle.setBounds(30, 130, 820, 550);
		jpMidle.setLayout(new GridLayout(2, 3, 100, 80));
		jpMidle.setBackground(new Color(242, 209, 36));
		//jpMidle.setBackground(Color.white);
		//Border lineBorder1 = BorderFactory.createLineBorder(Color.black);
		//jpMidle.setBorder(lineBorder1);
		
		for (int i = 0; i < buttonLabels1.length; i++) {
            JButton btn = new JButton(buttonLabels1[i]);
            btn.setBackground(buttonColors2[i]);
            menuButtons[i] = btn;
            jpMidle.add(btn);
            btn.addActionListener(this);
            
        }
		
		loadMenuItems("커피");
		
		this.kb = kb;
	}
	
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		Object ob=e.getSource();
		
		
		for (int i = 0; i < topButtons.length; i++) {
	        if (ob == topButtons[i]) {
	            String category = buttonLabels[i];
	            loadMenuItems(category);
	            break;
	        }
	    }
		
		for (int i = 0; i < menuButtons.length; i++) {
	        if (ob == menuButtons[i]) {
	        	JButton btn = menuButtons[i];
	            String selectedItemText = menuButtons[i].getText();
	            int lastSpaceIndex = selectedItemText.lastIndexOf(" "); 
	            if (lastSpaceIndex == -1) {
	                return;
	            }
	            
	            String name = selectedItemText.substring(0, lastSpaceIndex).trim(); 
	            String priceText = selectedItemText.substring(lastSpaceIndex + 1).replaceAll("[^0-9]", "").trim();
	            int price = 0;
	            try {
	                price = Integer.parseInt(priceText);  
	            } catch (NumberFormatException ex) {
	                ex.printStackTrace();
	                
	            }
       
	            String imagePath = buttonImageMap.get(btn);
	            int idx = buttonIdxMap.get(btn);
	            dto.setName(name);
	            dto.setPrice(price);
	            dto.setImage(imagePath);
	            dto.setIdx(idx);
	            

	            System.out.println("선택된 물품: "+dto.getName() + ", 가격: "+dto.getPrice()+"원"+dto.getImage()+"idx: "+dto.getIdx());
	            
	            kb.createSelectedMenu(name, price, imagePath, idx);
	            
	            break;
	        }
	    }
	}
	
	public JPanel getPanel()
	{
		return this.jpTop;
	}
	
	public JPanel getCenterPanel()
	{
		return this.jpMidle;
	}
	
	
	
	public void loadMenuItems(String category) {
	    Connection conn = db.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    String sql = "select idx, name, price, image from kiosk_cafemenu where category=?";
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, category);
	        rs = pstmt.executeQuery();

	        int index = 0;
	        while (rs.next() && index < jpMidle.getComponentCount()) {
	            String name = rs.getString("name");
	            int price = rs.getInt("price");
	            String imagePath = rs.getString("image"); 
	            int idx= rs.getInt("idx");
	            

	            ImageIcon icon = new ImageIcon(imagePath);
	            //Image img = icon.getImage().getScaledInstance(250, 240, Image.SCALE_SMOOTH);
	            Image img = icon.getImage().getScaledInstance(200, 210, Image.SCALE_SMOOTH);
	            icon = new ImageIcon(img);

	            JButton btn = (JButton) jpMidle.getComponent(index);
	            btn.setText(name + " " + price + "원");
	            btn.setIcon(icon);
	            btn.setHorizontalTextPosition(JButton.CENTER);
	            btn.setVerticalTextPosition(JButton.BOTTOM);
	            btn.setVisible(true);
	            
	            buttonImageMap.put(btn, imagePath);
	            buttonIdxMap.put(btn, idx);

	            index++;
	        }

	        while (index < jpMidle.getComponentCount()) {
	            JButton btn = (JButton) jpMidle.getComponent(index);
	            btn.setText("빈 슬롯");
	            btn.setIcon(null);
	            index++;
	        }
	        
	        for (int i = 0; i < menuButtons.length; i++)
	        {
	        	if (menuButtons[i].getText().equals("빈 슬롯"))
	        	{
	        		menuButtons[i].setVisible(false);
	        	}
	        }
	        
	        jpMidle.revalidate();
	        jpMidle.repaint();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	
}

package day0326;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Container;
import java.awt.FileDialog;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;

public class ShopUpdate extends JFrame implements ActionListener{

	Container cp;
	JTextField tfSang,tfSu,tfDan;
	JLabel lblPhoto;
	String imageName;
	JButton btnUpdate,btnImage;
	
	ShopDbModel sdb=new ShopDbModel();
	//내부클래스
	PhotoDraw pDraw=new PhotoDraw();
	
	String num;  //메인으로부터 받아올 num
	

	public ShopUpdate(String title) {
			super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 보게하자
			
			//위치 너비
			this.setBounds(1200, 100, 500, 300);
					
			cp=this.getContentPane();
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			cp.setBackground(Color.white);
			initDesign();
			this.setVisible(true);
		}
	
	public void initDesign()
	{
		this.setLayout(null);
		
		JLabel lbl1=new JLabel("상품명");
		lbl1.setBounds(30, 20, 50, 30);
		this.add(lbl1);
		
		tfSang=new JTextField();
		tfSang.setBounds(100, 20, 100, 30);
		this.add(tfSang);
		
		//이미지불러오는 버튼
		btnImage=new JButton("사진선택");
		btnImage.setBounds(100, 80, 100, 30);
		this.add(btnImage);
		
		//버튼에 액션리스너 추가
		btnImage.addActionListener(this);
		
		//이미지위치 미리 지정
		pDraw.setBounds(250, 20, 70, 80);
		this.add(pDraw);
		
		lblPhoto=new JLabel("이미지명");
		lblPhoto.setBounds(20, 120, 300, 30);
		lblPhoto.setBorder(new LineBorder(Color.PINK));
		this.add(lblPhoto);
		
		//수량
		JLabel lbl2=new JLabel("수량");
		lbl2.setBounds(40, 160, 50, 30);
		this.add(lbl2);
		
		tfSu=new JTextField();
		tfSu.setBounds(100, 160, 50, 30);
		this.add(tfSu);
		//단가
		JLabel lbl3=new JLabel("단가");
		lbl3.setBounds(40, 200, 50, 30);
		this.add(lbl3);
		
		tfDan=new JTextField();
		tfDan.setBounds(100, 200, 50, 30);
		this.add(tfDan);
		
		
		//insert
		btnUpdate=new JButton("DB수정");
		btnUpdate.setBounds(200, 200, 100, 30);
		this.add(btnUpdate);
		btnUpdate.addActionListener(this);
	}
	
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		Object ob=e.getSource();
		
		if(ob==btnImage)
		{
			FileDialog dlg=new FileDialog(this, "이미지가져오기", FileDialog.LOAD);
			dlg.setVisible(true);
			
			//이미지명얻기
			imageName=dlg.getDirectory()+dlg.getFile();
			//이미지명 라벨에 출력
			lblPhoto.setText(imageName);
			
			//이미지 출력
			pDraw.repaint();
			
		}else if(ob==btnUpdate)
		{
			//shop생성
			ShopDto dto=new ShopDto();
			
			//dto에 4개의 데이터를 넣는다
			dto.setSangpum(tfSang.getText());
			dto.setPhoto(imageName);
			dto.setSu(Integer.parseInt(tfSu.getText()));
			dto.setDan(Integer.parseInt(tfDan.getText()));
			dto.setNum(num);
			
			//insert
			sdb.updateShop(dto);
			//현재창닫기
			this.setVisible(false);
		}
	}
	
	//내부클래스
	class PhotoDraw extends Canvas{
		
		@Override
		public void paint(Graphics g) {
			// TODO Auto-generated method stub
			super.paint(g);
			
			if(imageName!=null)
			{
				Image image=new ImageIcon(imageName).getImage();
				g.drawImage(image, 10, 10, 60, 70, this);
			}
		}
	}
		public static void main(String[] args) {
			
			new ShopUpdate("상품입력 폼");
			
			
			
		}

}

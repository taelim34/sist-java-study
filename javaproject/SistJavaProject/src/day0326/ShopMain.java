package day0326;

import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class ShopMain extends JFrame implements ActionListener{

	Container cp;
	JButton btnAdd,btnDel,btnUpdate,btnSelect;
	ShopDbModel sdb=new ShopDbModel();
	
	

	public ShopMain(String title) {
			super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 보게하자
			
			//위치 너비
			this.setBounds(1200, 100, 600, 300);
					
			cp=this.getContentPane();
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			cp.setBackground(Color.cyan);
			initDesign();
			this.setVisible(true);
		}
	
		public void initDesign()
		{
			this.setLayout(new GridLayout(1, 4)); //4행1열의 그리드 레이아웃
			
			btnAdd=new JButton("상품추가");
			btnSelect=new JButton("상품조회");
			btnDel=new JButton("상품삭제");
			btnUpdate=new JButton("상품수정");
			
			this.add(btnAdd);
			this.add(btnDel);
			this.add(btnSelect);
			this.add(btnUpdate);
			
			//이벤트
			btnAdd.addActionListener(this);
			btnDel.addActionListener(this);
			btnSelect.addActionListener(this);
			btnUpdate.addActionListener(this);
			
			
		}
		
		
		
		//이벤트
		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			Object ob=e.getSource();
			
			if(ob==btnAdd)
			{
				//상품추가폼 생성
				ShopAdd addShop=new ShopAdd("입력 폼");
			}else if(ob==btnDel)
			{
				String num=JOptionPane.showInputDialog("삭제할 시퀀스 번호를 입력해주세요");
				
				int delCode=sdb.deleteShop(Integer.parseInt(num));
				
				if(delCode==0)
				{
					JOptionPane.showMessageDialog(this, "해당num이 존재하지 않습니다.");
				}else
					JOptionPane.showMessageDialog(this, "삭제되었습니다");
				
				
				
				
				
				
			}else if(ob==btnSelect)
			{
				ShopList list=new ShopList("전체출력");
			}else if(ob==btnUpdate)
			{
				//몇번을 수정할지 묻고 그해당 시퀀스의 수정창을 띄워준다
				String num=JOptionPane.showInputDialog("수정할 num번호를 입력해주세요");
				System.out.println(num);
				
				//취소시 메서드 종료
				if(num==null)
					return;
				ShopDto dto=sdb.getOneSangpum(num);
				ShopUpdate update=new ShopUpdate("수정폼");
				//수정폼에 데이터 넣기
				update.num=dto.getNum();
				update.tfSang.setText(dto.getSangpum());
				update.tfSu.setText(String.valueOf(dto.getSu()));
				update.tfDan.setText(String.valueOf(dto.getDan()));
				update.imageName=dto.getPhoto();
				update.lblPhoto.setText(dto.getPhoto());
				
				//데이터 다 넣었으면 수정폼이 보이게 한다
				update.setVisible(true);
			}
		}

		public static void main(String[] args) {
			
			new ShopMain("스윙기본 #1");
			
			
			
		}

}

package day0326;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import day0319.DBConnect;

public class ShopList extends JFrame {

	Container cp;
	JTable table;
	DefaultTableModel model;
	Vector<ShopDto> list;
	
	ShopDbModel sdb=new ShopDbModel();

	public ShopList(String title) {
			super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 보게하자
			
			//위치 너비
			this.setBounds(1200, 100, 600, 500);
					
			cp=this.getContentPane();
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			cp.setBackground(Color.white);
			initDesign();
			this.setVisible(true);
		}
	public void initDesign()
	{
		this.setLayout(null);
		
		list=sdb.getAllSangpums();
		
		
		String [] title= {"번호","상품명","수량","단가","총금액","구입일"};
		
		model=new DefaultTableModel(title, 0);
		table=new JTable(model);
		JScrollPane js=new JScrollPane(table);
		js.setBounds(20, 20, 500, 420);
		this.add(js);
		
		dataWrite();
		
		//익명 내부클래스
	}
	
	public void dataWrite()
	{
		//테이블의 기존데이터 삭제
		model.setRowCount(0);
		//테이블에 추가
		for(ShopDto dto:list)
		{
			Vector<String> data=new Vector<String>();
			
			data.add(dto.getNum());
			data.add(dto.getSangpum());
			data.add(String.valueOf(dto.getSu()));
			data.add(String.valueOf(dto.getDan()));
			data.add(String.valueOf(dto.getSu()*dto.getDan()));
			data.add(String.valueOf(dto.getGuipday()));

			//테이블 모델에 추가
			model.addRow(data);
		}
	}
	//이미지를 위한 내부클래스
	
		

		public static void main(String[] args) {
			
			new ShopList("상품조회 폼");
			
			
			
		}

}

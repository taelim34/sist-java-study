package day0324;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import day0319.DBConnect;

public class SwingScoreDB extends JFrame implements ActionListener{

	AddScore addScore=new AddScore("성적추가폼");
	UpdateScore updateScore=new UpdateScore("성적수정폼");
	
	Container cp;
	DBConnect db = new DBConnect();
	JTable table;
	DefaultTableModel model;
	JButton btnAdd,btnUpdate,btnDel;
	
	//디자인
	public void initDesigin()
	{
		String [] title= {"번호","이름","반","Java","Jsp","Spring","총점","합계"};
		JPanel pTop=new JPanel();
		this.add("North",pTop);
		
		model=new DefaultTableModel(title, 0);
		table=new JTable(model);
		this.add("Center", new JScrollPane(table));
		
		//테이블에 db데이터 출력
		selectTableWrite();
		
		btnAdd=new JButton("성적추가");
		btnAdd.addActionListener(this);
		pTop.add(btnAdd);
		
		btnUpdate=new JButton("성적수정");
		btnUpdate.addActionListener(this);
		pTop.add(btnUpdate);
		
		btnDel=new JButton("성적삭제");
		btnDel.addActionListener(this);
		pTop.add(btnDel);
		
		
		//addscore에있는 추가버튼에 이벤트를 추가하
		addScore.btnAdd.addActionListener(this);
		
		//update에있는 수정버튼에 이벤트룰 추가
		updateScore.btnMod.addActionListener(this);
		
	}
	
	
	/////////////////테이블 출력하는 메서드
	public void selectTableWrite()
	{
		//테이블초기화
		model.setRowCount(0);
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from stuscore order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				Vector<String> data=new Vector<String>();
				data.add(rs.getString("num"));
				data.add(rs.getString("name"));
				data.add(rs.getString("ban"));
				data.add(rs.getString("java"));
				data.add(rs.getString("jsp"));
				data.add(rs.getString("spring"));
				data.add(rs.getString("total"));
				data.add(rs.getString("average"));
				
				//테이블에 추가
				model.addRow(data);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	//이벤트
	@Override
	public void actionPerformed(ActionEvent e) {
		// 각 버튼에 대한 이벤트
		Object ob=e.getSource();
		
		if(ob==btnAdd)
		{
			addScore.setVisible(true);  //추가폼이 보인다
			//System.out.println("add");
		}else if(ob==btnDel)
		{
			//System.out.println("del");
			String num=JOptionPane.showInputDialog("삭제할 데이터의 시퀀스를 입력해주세요");
			deleteScoreData(num);
			
			
		}else if(ob==btnUpdate)
		{
			//updateScore.setVisible(true);
			//System.out.println("update");
			String num=JOptionPane.showInputDialog("수정할 데이터의 번호를 입력하세요");
			
			this.isOneStuData(num);
			
			
			
			
		}else if(ob==addScore.btnAdd)
		{
			//입력폼을 읽어와서 db에 추가
			this.insertScoreData();
			
			//테이블 다시출력
			this.selectTableWrite();
			
			//초기화
			addScore.tfName.setText("");
			addScore.tfJava.setText("");
			addScore.tfJsp.setText("");
			addScore.tfSpring.setText("");
			
			//프레임사라지게
			addScore.setVisible(false);
		}else if(ob==updateScore.btnMod)
		{
			this.update();//수정메서드 호출
			this.selectTableWrite();//조회메서드 호출
			updateScore.setVisible(false);//수정찬 닫히게
		}
		
		
		
	}
	
	//insert메서드 추가
	public void insertScoreData()
	{
		String name=addScore.tfName.getText();
		String java=addScore.tfJava.getText();
		String jsp=addScore.tfJsp.getText();
		String Spring=addScore.tfSpring.getText();
		String ban=(String)addScore.cbBan.getSelectedItem();
		
		int tot=Integer.parseInt(java)+Integer.parseInt(jsp)+Integer.parseInt(Spring);
		double avg=tot/3.0;
		
		String sql="insert into stuscore values(seq_sungjuk.nextval,?,?,?,?,?,?,?)";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, name);
			pstmt.setString(2, java);
			pstmt.setString(3, jsp);
			pstmt.setString(4, Spring);
			pstmt.setInt(5, tot);
			pstmt.setDouble(6, avg);
			pstmt.setString(7, ban);
			
			
			//업데이트
			pstmt.execute();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//삭제
	public void deleteScoreData(String num)
	{
		System.out.println("num="+num);
		String sql="delete from stuscore where num=?";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			int a=pstmt.executeUpdate();
			
			
			if(a==0)
			
				JOptionPane.showMessageDialog(this, "없는 시퀀스 입니다");
			else
				selectTableWrite();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		
	}
	
	//수정할 하나의 데이터를 수정폼에 띄우기
	public void isOneStuData(String num)
	{
		System.out.println("수정할 num="+num);
		String sql="select * from stuscore where num="+num;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				updateScore.num=num;  //hidden
				updateScore.tfName.setText(rs.getString("name"));
				updateScore.tfJava.setText(rs.getString("java"));
				updateScore.tfJsp.setText(rs.getString("jsp"));
				updateScore.tfSpring.setText(rs.getString("spring"));
				updateScore.cbBan.setSelectedItem(rs.getString("ban"));
				
				//수정폼이 보이게
				updateScore.setVisible(true);
				
				
			}else {
				JOptionPane.showMessageDialog(this, "없는 시퀀스 입니다");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
	}
	//실제수정... 수정버튼을 누르면 수정
	public void update()
	{
		String num=updateScore.num;
		String name=updateScore.tfName.getText();
		String java=updateScore.tfJava.getText();
		String jsp=updateScore.tfJsp.getText();
		String spring=updateScore.tfSpring.getText();
		String ban=(String)updateScore.cbBan.getSelectedItem();
		
		int tot=Integer.parseInt(java)+Integer.parseInt(jsp)
		+Integer.parseInt(spring);
		double avg=tot/3.0;
		String sql="update stuscore set name=?,java=?,jsp=?,spring=?,total="
				+tot+",average="+avg+",ban=? where num=?";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, java);
			pstmt.setString(3, jsp);
			pstmt.setString(4, spring);
			pstmt.setString(5, ban);
			pstmt.setString(6, num);
			
			pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public SwingScoreDB(String title) {
			super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 보게하자
			
			//위치 너비
			this.setBounds(1200, 100, 600, 500);
					
			cp=this.getContentPane();
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			cp.setBackground(Color.white);
			initDesigin();
			this.setVisible(true);
		}
	
		

		public static void main(String[] args) {
			
			SwingScoreDB sw1 = new SwingScoreDB("스윙기본 #1");
			
			
			
		}
}

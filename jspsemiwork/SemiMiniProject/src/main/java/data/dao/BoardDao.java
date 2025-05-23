package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.BoardDto;
import mysql.db.DbConnect;

public class BoardDao {

	DbConnect db=new DbConnect();
	
	//num의 max값 구해서 리턴(null일경우 0으로 리턴)
	public int getMaxNum()
	{
		int max=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select ifnull(max(num),0) from reboard;";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				max=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}	
		
		return max;
	}
	
	//데이터 추가시 같은급룹중에서 전달받은 step보다 큰값을 가진 데이터들은 
	//무조건 restep+1 해준다
	public void updateRestep(int regroup,int restep)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update reboard set restep=restep+1 where regroup=? and restep>?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, regroup);
			pstmt.setInt(2, restep);
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//insert: 세글로 추가할지 답글로 추가할지
	//판단: dto의 num이 null이면 세글로 아니면 답글로 insert할것
	public void insertReboard(BoardDto dto)
	{
		String num=dto.getNum();
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		String sql="insert into reboard(writer,subject,content,pass,regroup,restep,relevel,writeday)"
				+ " values(?,?,?,?,?,?,?,now())";
		
		if(num==null) {
			//세글을 의미
			regroup=this.getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {
			//답글을 의미
			//같은 그룹중에서 restep이 전달받은 값보다 큰경우 무조건 1씩 증가
			this.updateRestep(regroup, restep);
			//그리고 전달받은 level,step 1씩증가
			relevel+=1;
			restep++;
		}
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPass());
			pstmt.setInt(5, regroup);
			pstmt.setInt(6, restep);
			pstmt.setInt(7, relevel);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//디테일페이지(num에대한 하나의 dto)
	public BoardDto getData(String num)
	{
		BoardDto dto=new BoardDto();
		
		String sql="select * from reboard where num=?";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("pass"));
				dto.setRegroup(rs.getInt("regroup"));
				dto.setRestep(rs.getInt("restep"));
				dto.setRelevel(rs.getInt("relevel"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	//조회수
	public void updateReadCount(String num)
	{
		String sql="update reboard set readcount=readcount+1 where num=?";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
				
	}
	
	//전체목록
	public List<BoardDto> getAllDatas()
	{
		List<BoardDto> list=new Vector<BoardDto>();
		String sql="select * from reboard order by regroup desc,restep asc";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDto dto=new BoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("pass"));
				dto.setRegroup(rs.getInt("regroup"));
				dto.setRestep(rs.getInt("restep"));
				dto.setRelevel(rs.getInt("relevel"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//비번체크 삭제
	public boolean deleteData(String num,String pass)
	{
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from reboard where num=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				if(rs.getInt(1)==1)
					flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return flag;
	}
	
	//삭제
	public void deleteBoard(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from reboard where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public BoardDto getParent(int regroup, int restep, int relevel) {
	    BoardDto parent = null;

	    String sql = "SELECT * FROM reboard " +
	                 "WHERE regroup=? AND restep<? AND relevel<? " +
	                 "ORDER BY restep DESC LIMIT 1";

	    Connection conn = db.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, regroup);
	        pstmt.setInt(2, restep);     // 자신보다 먼저 쓴 글
	        pstmt.setInt(3, relevel);    // 자신보다 한 단계 위만 허용

	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            // 여기서 subject가 null이거나 '[삭제된 글입니다]'일 수 있음
	            parent = new BoardDto();
	            parent.setNum(rs.getString("num"));
	            parent.setSubject(rs.getString("subject"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        db.dbClose(rs, pstmt, conn);
	    }

	    return parent;
	}
	
	
}

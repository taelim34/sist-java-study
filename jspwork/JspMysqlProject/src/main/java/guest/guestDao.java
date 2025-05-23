package guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql.db.DbConnect;

public class guestDao {
	
	DbConnect db=new DbConnect();
	public void insertGuest(guestDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into guest values(null,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMyid());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getContent());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체갯수 반환
		public int totalCount()
		{
			int total=0;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from guest";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next())
					total=rs.getInt(1);  //1번열
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return total;
		}
	
	//전체 데이터 가져오기
	public List<guestDto> getAlldatas(int startNum,int perPage)
	{
		List<guestDto> list=new Vector<guestDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from guest order by num desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, perPage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				guestDto dto=new guestDto();
				
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setPhoto(rs.getString("photo"));
				dto.setContent(rs.getString("content"));
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
}

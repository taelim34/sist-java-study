package day0319;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
	
	
	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";

	public  Connection getConnection () {
		
		Connection conn=null;
		
		
		
		
		try {
			conn=DriverManager.getConnection(URL,"taelim0619" ,"a1234" );
						
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			System.out.println("failed");
		}
		
		return conn;
	}
	
	
	public void dbClose(ResultSet rs,Statement stmt,Connection conn) {		
			
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		
	}
	
	public void dbClose(Statement stmt,Connection conn) {		
		
		try {
			
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn) {		
		
		try {
			
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	
}
	public void dbClose(PreparedStatement pstmt,Connection conn) {		
		
		try {
			
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	
}
	

}

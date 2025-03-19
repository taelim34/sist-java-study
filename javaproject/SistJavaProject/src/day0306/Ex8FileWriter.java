package day0306;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class Ex8FileWriter {
	
	public static void fileWrite()
	{
		String fileName = "C:\\sist0217\\work\\test1.txt";
		FileWriter fw = null;
		
		try {
			fw = new FileWriter(fileName); //파일 새로 생성(같은 이름이 있더라도 새로생성)
			
			//파일에 내용추가
			fw.write("오늘 날씨 좋구나\n");
			fw.write(new Date().toString());
			
			System.out.println("**파일저장성공!!**");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void fileWrite2()
	{
		FileWriter fw = null;
		String fileName = "C:\\sist0217\\work\\test2.txt";
		
		try {
			fw = new FileWriter(fileName, true);
			
			fw.write("내이름은 이수연!!!\n");
			fw.write("==========================================\n");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//fileWrite();
		fileWrite2();
	}

}

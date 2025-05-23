package day0306;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class Ex7SawonRead {
	
	//사원번호    사원명    기본급   가족수   초과근무시간     가족수당    시간수당    총급여
	//가족수: 가족수*30000
	//시간수당: 시간당 15000원
	public static void sawonRead() {
		
		String fileName = "C:\\sist0217\\work\\sawon.txt";
		
		FileReader fr = null;
		BufferedReader br = null;
		
		try {
			fr = new FileReader(fileName);
			br = new BufferedReader(fr);
			
			System.out.println("사원번호\t사원명\t기본급\t가족수\t초과근무시간\t가족수당\t시간수당\t총급여");
			System.out.println("========================================================================");
			
			int sum=0;
			while(true)
			{
				String s = br.readLine();
				
				if(s == null)
					break;
					
					StringTokenizer st = new StringTokenizer(s, ",");
					
					
					String sName = st.nextToken();
					int gibonPay = Integer.parseInt(st.nextToken());
					int famSu = Integer.parseInt(st.nextToken());
					int overTime = Integer.parseInt(st.nextToken());
					int famSudang = famSu*30000;
					int overPay = overTime*15000;
					int totPay = gibonPay+famSudang+overPay;
					System.out.println(++sum+"\t"+sName+"\t"+gibonPay+"\t"+famSu+"\t"
					+overTime+"\t\t"+famSudang+"\t"+overPay+"\t"+totPay);
				
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO: handle exception
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		sawonRead();
	}

}

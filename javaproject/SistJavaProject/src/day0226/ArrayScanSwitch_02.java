package day0226;

import java.util.Scanner;

public class ArrayScanSwitch_02 {

	public static void main(String[] args) {
		// 인원수를 입력후 인원수만큼 이름 자바,오라클 순위 두점수 입력후 
		// 총점,순위,등급을 구하시오
		
		Scanner sc = new Scanner(System.in);
		
		int inwon,tot;
		int [] java,oracle,sum,rank;
		String [] grade,name;
		double [] avg;
		
		//인원수부터 읽은후 모든배열에 메모리 할당
		System.out.println("성적을 입력할 인원수는?");
		inwon = Integer.parseInt(sc.nextLine());
		
		java = new int[inwon];
		oracle = new int[inwon];
		sum = new int[inwon];
		rank = new int[inwon];
		
		name = new String[inwon];
		grade = new String[inwon];
		
		avg = new double[inwon];
		
		//입력시 총점,평균 구하기
		for(int i=0;i<inwon;i++)
		{
			System.out.println((i+1)+"번째 이름입력");
			name[i] = sc.nextLine();
			System.out.println("자바와 오라클 점수입력");
			java[i] = Integer.parseInt(sc.nextLine());
			oracle[i]= Integer.parseInt(sc.nextLine());
			
			sum[i]=java[i]+oracle[i];
			avg[i]=sum[i]/2.0;
		}
		
		//등수
		for(int i=0;i<inwon;i++)
		{
		    rank[i]=1; 
			for(int j =0;j<inwon;j++)
			{
				if(avg[i]<avg[j])
				{
					rank[i]++;
				}
			}
		}
		//등급
		for(int i=0;i<inwon;i++)
		{
			/*switch((int)avg[i]/10)
			{
			case 10: case 9:
				grade[i] = "전액장학생";
				break;
			case 8:
				grade[i] = "반액장학생";
				break;
			default:
			grade[i] = "장학생 해당없음";
			
			}*/
			// jdk12에서 추가된 문법
			grade[i] = switch((int)avg[i]/10) {
			case 10,9->"전액 장학생";
			case 8 ->"반액 장학생";
			default->"장학금 해당없음";
			};
		}
		
		//출력
		System.out.println("번호\t이름\t자바점수\t오라클점수\t총점\t평균\t등수\t등급");
		System.out.println("=======================================================");
		for (int i=0;i<inwon;i++)
		{
			System.out.println(i+1+"\t"+name[i]+"\t"+java[i]+"\t"+oracle[i]+"\t"+sum[i]+"\t"+avg[i]+"\t"+rank[i]+"\t"+grade[i]);
		}
			
	}

}

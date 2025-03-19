package day0218;

public class QuizAges_11 {

	public static void main(String[] args) {
		// 메개변수를 이용하여 (args) 다음과 같이 출력하시오(sangname,price,amount,totprice)
		/*
		 * 상품명 : 갤럭시 폴드 
		 * 수량 : 6개
		 * 가격 : 1200000원
		 * 총금액: 7200000원
		 *  */
		
        String sangName=args[0];
        int amount = Integer.parseInt(args[1]);
        int price = Integer.parseInt(args[2]);
        
        int totprice=price*amount;
        		
        System.out.println("상품명 : "+sangName);
        System.out.println("수량 : "+amount+"개");
        System.out.println("가격 : "+price+"원");
        System.out.println("총금액 : "+totprice+"원 ");
        
        
        
        
	}

}

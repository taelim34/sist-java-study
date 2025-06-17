package spring.test.quiz;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		OrderController oc=(OrderController)app.getBean("orderController");
		
		oc.orderInsert("바지", 45000, "검정색");
		oc.orderDelete("3");
		oc.orderSelect("상의", 32500, "빨강색");
	}

}

package spring.di.anno3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Anno3Main {

	public static void main(String[] args) {
		
		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		MySqlController mysql=(MySqlController)app.getBean("mySqlController");
		mysql.insert("ȫ�浿");
		mysql.select("ȫ�浿");
		mysql.delete("3");
	}
}

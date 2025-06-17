package spring.di.anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogicMain {

	public static void main(String[] args) {
		ApplicationContext context=new ClassPathXmlApplicationContext("anno.xml");
		
		LogicController logic1=(LogicController)context.getBean("logic");
		
		logic1.insert("점심시간이다");
		logic1.delete("5");
	}
}

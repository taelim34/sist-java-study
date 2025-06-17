package spring.di.anno2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Anno2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		Fruit tmang=(ThailandManggo)app.getBean("tmgo"); 
		tmang.writerFruitName();
		
		Fruit pmang=(PhiManggo)app.getBean("pmgo");
		pmang.writerFruitName();
		
		MyFruit myfruit=(MyFruit)app.getBean("myFruit");
		myfruit.writeFruit();
		
		
	}

}

package spring.di.anno2;

import org.springframework.stereotype.Component;

@Component("tmgo")
public class ThailandManggo implements Fruit {

	@Override
	public void writerFruitName() {
		// TODO Auto-generated method stub
		System.out.println("ÅÂ±¹¸Á°í");
	}

}

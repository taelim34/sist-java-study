package day0305;

//추상메서드 하나라도 가지고 있다면 추상클래스  
abstract class Game{
	
	abstract void play();  //추상메서드
	abstract void stop();
	
}
////////////////
class YongHee extends Game{

	@Override
	void play() {
		System.out.println("용희 님이 게임을 시작합니다");
		
	}

	@Override
	void stop() {
		System.out.println("용희 님이 게임을 중지합니다");
		
	}
	
}
class JooHee extends Game{

	@Override
	void play() {
		System.out.println("주희 님이 게임을 시작합니다");
		
	}

	@Override
	void stop() {
		System.out.println("주희 님이 게임을 중지합니다");
		
	}
	
}
class HaeJee extends Game{

	@Override
	void play() {
		System.out.println("혜지 님이 게임을 시작합니다");
	}

	@Override
	void stop() {
		System.out.println("혜지 님이 게임을 중지합니다");
		
	}
	
}
public class Ex3Abst {

	public static void main(String[] args) {
		
		Game [] game = new Game[3];
		
		game[0] = new YongHee();
		game[1] = new JooHee();
		game[2]	= new HaeJee();
		
		for(int i=0;i<game.length;i++) 
		{
			game[i].play();
		}
		System.out.println("===========================");
		for(int i=game.length-1;i>=0;i--)
		{
			game[i].stop();
			
		}
		

	}

}

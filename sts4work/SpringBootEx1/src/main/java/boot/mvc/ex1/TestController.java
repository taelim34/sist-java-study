package boot.mvc.ex1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class TestController {
	
	@GetMapping("/test")
	public TestDto hello() {
		TestDto dto=new TestDto();
		
		dto.setName("나나");
		dto.setAddr("서울시 강동구");
		
		return dto;
	}
	
}

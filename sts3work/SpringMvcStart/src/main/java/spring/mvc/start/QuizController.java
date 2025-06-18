package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuizController {

	@GetMapping("/quiz/lunch/burger")
	public String quiz1(Model model) {
		
		model.addAttribute("title", "이미지 출력과제");
		model.addAttribute("stuName", "홍길동");
		
		return "quiz1";
	}
}

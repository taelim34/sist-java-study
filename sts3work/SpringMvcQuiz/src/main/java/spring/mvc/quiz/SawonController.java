package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SawonController {

	@GetMapping("")
	public String sawonForm()
	{
		return "start";
	}
	
	@GetMapping("sawon/form")
	public ModelAndView form()
	{
		ModelAndView model=new ModelAndView();
		
		model.setViewName("sawonform");
		return model;
	}
	
	@PostMapping("sawon/info")
	public ModelAndView info(@ModelAttribute SawonDto dto)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("dto", dto);
		
		model.setViewName("sawoninfo");
		return model;
	}
}

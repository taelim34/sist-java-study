package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import boot.dto.FoodDto;

@Controller
public class QuizController {

	@GetMapping("/")
	public String form()
	{
		
		return "form";
	}
	
	@PostMapping("/foodshow")
	public ModelAndView show(@ModelAttribute FoodDto dto)
	{
		ModelAndView model=new ModelAndView();
		
		String fphotos=dto.getFphoto();
		if(fphotos !=null && !fphotos.isEmpty())
		{
			String [] photoList=fphotos.split(",");
			model.addObject("photoList", photoList);
		}
		
		model.setViewName("show");
		
		return model;
	}
}

package boot.jpa.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.jpa.dto.ShopDto;

@Controller
public class ShopController {

	@Autowired
	ShopDao dao;
	
	//리스트이동
	@GetMapping("/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		List<ShopDto> list=dao.getAllData();
		
		model.addObject("list", list);
		model.addObject("count", list.size());
		
		model.setViewName("list");
		
		return model;
	}
	
	//추가폼이동
	@GetMapping("/insertform")
	public String insertform()
	{
		return "addForm";
	}
	
	//추가
	@PostMapping("/insert")
	public ModelAndView insert(@ModelAttribute ShopDto dto)
	{
		ModelAndView model=new ModelAndView();
		
		dao.insertShop(dto);
		
		model.setViewName("redirect:list");
		
		return model;
	}
	
	//수정폼이동
		@GetMapping("/updateform")
		public String updateform(@RequestParam int num)
		{
			
			
			return "updateForm";
		}
}

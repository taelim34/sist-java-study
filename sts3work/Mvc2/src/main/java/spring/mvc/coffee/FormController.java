package spring.mvc.coffee;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.TestDto;

@Controller
public class FormController {

	@GetMapping("/data/myform")
	public String inputForm()
	{
		
		return "data/form1";
	}
	
	@GetMapping("/data/read1")
	public ModelAndView read1(@RequestParam String name,
			@RequestParam int age,
			@RequestParam String addr,
			@RequestParam (defaultValue = "좋은하루 보내세요") String msg) //required = false
	{
		ModelAndView mview=new ModelAndView();
		
		//request에 저장
		mview.addObject("name", name);
		mview.addObject("age", age);
		mview.addObject("addr", addr);
		mview.addObject("msg", msg);
		
		mview.setViewName("data/process1");
		return mview;
	}
	
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute TestDto dto)
	{
		ModelAndView mview=new ModelAndView();
		
		//request에 저장
		mview.addObject("dto", dto);

		
		mview.setViewName("data/process2");
		return mview;
	}
	
	@PostMapping("/data/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map)
	{
		ModelAndView mview=new ModelAndView();
		
		String sang = map.get("sang");
		String cate = map.get("category");
		String price = map.get("price");
		
		String data=sang+"의 카테고리는 "+cate+"이며 가격은 "+price+"원 입니다.";
		
		mview.addObject("data", data);
		
		mview.setViewName("data/process3");
		
		return mview;
	}
}

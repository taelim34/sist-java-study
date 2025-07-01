package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.InfoDto;
import ch.qos.logback.classic.spi.STEUtil;

@Controller
public class FormReadController {

	// form1을 읽어서 result 1으로 결과 출력
	@PostMapping("/read1")
	public ModelAndView read1(@RequestParam String name, @RequestParam int java, @RequestParam int spring) {
		ModelAndView model = new ModelAndView();

		model.addObject("name", name);
		model.addObject("java", java);
		model.addObject("spring", spring);
		model.addObject("tot", java + spring);
		model.addObject("avg", (java + spring) / 2.0);

		model.setViewName("/result/result1");
		return model;
	}

	// form2을 읽어서 result 2으로 결과 출력
	@PostMapping("/read2")
	public String read2(@ModelAttribute InfoDto dto) {

		return "/result/result2";
	}
	
	// form3을 읽어서 result 3으로 결과 출력
	// map으로 읽을경우 폼의 name이 key값이고 입력값이 value값이다
	@PostMapping("/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		
		ModelAndView model = new ModelAndView();
		
		model.addObject("irum", map.get("irum"));
		model.addObject("mbti", map.get("mbti"));
		model.addObject("major", map.get("major"));
		
		model.setViewName("/result/result3");
		return model;
	}

}

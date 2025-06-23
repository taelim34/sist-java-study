package spring.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.car.data.CarDao;
import spring.car.data.CarDto;

@Controller
public class MyCarController {

	@Autowired
	CarDao dao;
	
	@GetMapping("/car/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		//전체리스트 가져오기
		List<CarDto> list=dao.getAllCarList();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("mycar/carList");
		
		return model;
	}
	
	//입력폼으로 가기
	@GetMapping("/car/writeform")
	public ModelAndView writeform()
	{
		ModelAndView model=new ModelAndView();
		
		model.setViewName("mycar/carForm");
		
		return model;
	}
	
	//insert성공후 리스트
	//sql==>dao==>controller(호출의 역순으로)
	@PostMapping("/car/carinfo")
	public String carinfo(@ModelAttribute CarDto dto)
	{
		
		dao.insertMyCar(dto);
		
		return "redirect:list";
	}
	
	//update폼 이동
	@GetMapping("/car/updateform")
	public ModelAndView updateform(@RequestParam String num)
	{
		ModelAndView model=new ModelAndView();
		
		CarDto dto=dao.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("mycar/updateForm");
		
		return model;
	}
	
	//update
	@PostMapping("/car/carupdate")
	public String updateMyCar(@ModelAttribute CarDto dto)
	{
		dao.updateMyCar(dto);
		
		return "redirect:list";
	}
	
	//delete
	@GetMapping("/car/delete")
	public String delete(@RequestParam String num)
	{
		dao.deleteMyCar(num);
		
		return "redirect:list";
	}
}

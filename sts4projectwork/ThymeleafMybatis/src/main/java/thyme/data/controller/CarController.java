package thyme.data.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import thyme.data.dto.CarDto;
import thyme.data.service.CarService;

@Controller
@RequiredArgsConstructor
public class CarController {

	private final CarService service;
	
	@GetMapping("/board/list")
	public String boardlist(Model model)
	{
		List<CarDto> list=service.getAllMyCars();
		
		model.addAttribute("list", list);
		model.addAttribute("totalcount", list.size());
		
		return "board/list";
	}
	
	@GetMapping("/board/addform")
	public String addform()
	{
		
		return "board/addForm";
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute("dto") CarDto dto,@RequestParam(name = "carupload") MultipartFile carupload,HttpSession session)
	{
		service.insertCar(dto, session, carupload);
		return "redirect:list";
	}
	
	@GetMapping("/board/detail")
	public String datail(@RequestParam(name = "num") Long num,Model model)
	{
		CarDto dto=service.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "board/detailPage";
	}
	
	@GetMapping("/board/carupdate")
	public ModelAndView updateform(@RequestParam(name = "num") Long num)
	{
		ModelAndView model=new ModelAndView();
		
		CarDto dto=service.getData(num);
		
		model.addObject("dto", dto);
		model.setViewName("board/updateForm");
		return model;
	}
	
	@PostMapping("/board/update")
	public ModelAndView update(@ModelAttribute("dto") CarDto dto,@RequestParam(name = "upload") MultipartFile upload,HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		if(upload.getOriginalFilename().equals("")) {
			service.udpateCarNoPhoto(dto);
		}else {
			service.updateCar(dto, session, upload);
		}
		
		model.setViewName("redirect:detail?num="+dto.getNum());
		
		return model;
	}
	
	@GetMapping("/board/delete")
	public String delete(@RequestParam(name = "num") Long num)
	{
		service.deleteCar(num);
		return "redirect:list";
	}
}

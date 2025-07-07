package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MarketDto;
import boot.data.mapper.MarketMapperInter;
import jakarta.servlet.http.HttpSession;

@Controller
public class MarketController {
	
	@Autowired
	MarketMapperInter mapper;
	
	@GetMapping({"/","list"})
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		List<MarketDto> list=mapper.getAllList();
		
		model.addObject("list", list);
		model.addObject("count", totalCount);
		model.setViewName("market/marketList");
		
		return model;
	}
	
	@GetMapping("/addform")
	public ModelAndView addform()
	{
		ModelAndView model=new ModelAndView();
		
		model.setViewName("market/addForm");
		
		return model;
	}
	
	@PostMapping("insert")
	public ModelAndView insert(@ModelAttribute MarketDto dto,
			@RequestParam MultipartFile photo,
			HttpSession session)
	{
		ModelAndView model=new ModelAndView();	
		
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		if(photo.getOriginalFilename().equals("")) {
			dto.setPhotoname(null);
		}else {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname=sdf.format(new Date())+"_"+photo.getOriginalFilename();
			dto.setPhotoname(photoname);
			
			//실제 업로드
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertMarket(dto);
		
		model.setViewName("redirect:list");
		
		return model;
	}
	
	@GetMapping("/updateform")
	public ModelAndView updateform(@RequestParam String num)
	{
		ModelAndView model=new ModelAndView();
		
		MarketDto dto=mapper.getData(num);
		
		model.addObject("dto", dto);
		model.setViewName("market/updateForm");
		
		return model;
	}
	
	@PostMapping("/update")
	public ModelAndView update(@ModelAttribute MarketDto dto,
			@RequestParam MultipartFile photo,
			HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		if(photo.getOriginalFilename().equals("")) {
			dto.setPhotoname(null);
		}else {
			String oldPhoto=mapper.getData(dto.getNum()).getPhotoname();
			
			File file=new File(path+"\\"+oldPhoto);
			file.delete();
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname=sdf.format(new Date())+"_"+photo.getOriginalFilename();
			dto.setPhotoname(photoname);
			
			//실제 업로드
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.updateMarket(dto);
		
		model.setViewName("redirect:list");
		
		return model;
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String num)
	{
		mapper.deleteMarket(num);
		
		return "redirect:list";
	}
}

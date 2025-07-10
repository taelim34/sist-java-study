package boot.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.board.dto.BoardDto;
import boot.board.service.BoardService;
import jakarta.servlet.http.HttpSession;


@Controller
public class BoardController {
	
	@Autowired
	BoardService service;

	@GetMapping("/")
	public String home() {
		
		return "redirect:board/list";
	}
	
	@GetMapping("/board/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		List<BoardDto> list=service.getAllDatas();
		
		model.addObject("list", list);
		model.addObject("count", list.size());
		model.setViewName("board/boardList");
		return model;
	}
	
	@GetMapping("/board/form")
	public String form()
	{
		
		return "board/addForm";
	}
	
	@PostMapping("/board/insert")
	public ModelAndView insert(@ModelAttribute BoardDto dto,
			HttpSession session,
			MultipartFile upload)
	{
		ModelAndView model=new ModelAndView();
		
		service.insertBoard(dto, upload, session);
		
		model.setViewName("redirect:list");
		
		return model;
	}
	
	@GetMapping("/board/detailpage")
	public ModelAndView detailpage(@RequestParam Long num)
	{
		ModelAndView model=new ModelAndView();
		
		BoardDto dto = service.getData(num);
		
		String content=dto.getContent().replace("\n", "<br>");
		dto.setContent(content);
		
		model.addObject("dto", dto);
		model.setViewName("board/detailPage");
		
		return model;
	}
	
	@GetMapping("/board/updateform")
	public ModelAndView updateform(@RequestParam Long num)
	{
		
		ModelAndView model=new ModelAndView();
		BoardDto dto = service.getData(num);
		
		String content=dto.getContent().replace("\n", "<br>");
		dto.setContent(content);
		
		model.addObject("dto", dto);
		model.setViewName("board/updateForm");
		return model;
	}
	
	@PostMapping("/board/update")
	public String update(@ModelAttribute BoardDto dto,HttpSession session,
			MultipartFile upload)
	{
		service.updateBoard(dto, upload, session);
		
		return "redirect:detailpage?num="+dto.getNum();
	}
	
	@GetMapping("/board/delete")
	public String delete(@RequestParam Long num,HttpSession session)
	{
		
		service.deleteBoard(num, session);
		
		return "redirect:list";
	}
}

package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.BoardAnswerDto;
import boot.data.service.BoardAnswerService;
import boot.data.service.MemberService;
import ch.qos.logback.classic.spi.STEUtil;
import jakarta.servlet.http.HttpSession;

@RestController
public class BoardAnswerController {

	@Autowired
	BoardAnswerService aservice;
	@Autowired
	MemberService mserviece;
	
	
	//insert
	@PostMapping("/board/ainsert")
	public void ainsert(@ModelAttribute BoardAnswerDto dto,HttpSession session)
	{
		//세션로그인한 id,name
		String myid=(String)session.getAttribute("myid");
		String name=mserviece.getName(myid);
		
		//dto
		dto.setMyid(myid);
		dto.setName(name);
		
		aservice.insertAnswer(dto);
	}
	
	@GetMapping("/board/alist")
	public List<BoardAnswerDto> alist(@RequestParam String num)
	{
		return aservice.getAllAnswers(num);
	}
	
	@PostMapping("/board/adelete")
	public void adelete(@RequestParam String idx)
	{
		aservice.deleteAnswer(idx);
	}
	
	
	
	
	
}

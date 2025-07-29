package boot.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
//@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@PostMapping("/member/insert")
	public void insert(@RequestBody MemberDto dto)
	{
		memberService.insertMember(dto);
	}
	
	@GetMapping("/member/list")
	public List<MemberDto> list()
	{
		return memberService.getAllMembers();
	}
	
	@DeleteMapping("/member/delete")
	public void delete(@RequestParam("num") int num)
	{
		memberService.deleteMember(num);
	}
	
	//중복체크
	@GetMapping("/member/idcheck")
	public int idcheck(@RequestParam("myid") String myid)
	{
		System.out.println(myid);
		return memberService.getSearchId(myid);
	}
	
	//로그인체크
	@PostMapping("/login/check")
	public Map<String, Object> logincheck(@RequestBody MemberDto dto)
	{
		String myid = dto.getMyid();
	    String mypass = dto.getMypass();
	    int check = memberService.getLogin(myid, mypass);
	    
	    Map<String, Object> result=new HashMap<>();
	    
	    result.put("check", check);
	    result.put("myid", dto.getMyid());
	    result.put("mypass", dto.getMypass());
	    
	    if(check==1) {
	    	String myname=memberService.getName(myid);
	    	result.put("myname", myname);
	    }else {
	    	result.put("myname", null);
	    }
		
		return result;
	}
}

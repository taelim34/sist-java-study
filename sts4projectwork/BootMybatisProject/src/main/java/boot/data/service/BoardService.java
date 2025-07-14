package boot.data.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import boot.data.dto.BoardDto;
import boot.data.mapper.BoardMapperInter;
import jakarta.servlet.http.HttpSession;

@Service
public class BoardService {

	@Autowired
	BoardMapperInter mapper;
	
	@Autowired
	MemberService mservice;
	
	public int getTotalCount(String serchcolumn,String serchword)
	{
		Map<String, String> map=new HashMap<>();
		map.put("serchword", serchword);
		map.put("serchcolumn", serchcolumn);
		
		return mapper.getTotalCount(map);
	}
	public void insertBoard(@ModelAttribute BoardDto dto,HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/membersave");
		System.out.println(path);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile("no");
		else {
			String uploadfile=sdf.format(new Date())+dto.getUpload().getOriginalFilename();
			dto.setUploadfile(uploadfile);
			
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadfile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//세션에서 id가져와서 dto에 저장
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid);
		String name=mservice.getName(myid);
		dto.setName(name);
		
		mapper.insertBoard(dto);
	}
	public int getMaxNum()
	{
		
		return mapper.getMaxNum();
	}
	public List<BoardDto> getAllList(String serchcolumn,String serchword,int startnum,int perpage)
	{
		Map<String, Object> map=new HashMap<>();
		
		map.put("serchword", serchword);
		map.put("serchcolumn", serchcolumn);
		map.put("startnum", startnum);
		map.put("perpage", perpage);
		
		return mapper.getAllList(map);
	}
	public BoardDto getData(String num)
	{
		return mapper.getData(num);
	}
	public void updateReadcount(String num)
	{
		mapper.updateReadcount(num);
	}
}

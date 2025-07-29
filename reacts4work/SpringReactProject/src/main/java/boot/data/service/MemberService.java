package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapper;

@Service
public class MemberService implements MemberServiceInter {
	
	@Autowired
	private MemberMapper mapper;
	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapper.insertMember(dto);
	}

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return mapper.getAllMembers();
	}

	@Override
	public int getSearchId(String myid) {
		// TODO Auto-generated method stub
		return mapper.getSearchId(myid);
	}

	@Override
	public int getLogin(String myid, String mypass) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		
		map.put("myid", myid);
		map.put("mypass", mypass);
		
		return mapper.getLogin(map);
	}

	@Override
	public String getName(String myid) {
		// TODO Auto-generated method stub
		return mapper.getName(myid);
	}

	@Override
	public void deleteMember(int num) {
		// TODO Auto-generated method stub
		mapper.deleteMember(num);
	}

}

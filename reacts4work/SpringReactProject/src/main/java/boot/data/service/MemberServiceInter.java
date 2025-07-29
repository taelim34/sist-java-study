package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String myid);
	public int getLogin(String myid,String mypass);
	public String getName(String myid);
	public void deleteMember(int num);
}

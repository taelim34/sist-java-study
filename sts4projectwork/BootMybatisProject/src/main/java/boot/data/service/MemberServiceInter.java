package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {

	public int getSearchId(String id);
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public String getName(String id);
	public int loginIdPassCheck(String id, String pass);
	public MemberDto getDataById(String id);
	
	//수정삭제
	public MemberDto getDataByNum(String num);
	public void updatePhoto(String num,String photo);
	public void updateMember(MemberDto dto);
	public void deleteMember(String num);
}

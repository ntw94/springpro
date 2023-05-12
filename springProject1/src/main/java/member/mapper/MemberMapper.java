package member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import member.model.Member;

@Mapper
public interface MemberMapper {

	public List<Member> getList();
	public Member getListOne(String member_id);
	public void setInsert(Member member);
	public void setDelete(int idx);
	public void setUpdate(Member member);
	
	//로그인 처리
	public Member setLogin(Member member);
}

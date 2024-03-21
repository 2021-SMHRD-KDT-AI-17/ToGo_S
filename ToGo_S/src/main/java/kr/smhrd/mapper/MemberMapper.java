package kr.smhrd.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Member;

// 이 클래스가 mapper파일임을 알려줘야 함
@Mapper
public interface MemberMapper {
	
	public void memberInsert(Member member);

	public Member memberSelect(Member member);

	@Select("select * from member where email = #{email}")
	public Member emailCheck(String inputE);

	public void memberUpdate(Member member);

	public List<Member> goShowMember();

	public void deleteMember(String email);

	public List<Member> getMemberEmail();

}

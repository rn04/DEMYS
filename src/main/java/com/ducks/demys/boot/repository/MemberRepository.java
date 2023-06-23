package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.ducks.demys.boot.vo.Member;

@Mapper
public interface MemberRepository {
	
	public List<Member> getMemberList();
	
	public Member getMemberByMEMBER_NUM(int MEMBER_NUM);
	
	public Member getMemberByMEMBER_ID(String MEMBER_ID);
	
	public int selectMemberSequenceNextValue();
	
	public void registMember(Member member);
	
	public void modifyMember(Member member);

	public void modifyForQuitMember(Member member);
	
	public void removeMember(int MEMBER_NUM);
	
	
	//비밀번호 찾기

	public Member readMember(String MEMBER_ID);
    
    public Member idCheck(String MEMBER_ID);

	public String verifyVerificationCode(String MEMBER_ID, String VERTIFICATION_CODE);

	public void updatePassword(String VERTIFICATION_CODE, String MEMBER_PW);

	public void updateVerificationCode(String MEMBER_ID, String VERTIFICATION_CODE);

	public void save(Member member);

	//인사과 코드 인증
	public Member findByPassword(String newAuthority, String authority_code);

	public List<Member> getMemberListSearch(String searchType, String keyword);

	public List<Member> getMemberByMEMBER_DEP(String MEMBER_DEP);


}

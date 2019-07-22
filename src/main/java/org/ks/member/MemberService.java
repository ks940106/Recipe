package org.ks.member;

import java.util.ArrayList;

import org.ks.member.vo.Member;
import org.ks.member.vo.MemberPageData;

public interface MemberService {
	public Member login(Member m);
	public String emailCheck(String id);
	public String nickCheck(String nick);
	public int insertMember(Member m);
	public Member pwCheck(String id,String pw);
	public int updateMember(Member m);
	public int deleteMember(String id);
	public MemberPageData memberList(int reqPage);
	public Member idAndNameCheck(Member m);
	public int pwUpdate(Member m);
	public String findId(Member m);
	public String email(Member m);
	public Member memberDetail(String id);
}

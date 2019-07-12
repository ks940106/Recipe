package org.ks.member;

import java.util.ArrayList;

import org.ks.member.vo.Member;

public interface MemberDAO {
	public Member login(Member m);
	public String emailCheck(String id);
	public String nickCheck(String nick);
	public int insertMember(Member m);
	public Member pwCheck(String id,String pw);
	public int updateMember(Member m);
	public int deleteMember(String id);
	public ArrayList<Member> memberList();
}

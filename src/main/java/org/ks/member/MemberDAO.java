package org.ks.member;

import org.ks.member.vo.Member;

public interface MemberDAO {
	public Member login(Member m);
	public String emailCheck(String id);
	public String nickCheck(String nick);
}

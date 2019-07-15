package org.ks.member;

import java.util.ArrayList;

import org.ks.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	@Qualifier("memberDaoImpl")
	private MemberDAO memberDao;
	
	@Override
	public Member login(Member m) {
		m=memberDao.login(m);
		return m;
	}
	
	public String emailCheck(String id) {
		String idch = memberDao.emailCheck(id);
		return idch;
	}

	@Override
	public String nickCheck(String nick) {
		String nickCh=memberDao.nickCheck(nick);
		return nickCh;
	}

	@Override
	public int insertMember(Member m) {
		int result = memberDao.insertMember(m);
		return result;
	}

	@Override
	public Member pwCheck(String id, String pw) {
		Member m =memberDao.pwCheck(id,pw);
		return m;
	}

	@Override
	public int updateMember(Member m) {
		int result = memberDao.updateMember(m);
		return result;
	}

	@Override
	public int deleteMember(String id) {
		int result = memberDao.deleteMember(id);
		return result;
	}

	@Override
	public ArrayList<Member> memberList() {
		ArrayList<Member> list = memberDao.memberList();
		return list;
	}

	@Override
	public Member idAndNameCheck(Member m) {
		Member member = memberDao.idAndNameCheck(m);
		return member;
	}

	@Override
	public int pwUpdate(Member m) {
		int result = memberDao.pwUpdate(m);
		return result;
	}

}

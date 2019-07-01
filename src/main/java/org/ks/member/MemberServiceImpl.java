package org.ks.member;

import org.ks.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	@Qualifier("memberDaoImpl")
	private MemberDAO memberDao;
	
	@Override
	public Member login(Member m) {
		m=memberDao.login(m);
		return m;
	}

}

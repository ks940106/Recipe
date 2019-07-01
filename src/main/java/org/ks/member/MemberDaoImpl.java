package org.ks.member;

import org.ks.member.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDaoImpl")
public class MemberDaoImpl implements MemberDAO{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(Member m) {
		System.out.println(m.getId());
		Member m1= sqlSession.selectOne("member.login",m);
		return m1;
	}
}

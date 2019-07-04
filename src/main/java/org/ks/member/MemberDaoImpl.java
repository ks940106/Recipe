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
	public String emailCheck(String id) {
		
		String idck = sqlSession.selectOne("member.emailCheck",id);
		System.out.println(idck);
		return idck;
	}
	@Override
	public String nickCheck(String nick) {
		String nickCh=sqlSession.selectOne("member.nickCheck",nick);
		System.out.println(nickCh);
		return nickCh;
	}
	@Override
	public int insertMember(Member m) {
		System.out.println(m.getId());
		System.out.println(m.getMemberImg());
		System.out.println(m.getZipCode());
		int result = sqlSession.insert("member.insertMember",m);
		return result;
	}
}

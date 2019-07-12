package org.ks.member;

import java.util.HashMap;
import java.util.Map;

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
		System.out.println(m.getGender());
		int result = sqlSession.insert("member.insertMember",m);
		return result;
	}
	@Override
	public Member pwCheck(String id, String pw) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id",id);
		map.put("pw",pw);
		Member m  =sqlSession.selectOne("member.pwCheck",map);
		return m;
	}
	@Override
	public int updateMember(Member m) {
		int result = sqlSession.update("member.updateMember",m);
		return result;
	}
	@Override
	public int deleteMember(String id) {
		int result = sqlSession.delete("member.deleteMember",id);
		return result;
	}
}

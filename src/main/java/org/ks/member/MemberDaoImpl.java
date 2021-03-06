package org.ks.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
		Member m1= sqlSession.selectOne("member.login",m);
		return m1;
	}
	public String emailCheck(String id) {
		
		String idck = sqlSession.selectOne("member.emailCheck",id);
		return idck;
	}
	@Override
	public String nickCheck(String nick) {
		String nickCh=sqlSession.selectOne("member.nickCheck",nick);
		return nickCh;
	}
	@Override
	public int insertMember(Member m) {
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
	@Override
	public ArrayList<Member> memberList(int start,int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<Member> list = sqlSession.selectList("member.memberList",map);
		return (ArrayList<Member>) list;
	}
	@Override
	public Member idAndNameCheck(Member m) {
		Member member = sqlSession.selectOne("member.idAndName",m);
		return member;
	}
	@Override
	public int pwUpdate(Member m) {
		int result = sqlSession.update("member.pwUpdate",m);
		return result;
	}
	@Override
	public String findId(Member m) {
		String id = sqlSession.selectOne("member.findId",m);
		return id;
	}
	@Override
	public String email(Member m) {
		String email=sqlSession.selectOne("member.email",m);
		return email;
	}
	@Override
	public Member memberDetail(String id) {
		Member m = sqlSession.selectOne("member.memberDetail", id);
		return m;
	}
	@Override
	public int totalCount() {
		int totalCount = sqlSession.selectOne("member.totalCount");
		return totalCount;
	}
}

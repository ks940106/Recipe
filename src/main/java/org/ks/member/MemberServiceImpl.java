package org.ks.member;

import java.util.ArrayList;

import org.ks.member.vo.Member;
import org.ks.member.vo.MemberPageData;
import org.ks.notice.vo.NoticePageData;
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
	public MemberPageData memberList(int reqPage) {
		int numPerPage = 20;
		int totalCount = memberDao.totalCount();
		int totalPage=(totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		
		int start=(reqPage-1)*numPerPage+1;
		int end=reqPage*numPerPage;
		ArrayList<Member> list = memberDao.memberList(start,end);
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='pageBtn' href='/memberList.do?reqPage="+(pageNo-1)+"'><</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageSelected'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageNo' href='/memberList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='pageBtn' href='/memberList.do?reqPage="+pageNo+"'>></a>";
		}
		MemberPageData mp = new MemberPageData(list,pageNavi);
		return mp;
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

	@Override
	public String findId(Member m) {
		String id = memberDao.findId(m);
		return id;
	}

	@Override
	public String email(Member m) {
		String email = memberDao.email(m);
		return email;
	}

	@Override
	public Member memberDetail(String id) {
		Member m = memberDao.memberDetail(id);
		return m;
	}

}

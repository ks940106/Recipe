package org.ks.notice;

import java.util.ArrayList;
import java.util.List;

import org.ks.notice.vo.Notice;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDaoImpl")
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Notice> noticeList() {
		List<Notice> list = sqlSession.selectList("notice.noticeList");
		return (ArrayList<Notice>) list;
	}

	@Override
	public Notice noticeDetail(String idx) {
		Notice n = sqlSession.selectOne("notice.noticeDetail",idx);
		return n;
	}

	@Override
	public int noticeWrite(Notice n) {
		int result = sqlSession.insert("notice.noticeWrite",n);
		return result;
	}

	@Override
	public int noticeUpdate(Notice n) {
		System.out.println("DB전");
		int result =sqlSession.update("notice.noticeUpdate",n);
		System.out.println("DB후");
		return result;
	}
}

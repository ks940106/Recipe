package org.ks.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ks.notice.vo.Notice;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDaoImpl")
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Notice> noticeList(int start,int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<Notice> list = sqlSession.selectList("notice.noticeList",map);
		return (ArrayList<Notice>) list;
	}

	@Override
	public Notice noticeDetail(int idx) {
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
		int result =sqlSession.update("notice.noticeUpdate",n);
		return result;
	}

	@Override
	public int totalCount() {
		int totalCount = sqlSession.selectOne("notice.totalCount");
		return totalCount;
	}

	@Override
	public int noticeDelete(int idx) {
		int result = sqlSession.delete("notice.noticeDelete",idx);
		return result;
	}
}

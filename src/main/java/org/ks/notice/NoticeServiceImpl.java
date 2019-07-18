package org.ks.notice;

import java.util.ArrayList;

import org.ks.notice.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	@Qualifier(value="noticeDaoImpl")
	private NoticeDao noticeDaoImpl;

	@Override
	public ArrayList<Notice> noticeList() {
		ArrayList<Notice> list = noticeDaoImpl.noticeList();
		return list;
	}

	@Override
	public Notice noticeDetail(String idx) {
		Notice n = noticeDaoImpl.noticeDetail(idx);
		return n;
	}

	@Override
	public int noticeWrite(Notice n) {
		int result = noticeDaoImpl.noticeWrite(n);
		return result;
	}

	@Override
	public int noticeUpdate(Notice n) {
		int result = noticeDaoImpl.noticeUpdate(n);
		return result;
	}
}

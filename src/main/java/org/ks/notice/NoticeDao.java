package org.ks.notice;

import java.util.ArrayList;

import org.ks.notice.vo.Notice;

public interface NoticeDao {
	public ArrayList<Notice> noticeList();
	public Notice noticeDetail(String idx);
	public int noticeWrite(Notice n);
}

package org.ks.notice;

import java.util.ArrayList;

import org.ks.notice.vo.Notice;

public interface NoticeDao {
	public int totalCount();
	public ArrayList<Notice> noticeList(int start,int end);
	public Notice noticeDetail(int idx);
	public int noticeWrite(Notice n);
	public int noticeUpdate(Notice n);
	public int noticeDelete(int idx);
}

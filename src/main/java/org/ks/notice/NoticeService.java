package org.ks.notice;

import java.util.ArrayList;

import org.ks.notice.vo.Notice;

public interface NoticeService {
	public ArrayList<Notice> noticeList();
	public Notice noticeDetail(int idx);
	public int noticeWrite(Notice n);
	public int noticeUpdate(Notice n);
}

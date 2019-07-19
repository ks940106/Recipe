package org.ks.notice;

import org.ks.notice.vo.Notice;
import org.ks.notice.vo.NoticePageData;

public interface NoticeService {
	public NoticePageData noticeList(int reqPage);
	public Notice noticeDetail(int idx);
	public int noticeWrite(Notice n);
	public int noticeUpdate(Notice n);
}

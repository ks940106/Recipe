package org.ks.notice;

import java.util.ArrayList;

import org.ks.notice.vo.Notice;
import org.ks.notice.vo.NoticePageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	@Qualifier(value="noticeDaoImpl")
	private NoticeDao noticeDaoImpl;

	@Override
	public NoticePageData noticeList(int reqPage) {
		int numPerPage = 10;
		int totalCount = noticeDaoImpl.totalCount();
		System.out.println(totalCount);
		int totalPage=(totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		
		int start=(reqPage-1)*numPerPage+1;
		int end=reqPage*numPerPage;
		
		ArrayList<Notice> list = noticeDaoImpl.noticeList(start,end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='pageBtn' href='/adminNoticeList.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageSelected'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageNo' href='/adminNoticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='pageBtn' href='/adminNoticeList.do?reqPage="+pageNo+"'>다음</a>";
		}
		NoticePageData np = new NoticePageData(list,pageNavi);
		return np;
	}
	//캠핑장에서 페이징
	public NoticePageData noticeListCamping(int reqPage) {
		int numPerPage = 10;
		int totalCount = noticeDaoImpl.totalCount();
		int totalPage=(totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		
		int start=(reqPage-1)*numPerPage+1;
		int end=reqPage*numPerPage;
		
		ArrayList<Notice> list = noticeDaoImpl.noticeList(start,end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='pageBtn' href='/noticeList.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageSelected'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageNo' href='/noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='pageBtn' href='/noticeList.do?reqPage="+pageNo+"'>다음</a>";
		}
		NoticePageData np = new NoticePageData(list,pageNavi);
		return np;
	}

	@Override
	public Notice noticeDetail(int idx) {
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

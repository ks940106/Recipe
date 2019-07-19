package org.ks.freeBoard;

import java.util.ArrayList;
import java.util.List;

import org.ks.freeBoard.vo.FreeBoard;
import org.ks.freeBoard.vo.FreeBoardPageData;
import org.ks.freeBoard.vo.FreePrintPage;
import org.ks.talkBoard.vo.MainBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("freeBoardService")
public class FreeBoardService {
	@Autowired
	@Qualifier(value="freeBoardDao")
	private FreeBoardDao freeBoardDao;
	
	public int newBoard(FreeBoard fb) {
		return freeBoardDao.newBoard(fb);
	}
	
	public FreeBoardPageData mainBoard(int type,int reqPage){
		int numPerPage = 5;
		System.out.println("123123123123123123213");
		
		
			int totalCount = freeBoardDao.freeBoardCount(type);
			System.out.println(totalCount);
			int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			FreePrintPage fpp = new FreePrintPage();
			fpp.setStart((reqPage-1)*numPerPage+1);
			fpp.setEnd(reqPage*numPerPage);
			fpp.setType(type);
			ArrayList<FreeBoard> list = (ArrayList<FreeBoard>)freeBoardDao.mainFreeBoard(fpp);
			String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			if(pageNo != 1) {
				pageNavi += "<a class='paging-arrow prev-arrow' href='/freeBoard.do?reqPage="+(pageNo-1)+"&boardType="+type+"'><img src=\"/resources/img/talk/left_arrow.png\" style=\"width:50px;height:50px;\"></a>";
			}
			int i = 1;
			while(!(i++>pageNaviSize || pageNo>totalPage)) {
				if(reqPage == pageNo) {
					pageNavi += "<span class='cur'>"+pageNo+"</span>";
				}else {
					pageNavi += "<a class='selectPage' href='/freeBoard.do?reqPage="+pageNo+"&boardType="+type+"'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			if(pageNo <= totalPage) {
				pageNavi += "<a class='paging-arrow next-arrow' href='/freeBoard.do?reqPage="+pageNo+"&boardType="+type+"'><img src=\"/resources/img/talk/right_arrow.png\" style=\"width:50px;height:50px;\"></a>";
			}
			FreeBoardPageData pd = new FreeBoardPageData(list,pageNavi);
			return pd;
	}
	
	public int viewCountUp(int no) {
		return freeBoardDao.viewCountUp(no);
	}
	
	public FreeBoard selectBoard(int no) {
		return freeBoardDao.selectBoard(no);
	}	
		
	public int deleteFreeBoard(int boardNo) {
		return freeBoardDao.deleteFreeBoard(boardNo);
	}
	
	public int modifyComplete(FreeBoard fb) {
		return freeBoardDao.modifyComplete(fb);
	}

}

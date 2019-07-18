package org.ks.talkBoard;

import java.util.ArrayList;

import org.ks.talkBoard.vo.BoardLike;
import org.ks.talkBoard.vo.MainBoard;
import org.ks.talkBoard.vo.MainPageData;
import org.ks.talkBoard.vo.PrintPage;
import org.ks.talkBoard.vo.TalkBoard;
import org.ks.talkBoard.vo.TalkBoardComment;
import org.ks.talkBoard.vo.TalkBoardPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("talkBoardService")
public class TalkBoardServiceImpl implements TalkBoardService {
	@Autowired
	@Qualifier(value="talkBoardDao")
	private TalkBoardDaoImpl talkBoardDao;

	@Override
	public TalkBoardPageData mainBoard(int reqPage,String type) {
		int numPerPage = 5;
		System.out.println("123123123123123123213");
		
		if(type.equals("0")) {
			int totalCount = talkBoardDao.seeUserCount();
			System.out.println(totalCount);
			int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			PrintPage pp = new PrintPage();
			pp.setStart((reqPage-1)*numPerPage+1);
			pp.setEnd(reqPage*numPerPage);
			pp.setType(type);
			ArrayList<TalkBoard> list = (ArrayList<TalkBoard>)talkBoardDao.mainBoard(pp);
			String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			if(pageNo != 1) {
				pageNavi += "<a class='paging-arrow prev-arrow' href='/mainBoard.do?reqPage="+(pageNo-1)+"&boardType="+type+"'><img src=\"/resources/img/talk/left_arrow.png\" style=\"width:50px;height:50px;\"></a>";
			}
			int i = 1;
			while(!(i++>pageNaviSize || pageNo>totalPage)) {
				if(reqPage == pageNo) {
					pageNavi += "<span class='cur'>"+pageNo+"</span>";
				}else {
					pageNavi += "<a class='selectPage' href='/mainBoard.do?reqPage="+pageNo+"&boardType="+type+"'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			if(pageNo <= totalPage) {
				pageNavi += "<a class='paging-arrow next-arrow' href='/mainBoard.do?reqPage="+pageNo+"&boardType="+type+"'><img src=\"/resources/img/talk/right_arrow.png\" style=\"width:50px;height:50px;\"></a>";
			}
			TalkBoardPageData pd = new TalkBoardPageData(list,pageNavi,type);
			return pd;
		}else {
			int totalCount = talkBoardDao.seeBoardTypeCount(type);
			System.out.println(totalCount);
			int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			PrintPage pp = new PrintPage();
			pp.setStart((reqPage-1)*numPerPage+1);
			pp.setEnd(reqPage*numPerPage);
			pp.setType(type);
			ArrayList<TalkBoard> list = (ArrayList<TalkBoard>)talkBoardDao.boardType(pp);
			String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			if(pageNo != 1) {
				pageNavi += "<a class='paging-arrow prev-arrow' href='/mainBoard.do?reqPage="+(pageNo-1)+"&boardType="+type+"'><img src=\"/resources/img/talk/left_arrow.png\" style=\"width:50px;height:50px;\"></a>";
			}
			int i = 1;
			while(!(i++>pageNaviSize || pageNo>totalPage)) {
				if(reqPage == pageNo) {
					pageNavi += "<span class='cur'>"+pageNo+"</span>";
				}else {
					pageNavi += "<a class='selectPage' href='/mainBoard.do?reqPage="+pageNo+"&boardType="+type+"'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			if(pageNo <= totalPage) {
				pageNavi += "<a class='paging-arrow next-arrow' href='/mainBoard.do?reqPage="+pageNo+"&boardType="+type+"'><img src=\"/resources/img/talk/right_arrow.png\" style=\"width:50px;height:50px;\"></a>";
			}
			TalkBoardPageData pd = new TalkBoardPageData(list,pageNavi,type);
			return pd;
		}
	}
	
	
	public int insertTalkBoard(TalkBoard tb) {
		return talkBoardDao.insertTalkBoard(tb);
	}

	@Override
	public TalkBoard selectTalkBoard(int no) {
		return talkBoardDao.selectTalkBoard(no);
	}
	@Override
	public TalkBoard modifyTalkBoard(int no) {
		return talkBoardDao.selectTalkBoard(no);
	}

	@Override
	public int deleteTalkBoard(int no) {
		return talkBoardDao.deleteTalkBoard(no);
	}

	@Override
	public int updateTalkBoard(TalkBoard tb) {
		return talkBoardDao.updateTalkBoard(tb);
	}

	@Override
	public ArrayList<TalkBoardComment> selectTalkBoardComment(int no) {
		return (ArrayList<TalkBoardComment>)talkBoardDao.selectTalkBoardComment(no);
	}

	@Override
	public int insertTalkBoardComment(TalkBoardComment tbc) {
		return talkBoardDao.insertTalkBoardComment(tbc);
	}

	@Override
	public int deleteTalkBoardComment(int no) {
		return talkBoardDao.deleteTalkBoardComment(no);
	}

	@Override
	public int deleteComment(int no) {
		return talkBoardDao.deleteComment(no);
	}

	@Override
	public BoardLike boardLike(BoardLike bl) {
		return talkBoardDao.boardLike(bl);
	}


	@Override
	public int likeClick(BoardLike bl) {
		return talkBoardDao.likeClick(bl);
	}


	@Override
	public int likeDelClick(BoardLike bl) {
		return talkBoardDao.likeDelClick(bl);
	}


	@Override
	public int commentCount(int no) {
		return talkBoardDao.commentCount(no);
	}


	@Override
	public int likeCount(int no) {
		return talkBoardDao.likeCount(no);
	}
	
}

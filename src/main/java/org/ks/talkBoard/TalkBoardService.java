package org.ks.talkBoard;

import java.util.ArrayList;

import org.ks.talkBoard.vo.BoardLike;
import org.ks.talkBoard.vo.MainPageData;
import org.ks.talkBoard.vo.TalkBoard;
import org.ks.talkBoard.vo.TalkBoardComment;
import org.ks.talkBoard.vo.TalkBoardPageData;

public interface TalkBoardService {

	public TalkBoardPageData mainBoard(int reqPage,String type);

	public int insertTalkBoard(TalkBoard tb);
	
	public TalkBoard selectTalkBoard(int no);
	
	public TalkBoard modifyTalkBoard(int no);
	
	public int deleteTalkBoard(int no);
	
	public int updateTalkBoard(TalkBoard tb);
	
	public ArrayList<TalkBoardComment> selectTalkBoardComment(int no);
	
	public int insertTalkBoardComment(TalkBoardComment tbc);
	
	public int deleteTalkBoardComment(int no);
	
	public int deleteComment(int no);
	
	public BoardLike boardLike(BoardLike bl);
	
	public int likeClick(BoardLike bl);
	
	public int likeDelClick(BoardLike bl);
	
	public int commentCount(int no);
	
	public int likeCount(int no);
}

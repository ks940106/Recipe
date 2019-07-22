package org.ks.talkBoard;

import java.util.ArrayList;

import org.ks.member.vo.Member;
import org.ks.talkBoard.vo.BoardLike;
import org.ks.talkBoard.vo.MainBoard;
import org.ks.talkBoard.vo.TalkBoard;
import org.ks.talkBoard.vo.TalkBoardComment;
import org.ks.talkBoard.vo.TalkBoardPageData;

public interface TalkBoardService {

	public TalkBoardPageData mainBoard(int reqPage,String type);

	public int insertTalkBoard(TalkBoard tb);
	
	public MainBoard selectTalkBoard(int no);
	
	public MainBoard modifyTalkBoard(int no);
	
	public int deleteTalkBoard(int no);
	
	public Member selectImg(String nickname);
	
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
	
	public TalkBoardPageData adminTalkBoard(int reqPage,String type);
	
	public int deleteTalkBoardLike(int no);
	
	
}

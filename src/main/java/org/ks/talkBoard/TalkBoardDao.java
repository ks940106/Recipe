package org.ks.talkBoard;

import java.util.List;

import org.ks.member.vo.Member;
import org.ks.talkBoard.vo.BoardLike;
import org.ks.talkBoard.vo.MainBoard;
import org.ks.talkBoard.vo.PrintPage;
import org.ks.talkBoard.vo.TalkBoard;
import org.ks.talkBoard.vo.TalkBoardComment;

public interface TalkBoardDao {

	public List mainBoard(PrintPage pp);
	
	public List boardType(PrintPage pp);
	
	public int insertTalkBoard(TalkBoard tb);
	
	public MainBoard selectTalkBoard(int no);
	
	public int deleteTalkBoard(int no);
	
	public int updateTalkBoard(TalkBoard tb);
	
	public List selectTalkBoardComment(int no);
	
	public int insertTalkBoardComment(TalkBoardComment tbc);
	
	public int deleteTalkBoardComment(int no);
	
	public int deleteComment(int no);
	
	public int seeUserCount();
	
	public int seeBoardTypeCount(String type);
	
	public BoardLike boardLike(BoardLike bl);
	
	public int likeClick(BoardLike bl);
	
	public int likeDelClick(BoardLike bl);
	
	public int commentCount(int no);
	
	public int likeCount(int no);
	
	public Member selectImg(String nickname);
	
	public List adminTalkBoard(PrintPage pp);
	
	public int deleteTalkBoardLike(int no);
}

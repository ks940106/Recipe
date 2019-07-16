package org.ks.talkBoard;

import java.util.List;

import org.ks.talkBoard.vo.PrintPage;
import org.ks.talkBoard.vo.TalkBoard;
import org.ks.talkBoard.vo.TalkBoardComment;

public interface TalkBoardDao {

	public List mainBoard(PrintPage pp);
	
	public List boardType(PrintPage pp);
	
	public int insertTalkBoard(TalkBoard tb);
	
	public TalkBoard selectTalkBoard(int no);
	
	public int deleteTalkBoard(int no);
	
	public int updateTalkBoard(TalkBoard tb);
	
	public List selectTalkBoardComment(int no);
	
	public int insertTalkBoardComment(TalkBoardComment tbc);
	
	public int deleteTalkBoardComment(int no);
	
	public int deleteComment(int no);
	
	public int seeUserCount();
	
	public int seeBoardTypeCount(String type);
	
}

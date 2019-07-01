package org.ks.talkBoard;

import java.util.List;

import org.ks.talkBoard.vo.TalkBoard;

public interface TalkBoardDao {

	public List mainBoard();
	
	public int insertTalkBoard(TalkBoard tb);
}

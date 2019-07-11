package org.ks.talkBoard;

import java.util.ArrayList;

import org.ks.talkBoard.vo.TalkBoard;

public interface TalkBoardService {

	public ArrayList<TalkBoard> mainBoard();

	public int insertTalkBoard(TalkBoard tb);
	
	public TalkBoard selectTalkBoard(int no);
	
	public int deleteTalkBoard(int no);
	
	public int updateTalkBoard(TalkBoard tb);
}

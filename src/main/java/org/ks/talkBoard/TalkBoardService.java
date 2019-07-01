package org.ks.talkBoard;

import java.util.ArrayList;

import org.ks.talkBoard.vo.TalkBoard;

public interface TalkBoardService {

	public ArrayList<TalkBoard> mainBoard();

	public int insertTalkBoard(TalkBoard tb);
}

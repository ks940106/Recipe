package org.ks.talkBoard;

import java.util.ArrayList;

import org.ks.talkBoard.vo.TalkBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("talkBoardService")
public class TalkBoardServiceImpl implements TalkBoardService {
	@Autowired
	@Qualifier(value="talkBoardDao")
	private TalkBoardDaoImpl talkBoardDao;

	@Override
	public ArrayList<TalkBoard> mainBoard() {
		return (ArrayList<TalkBoard>)talkBoardDao.mainBoard();
	}
	
	public int insertTalkBoard(TalkBoard tb) {
		return talkBoardDao.insertTalkBoard(tb);
	}
	
}

package org.ks.talkBoard;

import java.util.ArrayList;

import org.ks.talkBoard.vo.TalkBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

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

	@Override
	public TalkBoard selectTalkBoard(int no) {
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

}

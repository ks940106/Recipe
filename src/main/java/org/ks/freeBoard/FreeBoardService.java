package org.ks.freeBoard;

import java.util.List;

import org.ks.freeBoard.vo.FreeBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("freeBoardService")
public class FreeBoardService {
	@Autowired
	@Qualifier(value="freeBoardDao")
	private FreeBoardDao freeBoardDao;
	
	public int newBoard(FreeBoard fb) {
		return freeBoardDao.newBoard(fb);
	}
	
	public List mainBoard(int type){
		return freeBoardDao.mainBoard(type);
	}
	public FreeBoard selectBoard(int no) {
		return freeBoardDao.selectBoard(no);
	}

}

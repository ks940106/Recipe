package org.ks.talkBoard;

import java.util.List;

import org.ks.talkBoard.vo.TalkBoard;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("talkBoardDao")
public class TalkBoardDaoImpl implements TalkBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List mainBoard() {
		
		return sqlSession.selectList("mybatis.mainBoard");
	}
	
	public int insertTalkBoard(TalkBoard tb) {
		return sqlSession.update("mybatis.insertTalkBoard",tb);
	}
}

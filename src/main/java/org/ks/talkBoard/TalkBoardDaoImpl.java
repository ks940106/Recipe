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

	@Override
	public TalkBoard selectTalkBoard(int no) {
		return sqlSession.selectOne("mybatis.selectTalkBoard",no);
	}

	@Override
	public int deleteTalkBoard(int no) {
		return sqlSession.update("mybatis.deleteTalkBoard",no);
	}

	@Override
	public int updateTalkBoard(TalkBoard tb) {
		return sqlSession.update("mybatis.updateTalkBoard",tb);
	}
	
	
}

package org.ks.talkBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("talkBoardDao")
public class TalkBoardDaoImpl implements TalkBoardDao{

	@Autowired
	SqlSessionTemplate sqlsession;
	
	@Override
	public List mainBoard() {
		
		return sqlsession.selectList("mybatis.mainBoard");
	}

}

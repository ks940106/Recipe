package org.ks.freeBoard;

import java.util.List;

import org.ks.freeBoard.vo.FreeBoard;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("freeBoardDao")
public class FreeBoardDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int newBoard(FreeBoard fb) {
		return sqlSession.update("freebatis.newBoard",fb);
	}
	
	public List mainBoard(int type) {
		return sqlSession.selectList("freebatis.mainBoard",type);
	}
	public FreeBoard selectBoard(int no) {
		return sqlSession.selectOne("freebatis.selectBoard",no);
	}

}

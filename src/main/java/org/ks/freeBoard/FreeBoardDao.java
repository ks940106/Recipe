package org.ks.freeBoard;

import java.util.List;

import org.ks.freeBoard.vo.FreeBoard;
import org.ks.freeBoard.vo.FreeBoardComment;
import org.ks.freeBoard.vo.FreePrintPage;
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
	public int viewCountUp(int no) {
		return sqlSession.update("freebatis.viewCountUp",no);
	}
	
	public FreeBoard selectBoard(int no) {
		return sqlSession.selectOne("freebatis.selectBoard",no);
	}
	
	public int deleteFreeBoard(int boardNo) {
		return sqlSession.update("freebatis.deleteFreeBoard",boardNo);
	}
	public int modifyComplete(FreeBoard fb) {
		return sqlSession.update("freebatis.modifyComplete",fb);
	}
	public int freeBoardCount(int type) {
		return sqlSession.selectOne("freebatis.freeBoardCount",type);
	}
	public List mainFreeBoard(FreePrintPage fpp) {
		return sqlSession.selectList("freebatis.mainFreeBoard",fpp);
	}
	public int commentInsert(FreeBoardComment fb) {
		return sqlSession.update("freebatis.commentInsert",fb);
	}
	public List selectBoardComment(int no) {
		return sqlSession.selectList("freebatis.selectBoardComment",no);
	}
	public int commentCount(int no) {
		return sqlSession.selectOne("freebatis.commentCount",no);
	}
	public int deleteComment(int no) {
		return sqlSession.update("freebatis.deleteComment",no);
	}
	public int deleteAllComment(int no) {
		return sqlSession.update("freebatis.deleteAllComment",no);
	}
	
}

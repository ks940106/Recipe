package org.ks.talkBoard;

import java.util.List;

import org.ks.member.vo.Member;
import org.ks.talkBoard.vo.BoardLike;
import org.ks.talkBoard.vo.MainBoard;
import org.ks.talkBoard.vo.PrintPage;
import org.ks.talkBoard.vo.TalkBoard;
import org.ks.talkBoard.vo.TalkBoardComment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("talkBoardDao")
public class TalkBoardDaoImpl implements TalkBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List mainBoard(PrintPage pp) {
		return sqlSession.selectList("mybatis.mainBoard",pp);
	}
	
	@Override
	public List boardType(PrintPage pp) {
		return sqlSession.selectList("mybatis.boardType",pp);
	}
	
	public int insertTalkBoard(TalkBoard tb) {
		return sqlSession.update("mybatis.insertTalkBoard",tb);
	}

	@Override
	public MainBoard selectTalkBoard(int no) {
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

	@Override
	public List selectTalkBoardComment(int no) {
		return sqlSession.selectList("talkbatis.selectTalkBoardComment",no);
	}

	@Override
	public int insertTalkBoardComment(TalkBoardComment tbc) {
		return sqlSession.update("talkbatis.insertTalkBoardComment",tbc);
	}

	@Override
	public int deleteTalkBoardComment(int no) {
		return sqlSession.update("talkbatis.deleteTalkBoardComment",no);
	}

	@Override
	public int deleteComment(int no) {
		return sqlSession.update("talkbatis.deleteComment",no);
	}

	@Override
	public int seeUserCount() {
		return sqlSession.selectOne("mybatis.seeUserCount");
	}

	@Override
	public int seeBoardTypeCount(String type) {
		return sqlSession.selectOne("mybatis.seeBoardTypeCount",type);
	}

	@Override
	public BoardLike boardLike(BoardLike bl) {
		return sqlSession.selectOne("mybatis.boardLike",bl);
	}

	@Override
	public int likeClick(BoardLike bl) {
		return sqlSession.update("mybatis.likeClick",bl);
	}

	@Override
	public int likeDelClick(BoardLike bl) {
		return sqlSession.update("mybatis.likeDelClick",bl);
	}

	@Override
	public int commentCount(int no) {
		return sqlSession.selectOne("talkbatis.commentCount",no);
	}

	@Override
	public int likeCount(int no) {
		return sqlSession.selectOne("mybatis.likeCount",no);
	}

	@Override
	public Member selectImg(String nickname) {
		return sqlSession.selectOne("mybatis.selectImg",nickname);
	}

	@Override
	public List adminTalkBoard(PrintPage pp) {
		return sqlSession.selectList("mybatis.adminTalkBoard",pp);
	}

	@Override
	public int deleteTalkBoardLike(int no) {
		return sqlSession.update("mybatis.deleteTalkBoardLike",no);
	}

	
	
	
}

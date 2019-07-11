package org.ks.competition;

import java.util.List;

import org.ks.competition.vo.Competition;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

@Repository("competitionDaoimpl")
public class CompetitionDaoImpl implements CompetitionDao {
	@Autowired
	SqlSessionTemplate sqlsession;

	@Override
	public List competitionList() {
		return sqlsession.selectList("competition.competitionList");
	}

	@Override
	public int insertCompetition(Competition c) {
		return sqlsession.insert("competition.insertCompetition",c);
	}

	@Override
	public List competitionView(String competitionCheck) {
		return sqlsession.selectList("competition.competitionView",competitionCheck);
	}

	@Override
	public int deleteCompetition(int competitionNo) {
		return sqlsession.delete("competition.deleteCompetition",competitionNo);
	}

	@Override
	public int competitionUpdate(Competition c) {
		return sqlsession.update("competition.competitionUpdate",c);
	}

	@Override
	public Competition updateSelectOne(int competitionNo) {
		return sqlsession.selectOne("competition.updateSelectOne", competitionNo);
	}

	@Override
	public List competitionResultView(int competitionNo) {
		return sqlsession.selectList("competition.competitionResultView", competitionNo);
	}
}

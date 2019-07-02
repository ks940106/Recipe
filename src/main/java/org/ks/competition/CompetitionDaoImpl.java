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
}

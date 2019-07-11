package org.ks.competition;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List participantCheck(int competitionNo, String id) {
		Map map = new HashMap<String, String>();
		map.put("competitionNo", Integer.toString(competitionNo));
		map.put("id", id);
		return sqlsession.selectList("competition.participantCheck",map);
	}

	@Override
	public List competitionListView(int competitionNo) {
		return sqlsession.selectList("competition.competitionListView",competitionNo);
	}

	@Override
	public List participantView(int competitionNo) {
		return sqlsession.selectList("competition.participantMember",competitionNo);
	}

	/*@Override
	public List participantMember() {
		return sqlsession.selectList("competition.participantMember");
	}*/
}

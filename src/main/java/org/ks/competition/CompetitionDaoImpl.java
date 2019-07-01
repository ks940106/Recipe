package org.ks.competition;

import java.util.List;

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
}

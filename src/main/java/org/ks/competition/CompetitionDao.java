package org.ks.competition;

import java.util.List;

import org.ks.competition.vo.Competition;

public interface CompetitionDao {
	public List competitionList();
	public int insertCompetition(Competition c);
}

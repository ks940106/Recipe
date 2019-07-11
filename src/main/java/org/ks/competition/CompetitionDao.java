package org.ks.competition;

import java.util.List;

import org.ks.competition.vo.Competition;

public interface CompetitionDao {
	public List competitionList();
	public int insertCompetition(Competition c);
	public List competitionView(String competitionCheck);
	public int deleteCompetition(int competitionNo);
	public int competitionUpdate(Competition c);
	public Competition updateSelectOne(int competitionNo);
	public List competitionResultView(int competitionNo);
}

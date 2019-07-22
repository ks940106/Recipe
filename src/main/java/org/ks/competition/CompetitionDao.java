package org.ks.competition;

import java.util.List;

import org.ks.competition.vo.Competition;
import org.ks.participant.vo.Participant;

public interface CompetitionDao {
	public List competitionList(int start, int end);
	public int insertCompetition(Competition c);
	public void competitionCheckN();
	public List competitionView(String competitionCheck);
	public int deleteCompetition(int competitionNo);
	public int competitionUpdate(Competition c);
	public Competition updateSelectOne(int competitionNo);
	public List competitionResultView(int competitionNo);
	public List competitionResultViewPage(int competitionNo);
	public List participantCheck(int competitionNo, String id);
	public List competitionListView(int competitionNo);
	public List participantView(int competitionNo);
	public int participantUpdate(String checkArr, int competitionNo);
	public int participantPass(String checkPass, int competitionNo);
	public List participantPassList(int competitionNo);
	public int participantResult(String checkResult, int competitionNo);
	public List competitionMypage(String id);
	public List participantResultList(int competitionNo);
	public void setNull(int competitionNo);
	public List cpdCount();
	public int resultDelete(int competitionNo);
}

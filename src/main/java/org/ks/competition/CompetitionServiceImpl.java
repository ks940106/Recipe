package org.ks.competition;

import java.util.ArrayList;
import java.util.List;

import org.ks.competition.vo.Competition;
import org.ks.member.vo.Member;
import org.ks.participant.vo.Participant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("competitionServiceimpl")
public class CompetitionServiceImpl implements CompetitionService {
	@Autowired
	@Qualifier(value="competitionDaoimpl")
	private CompetitionDao competitionDaoimpl;

	@Override
	public ArrayList<Competition> competitionList() {
		return (ArrayList<Competition>)(competitionDaoimpl.competitionList());
	}

	@Override
	public int insertCompetition(Competition c) {
		return competitionDaoimpl.insertCompetition(c);
	}

	@Override
	public Competition competitionView(String competitionCheck) {
		List list = competitionDaoimpl.competitionView(competitionCheck);
		Competition c = null;
		if(!list.isEmpty()) {
			c = (Competition)list.get(0);
		}
		return c;
	}
	
	@Override
	public int deleteCompetition(int competitionNo) {
		return competitionDaoimpl.deleteCompetition(competitionNo);
	}
	
	@Override
	public int competitionUpdate(Competition c) {
		return competitionDaoimpl.competitionUpdate(c);
	}

	@Override
	public Competition updateSelectOne(int competitionNo) {
		return competitionDaoimpl.updateSelectOne(competitionNo);
	}

	@Override
	public Competition competitionResultView(int competitionNo) {
		List list = competitionDaoimpl.competitionResultView(competitionNo);
		Competition c = null;
		if(!list.isEmpty()) {
			c = (Competition)list.get(0);
		}
		return c;
	}

	@Override
	public Participant participantCheck(int competitionNo, String id) {
		List list = competitionDaoimpl.participantCheck(competitionNo, id);
		Participant p = null;
		if(!list.isEmpty()) {
			p = (Participant)list.get(0);
		}
		return p;
	}

	@Override
	public Competition competitionListView(int competitionNo) {
		List list = competitionDaoimpl.competitionListView(competitionNo);
		Competition c = null;
		if(!list.isEmpty()) {
			c = (Competition)list.get(0);
		}
		return c;
	}

	@Override
	public Participant participantView() {
		List list = competitionDaoimpl.participantView();
		Participant p = null;
		if(!list.isEmpty()) {
			p = (Participant)list.get(0);
		}
		return p;
	}

	@Override
	public Member participantMember() {
		List list = competitionDaoimpl.participantMember();
		Member m = null;
		if(!list.isEmpty()) {
			m = (Member)list.get(0);
		}
		return m;
	}	
}

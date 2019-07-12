package org.ks.competition;

import java.util.ArrayList;
import java.util.List;

import org.ks.competition.vo.Competition;
import org.ks.participant.vo.Participant;
import org.ks.participant.vo.ParticipantMember;
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
	public  ArrayList<ParticipantMember> participantView(int competitionNo) {
		return (ArrayList<ParticipantMember>)( competitionDaoimpl.participantView(competitionNo));
		
	}

	@Override
	public int participantUpdate(String[] checkArr, int competitionNo) {
		int result = 0;
		for(int i=0; i<checkArr.length; i++) {
			result = competitionDaoimpl.participantUpdate(checkArr[i],competitionNo); 
			System.out.println(result);
			System.out.println("ddd :"+checkArr[i]);
		}
		return result;
	}
	@Override
	public ArrayList<ParticipantMember> participantPassList(int competitionNo) {
		return (ArrayList<ParticipantMember>)(competitionDaoimpl.participantPassList(competitionNo));
	}
	@Override
	public int participantPass(String[] checkPass, int competitionNo) {
		int result = 0;
		for(int i=0; i<checkPass.length; i++) {
			result = competitionDaoimpl.participantPass(checkPass[i], competitionNo);
		}
		return result;
	}

}

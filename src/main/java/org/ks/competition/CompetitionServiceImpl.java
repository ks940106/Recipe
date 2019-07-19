package org.ks.competition;

import java.util.ArrayList;
import java.util.List;

import org.ks.competition.vo.Competition;
import org.ks.competition.vo.CompetitionPageData;
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
	public  CompetitionPageData competitionList(int reqPage) {
		int numPerPage = 10;
		List countList = competitionDaoimpl.cpdCount();
		int totalCount = countList.size();
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage +1;
		int end =  reqPage*numPerPage;
		List l = competitionDaoimpl.competitionList(start,end);
		ArrayList<Competition> list = (ArrayList<Competition>)l;
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='pageBtn' href='/competitionAdminResultList.do?reqPage="+(pageNo-1)+"'><</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class'pageSelected'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageNo' href='/competitionAdminResult.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi +="<a class='pageBtn' href='/competitionAdminResultList.do?reqPage="+pageNo+"'>></a>";
		}
		CompetitionPageData cpd = null;
		cpd = new CompetitionPageData(list,pageNavi);
		return cpd;
	}

	@Override
	public int insertCompetition(Competition c) {
		competitionDaoimpl.competitionCheckN();
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

	@Override
	public int participantResult(String checkResult, int competitionNo) {
		competitionDaoimpl.setNull(competitionNo);
		return competitionDaoimpl.participantResult(checkResult, competitionNo);
	}

	@Override
	public ParticipantMember competitionMypage(String id) {
		List list = competitionDaoimpl.competitionMypage(id);
		ParticipantMember p = null;
		if(!list.isEmpty()) {
			p = (ParticipantMember)list.get(0);
		}
		return p;
	}

	@Override
	public ArrayList<ParticipantMember> participantResultList(int competitionNo) {
		
		return (ArrayList<ParticipantMember>) (competitionDaoimpl.participantResultList(competitionNo));
	}

	@Override
	public int resultDelete(int competitionNo) {
		return competitionDaoimpl.resultDelete(competitionNo);
	}
}

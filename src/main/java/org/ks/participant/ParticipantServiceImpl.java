package org.ks.participant;

import java.util.List;

import org.ks.member.vo.Member;
import org.ks.participant.vo.Participant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("participantServiceimpl")
public class ParticipantServiceImpl implements ParticipantService{
	@Autowired
	@Qualifier(value="participantDaoimpl")
	private ParticipantDao participantDaoimpl;

	@Override
	@Transactional
	public void participantInsert(Participant vo) {
		participantDaoimpl.participantInsert(vo);		
	}


}

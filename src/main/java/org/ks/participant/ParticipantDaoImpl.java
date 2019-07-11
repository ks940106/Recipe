package org.ks.participant;

import java.util.List;

import org.ks.participant.vo.Participant;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("participantDaoimpl")
public class ParticipantDaoImpl implements ParticipantDao{
	@Autowired
	SqlSessionTemplate sqlsession;

	@Override
	public void participantInsert(Participant vo) {
		sqlsession.insert("participant.participantInsert",vo);
	}
	
	

}

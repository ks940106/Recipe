package org.ks.participant;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("participantDaoimpl")
public class ParticipantDaoImpl implements ParticipantDao{
	@Autowired
	SqlSessionTemplate sqlsession;
	
	@Override
	public List participantMemberList(String id) {
		return sqlsession.selectList("participant.participantMemberList",id);
	}

}

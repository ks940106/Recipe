package org.ks.participant;

import java.util.List;

import org.ks.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("participantServiceimpl")
public class ParticipantServiceImpl implements ParticipantService{
	@Autowired
	@Qualifier(value="participantDaoimpl")
	private ParticipantDao participantDaoimpl;

	@Override
	public Member participantMemberList(String id) {
		List list = participantDaoimpl.participantMemberList(id);
		Member m = null;
		if(!list.isEmpty()) {
			m = (Member)list.get(0);
		}
		return m;
	}
}

package org.ks.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberService {
	@Autowired
	@Qualifier(value="memberDAO")
	private MemberDAO memberDAO;
}

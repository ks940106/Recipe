package org.ks.notice.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.ks.competition.vo.Competition;
import org.ks.notice.vo.Notice;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class NoticeBefore {
	@Pointcut("execution(* org.ks.notice.*Service.*(..))")
	public void allPointCut() {
		
	}
	@AfterReturning(value="allPointCut()",returning="returnObj")
	public void beforeReplace(JoinPoint jp,Object returnObj)throws Exception{
		String methodName = jp.getSignature().getName();
		if(returnObj instanceof Competition) {
			Notice n = (Notice)returnObj;
			String con = n.getNoticeTitle().replaceAll("<", "&lt").replace("\n", "<br>");
			String con1 = n.getNoticeContent().replaceAll("<", "&lt").replace("\n", "<br>");
			System.out.println("포인트컷");
		}
	}
}

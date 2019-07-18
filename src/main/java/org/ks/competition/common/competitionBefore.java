package org.ks.competition.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.ks.competition.vo.Competition;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class competitionBefore {
	@Pointcut("execution(* org.ks.compeition.*Service.*(..))")
	public void allPointcut() {}
	
	@AfterReturning(value="allPointcut()",returning="returnObj")
	public void beforeReplace(JoinPoint jp, Object returnObj)throws Exception{
		String methodName = jp.getSignature().getName();
		System.out.println(returnObj);
		if(returnObj instanceof Competition) {
			Competition p = (Competition)returnObj;
			String con = p.getCompetitionContents().replaceAll("<", "&lt");
			String con2 = con.replace("\n", "<br>");
			System.out.println(con+"dkdkdk");
			p.setCompetitionContents(con2);
		}
	}
}

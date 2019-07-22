package org.ks.talkBoard.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.ks.participant.vo.ParticipantMember;
import org.ks.talkBoard.vo.MainBoard;
import org.ks.talkBoard.vo.TalkBoard;
import org.ks.talkBoard.vo.TalkBoardPageData;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class TalkBoardBefore {
	
	//@Pointcut("execution(* org.kh.board.service..*Service.*new*(..))")
	@Pointcut("execution(* org.ks.talkBoard.*Service.*select*(..))")
	public void allPointcut() {}
	@Pointcut("execution(* org.ks.talkBoard.*Service.*main*(..))")
	public void allPointcut2() {}
	@Pointcut("execution(* org.ks.talkBoard.*Service.*admin*(..))")
	public void allPointcut3() {}
	
//	@Before("allPointcut()")
//	public void beforePw(JoinPoint jp) throws Exception {
//		String methodName = jp.getSignature().getName();
//		Object[] args = jp.getArgs();
//		Board b = (Board)args[0];
//		String con = b.getBoardContent().replace("\n", "<br>");
//		System.out.println(con+"비포");
//		b.setBoardContent(con);
//	}
	@AfterReturning(value="allPointcut()",returning="returnObj")
	public void beforePw(JoinPoint jp,Object returnObj) throws Exception {
		String methodName = jp.getSignature().getName();
		System.out.println(returnObj);
		if(returnObj instanceof MainBoard) {
			MainBoard b = (MainBoard)returnObj;
			if(b.getBoardContents() != null) {
				
			String con = b.getBoardContents().replaceAll("<", "&lt");
		//	String con = b.replaceAll("<", "&lt");
			String con2 = con.replace("\n", "<br>");
			b.setBoardContents(con2);
			}
		}
	}
	@AfterReturning(value="allPointcut2()",returning="returnObj")
	public void beforePw2(JoinPoint jp,Object returnObj) throws Exception {
		String methodName = jp.getSignature().getName();
		System.out.println(returnObj);
		if(returnObj instanceof TalkBoardPageData) {
			TalkBoardPageData b = (TalkBoardPageData)returnObj;
			for(int i=0;i<b.getList().size();i++) {
				if(b.getList().get(i).getBoardContents() != null) {
				//String con = b.replaceAll("<", "&lt");
				String con = b.getList().get(i).getBoardContents().replaceAll("<", "&lt");
				String con2 = con.replace("\n", "<br>");
				b.getList().get(i).setBoardContents(con2);
				}
			}
		}
	}
	@AfterReturning(value="allPointcut3()",returning="returnObj")
	public void beforePw3(JoinPoint jp,Object returnObj) throws Exception {
		String methodName = jp.getSignature().getName();
		System.out.println(returnObj);
		if(returnObj instanceof TalkBoardPageData) {
			TalkBoardPageData b = (TalkBoardPageData)returnObj;
			for(int i=0;i<b.getList().size();i++) {
				if(b.getList().get(i).getBoardContents() != null) {
				//String con = b.replaceAll("<", "&lt");
				String con = b.getList().get(i).getBoardContents().replaceAll("<", "&lt");
				String con2 = con.replace("\n", "<br>");
				b.getList().get(i).setBoardContents(con2);
				}
			}
		}
	}


	
}
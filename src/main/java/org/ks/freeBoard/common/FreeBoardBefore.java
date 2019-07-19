package org.ks.freeBoard.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.ks.freeBoard.vo.FreeBoard;
import org.ks.freeBoard.vo.FreeBoardComment;
import org.ks.freeBoard.vo.FreeBoardPageData;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class FreeBoardBefore {
	
	@Pointcut("execution(* org.ks.freeBoard.*Service.*select*(..))")
	public void allPointcut() {}
	@Pointcut("execution(* org.ks.freeBoard.*Service.*main*(..))")
	public void allPointcut2() {}
	
	@AfterReturning(value="allPointcut()",returning="returnObj")
	public void beforePw(JoinPoint jp,Object returnObj) throws Exception {
		String methodName = jp.getSignature().getName();
		System.out.println(returnObj);
		if(returnObj instanceof FreeBoard) {
			FreeBoard b = (FreeBoard)returnObj;
			if(b.getContents() != null) {
			String str = b.getTitle().replaceAll("<", "&lt");
			String con = b.getContents().replaceAll("<", "&lt");
		//	String con = b.replaceAll("<", "&lt");
			String con2 = con.replace("\n", "<br>");
			b.setTitle(str);
			b.setContents(con2);
			}
		}
	}
	@AfterReturning(value="allPointcut2()",returning="returnObj")
	public void beforePw2(JoinPoint jp,Object returnObj) throws Exception {
		String methodName = jp.getSignature().getName();
		System.out.println(returnObj);
		if(returnObj instanceof FreeBoardPageData) {
			FreeBoardPageData b = (FreeBoardPageData)returnObj;
			for(int i=0;i<b.getList().size();i++) {
				if(b.getList().get(i).getContents() != null) {
				System.out.println(b.getList().get(i).getContents());
				//String con = b.replaceAll("<", "&lt");
				String str = b.getList().get(i).getTitle().replaceAll("<", "&lt");
				String con = b.getList().get(i).getContents().replaceAll("<", "&lt");
				String con2 = con.replace("\n", "<br>");
				b.getList().get(i).setTitle(str);
				b.getList().get(i).setContents(con2);
				}
				
			}
		}
	}

	
	
	
}

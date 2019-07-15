package org.ks.tmr;

import org.ks.tmr.vo.LMRPageData;
import org.ks.tmr.vo.TMRPageData;

public interface TMRService {
	public TMRPageData selectTMR(String year,String month,int reqPage);
	public void insertLMR(String year,String month);
	public LMRPageData selectLMR(int reqPage);
	public String lmrImg();
	public void updateFile(String fileName);
	
	
}

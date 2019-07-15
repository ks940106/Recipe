package org.ks.tmr;

import java.util.List;

import org.ks.tmr.vo.TMR;

public interface TMRDao {
	public List tmrCount(String year,String month);
	public List selectTMR(String year,String month,int start, int end);
	public void insertLMR(TMR tmr1,TMR tmr2,TMR tmr3);
	public List lmrCount();
	public List selectLMR(int start,int end);
	public List lmrImg();
	public void updateFile(String fileName);
	
}

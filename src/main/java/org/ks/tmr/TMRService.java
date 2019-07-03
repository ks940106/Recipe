package org.ks.tmr;

import java.util.ArrayList;

import org.ks.tmr.vo.LMRPageData;
import org.ks.tmr.vo.TMR;
import org.ks.tmr.vo.TMRPageData;

public interface TMRService {
	public TMRPageData selectTMR(String year,String month,int reqPage);
	public void insertLmr(String year,String month);
	public LMRPageData selectLMR(int reqPage);
}

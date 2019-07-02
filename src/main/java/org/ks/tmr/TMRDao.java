package org.ks.tmr;

import java.util.List;

import org.ks.tmr.vo.TMR;

public interface TMRDao {
	public List totalCount(String month);
	public List selectTMR(String month,int start, int end);
	public void insertLmr(TMR tmr, int rank);
}

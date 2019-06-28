package org.ks.tmr;

import java.util.ArrayList;

import org.ks.tmr.vo.TMR;

public interface TMRService {
	public ArrayList<TMR> selectTMR(String month);
}

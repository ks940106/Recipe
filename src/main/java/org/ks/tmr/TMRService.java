package org.ks.tmr;

import java.util.ArrayList;

import org.ks.tmr.vo.TMR;
import org.ks.tmr.vo.TMRPageData;

public interface TMRService {
	public TMRPageData selectTMR(String month,int reqPage);
}

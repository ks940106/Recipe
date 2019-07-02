package org.ks.tmr;

import java.util.List;

public interface TMRDao {
	public List selectTMR(String month,int start, int end);
	public List totalCount(String month);
	
}

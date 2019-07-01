package org.ks.tmr;

import java.util.ArrayList;
import java.util.List;

import org.ks.tmr.vo.TMR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("TMRService")
public class TMRServiceImpl implements TMRService{
	@Autowired
	@Qualifier("TMRDao")
	private TMRDao tmrdao;

	@Override
	public ArrayList<TMR> selectTMR(String month) {
		List list = tmrdao.selectTMR(month);
		return (ArrayList<TMR>)list;
	}
}

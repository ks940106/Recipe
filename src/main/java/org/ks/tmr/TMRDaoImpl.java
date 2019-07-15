package org.ks.tmr;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ks.tmr.vo.TMR;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("TMRDaoImpl")
public class TMRDaoImpl implements TMRDao{
	@Autowired
	SqlSessionTemplate sqlsession;
	
	public List tmrCount(String year,String month) { 
		Map<String,String> map = new HashMap<String,String>();
		map.put("year", year);
		map.put("month",month);
		List list = sqlsession.selectList("tmr.tmrCount",map);
		return list;
	}
	
	@Override
	public List selectTMR(String year,String month,int start, int end) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("month", month);
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(end));
		List list = sqlsession.selectList("tmr.selectTMR",map); 
		return list;
	}

	public void insertLMR(TMR tmr1,TMR tmr2,TMR tmr3) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("recipeNo1",Integer.toString(tmr1.getRecipeNo()));
		map.put("recipeTitle1", tmr1.getRecipeTitle());
		map.put("recipeWriter1", tmr1.getRecipeWriter());
		map.put("recipeNo2",Integer.toString(tmr2.getRecipeNo()));
		map.put("recipeTitle2", tmr2.getRecipeTitle());
		map.put("recipeWriter2", tmr2.getRecipeWriter());
		map.put("recipeNo3",Integer.toString(tmr3.getRecipeNo()));
		map.put("recipeTitle3", tmr3.getRecipeTitle());
		map.put("recipeWriter3", tmr3.getRecipeWriter());
		String date = new SimpleDateFormat("yy/MM/dd").format(tmr1.getRecipeDate());
		map.put("recipeDate", date);
		sqlsession.insert("tmr.insertLmr",map);
	}
	public List lmrCount() {
		List list = sqlsession.selectList("tmr.lmrCount");
		return list;
	}
	public List selectLMR(int start,int end) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		List list = sqlsession.selectList("tmr.selectLmr",map);
		return list;
	}
	public List lmrImg() {
		List list = sqlsession.selectList("tmr.lmrImg");
		return list;
	}
	public void updateFile(String fileName) {
		sqlsession.update("tmr.updateFile",fileName);
	}
	
}

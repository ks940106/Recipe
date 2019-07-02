package org.ks.tmr;

import java.sql.Date;
import java.text.SimpleDateFormat;
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
	
	public List totalCount(String month) {
		System.out.println(month);
//		List list = sqlsession.selectList("tmrBatis.totalCount", month); 
		List list = sqlsession.selectList("tmr.totalCount",month);
		return list;
	}
	
	@Override
	public List selectTMR(String month,int start, int end) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("month", month);
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(end));
		List list = sqlsession.selectList("tmr.selectTMR",map); 
		return list;
	}

	public void insertLmr(TMR tmr,int rank) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("recipeNo",Integer.toString(tmr.getRecipeNo()));
		map.put("recipeRank",Integer.toString(rank));
		String date = new SimpleDateFormat("yy/MM/dd").format(tmr.getRecipeDate());
		map.put("recipeDate", date);
		sqlsession.insert("tmr.insertLmr",map);
	}
	
}

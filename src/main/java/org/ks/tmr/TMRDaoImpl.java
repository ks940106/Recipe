package org.ks.tmr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;


@Repository("TMRDao")
public class TMRDaoImpl implements TMRDao{
	@Autowired
	SqlSessionTemplate sqlsession;
	
	public List totalCount(String month) {
		System.out.println(month);
//		List list = sqlsession.selectList("tmrBatis.totalCount", month); 
		System.out.println("DAO : "+sqlsession);
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
	
}

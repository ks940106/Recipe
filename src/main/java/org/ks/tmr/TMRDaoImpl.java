package org.ks.tmr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("TMRDao")
public class TMRDaoImpl implements TMRDao{
	@Autowired
	SqlSessionTemplate sqlsession;

	@Override
	public List selectTMR(String month,int start, int end) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("month", month);
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(end));
		List list = sqlsession.selectList("mybatis.selectTMR",map); 
		return list;
	}
	public int totalCount(String month) {
		System.out.println(month);
		List list = sqlsession.selectList("mybatis.totalCount",month); 
		return list.size();
	}
}

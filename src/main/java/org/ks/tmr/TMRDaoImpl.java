package org.ks.tmr;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("TMRDao")
public class TMRDaoImpl implements TMRDao{
	@Autowired
	SqlSessionTemplate sqlsession;

	@Override
	public List selectTMR(String month) {
		List list = sqlsession.selectList("mybatis.selectTMR",month); 
		return list;
	}
}

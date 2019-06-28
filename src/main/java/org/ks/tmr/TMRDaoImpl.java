package org.ks.tmr;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("TMRDao")
public class TMRDaoImpl implements TMRDao{
	@Autowired
	SqlSessionTemplate sqlsession;
}

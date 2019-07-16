package org.ks.caravan;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CaravanDaoImpl")
public class CaravanDaoImpl  implements CaravanDao{
	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public List seleteAllCaravanList() {
		return sqlSession.selectList("caravan.selectAllCaravanList");
	}

}

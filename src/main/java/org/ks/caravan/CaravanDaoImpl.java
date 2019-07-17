package org.ks.caravan;

import java.util.List;

import org.ks.caravan.vo.Caravan;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CaravanDaoImpl")
public class CaravanDaoImpl  implements CaravanDao{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//관리자
	@Override
	public List seleteAllCaravanList() {
		return sqlSession.selectList("caravan.selectAllCaravanList");
	}

	@Override
	public int insertCaravanList(Caravan c) {
		int result = sqlSession.insert("caravan.insertCaravanList",c);
		return result;
	}

}

package org.ks.order;

import java.util.ArrayList;

import org.ks.order.vo.Order;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("orderDaoImpl")
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public int insertOrder(Order o) {
		int result = sqlSession.update("order.insertOrder",o);
		return result;
		
	}

}

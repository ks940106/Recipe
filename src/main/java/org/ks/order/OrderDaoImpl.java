package org.ks.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int deleteCart(Order o) {
		int result = sqlSession.update("order.deleteCart",o);
		return result;
	}

	@Override
	public List seleteAllOrderList(String id) {
		
		return sqlSession.selectList("order.selectAllOrderList",id);
	}

	@Override
	public int cancellationOrder(String[] orderNo) {
		
		return sqlSession.update("order.cancellationOrder",orderNo);
	}
	//관리자
	@Override
	public List seleteAllOrderAdminList() {
		
		return sqlSession.selectList("order.seleteAllOrderAdminList");
	}

	@Override
	public int cancellationAdminOrder(String[] orderNo) {
		return sqlSession.update("order.cancellationAdminOrder",orderNo);
	}
	
	@Override
	public int successAdminOrder(String[] orderNo) {
		return sqlSession.update("order.successAdminOrder",orderNo);
	}

	@Override
	public List seletecancelAdminList(int start,int and) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(and));
		return sqlSession.selectList("order.seletecancelAdminList",map);
	}

	@Override
	public List seletecancelsuccessAdminList(int start,int and) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(and));
		return sqlSession.selectList("order.seletecancelsuccessAdminList",map);
	}

	@Override
	public List seletepaymentAdminList(int start,int and) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(and));
		return sqlSession.selectList("order.seletepaymentAdminList",map);
	}

	@Override
	public List seletepaymentSuccessAdminList(int start,int and) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", Integer.toString(start));
		map.put("end", Integer.toString(and));
		return sqlSession.selectList("order.seletepaymentSuccessAdminList",map);
	}

	@Override
	public List orderCount() {
		
		return sqlSession.selectList("order.orderCount");
	}

	@Override
	public List orderCount1() {
		return sqlSession.selectList("order.orderCount1");
	}

	@Override
	public List orderCount2() {
		return sqlSession.selectList("order.orderCount2");
	}

	@Override
	public List orderCount3() {
		return sqlSession.selectList("order.orderCount3");
	}


}

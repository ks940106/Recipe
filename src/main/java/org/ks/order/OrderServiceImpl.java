package org.ks.order;

import java.util.ArrayList;

import org.ks.order.vo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("orderServiceImpl")
public class OrderServiceImpl implements OrderService {

	@Autowired
	@Qualifier(value="orderDaoImpl")
	private OrderDao orderDaoImpl;
	
	@Transactional
	@Override
	public int insertOrder(ArrayList<Order> list) {
		
		int result = 0;
		for(Order o : list) {
			
		int re = orderDaoImpl.insertOrder(o);
			if(re>0) {
				result++;
			}
		}
		return result;
		
	}

	@Override
	public int deleteCart(ArrayList<Order> list) {
		int result = 0;
		for(Order o : list) {
			int re = orderDaoImpl.deleteCart(o);
			if(re>0) {
				result++;
			}
		}
		return result;
	}

	@Override
	public ArrayList<Order> seleteAllOrderList(String id) {
		return (ArrayList<Order>)(orderDaoImpl.seleteAllOrderList(id));
	}

	@Override
	public int cancellationOrder(String[] orderNo) {
		int result = orderDaoImpl.cancellationOrder(orderNo);
		return result;
	}

}

package org.ks.order;

import java.util.ArrayList;

import org.ks.order.vo.Order;

public interface OrderDao {
	public int insertOrder(Order o);
	public int deleteCart(Order o);
}

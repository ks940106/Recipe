package org.ks.order;

import java.util.ArrayList;
import java.util.List;

import org.ks.order.vo.Order;

public interface OrderDao {
	public int insertOrder(Order o);
	public int deleteCart(Order o);
	public List seleteAllOrderList(String id);
	public int cancellationOrder(String[] orderNo);
}

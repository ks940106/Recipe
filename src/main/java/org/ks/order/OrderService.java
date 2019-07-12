package org.ks.order;

import java.util.ArrayList;

import org.ks.order.vo.Order;

public interface OrderService {
		public int insertOrder(ArrayList<Order> list);
		public int deleteCart(ArrayList<Order> list);
		public ArrayList<Order> seleteAllOrderList(String id);
		public int cancellationOrder(String[] orderNo );
}

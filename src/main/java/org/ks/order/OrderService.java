package org.ks.order;

import java.util.ArrayList;
import java.util.List;

import org.ks.order.vo.Order;
import org.ks.order.vo.OrderPageData;

public interface OrderService {
		public int insertOrder(ArrayList<Order> list);
		public int deleteCart(ArrayList<Order> list);
		public ArrayList<Order> seleteAllOrderList(String id);
		public int cancellationOrder(String[] orderNo );
		//관리자
		public OrderPageData seleteAllOrderAdminList();
		public int cancellationAdminOrder(String[] orderNo);
		public int successAdminOrder(String[] orderNo);
		public OrderPageData seletecancelAdminList(int reqPage); //취소 요청 리스트
		public OrderPageData seletecancelsuccessAdminList(int reqPage); //취소 완료 리스트
		public OrderPageData seletepaymentAdminList(int reqPage); //결제 대기중 리스트
		public OrderPageData seletepaymentSuccessAdminList(int reqPage); //결제 완료 리스트
}

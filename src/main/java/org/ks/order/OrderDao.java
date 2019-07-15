package org.ks.order;

import java.util.ArrayList;
import java.util.List;

import org.ks.order.vo.Order;

public interface OrderDao {
	public int insertOrder(Order o);
	public int deleteCart(Order o);
	public List seleteAllOrderList(String id);
	public int cancellationOrder(String[] orderNo);
	//관리자
	public List seleteAllOrderAdminList();
	public List seletecancelAdminList(int start,int end); //취소 요청 리스트
	public List seletecancelsuccessAdminList(int start,int end); //취소 완료 리스트
	public List seletepaymentAdminList(int start,int end); //결제 대기중 리스트
	public List orderCount();//결제 대기중 페이지수 리스트
	public List orderCount1();//결제 대기중 페이지수 리스트
	public List orderCount2();//결제 대기중 페이지수 리스트
	public List orderCount3();//결제 대기중 페이지수 리스트
	
	public List seletepaymentSuccessAdminList(int start,int end); //결제 완료 리스트
	public int successAdminOrder(String[] orderNo);
	public int cancellationAdminOrder(String[] orderNo);
}

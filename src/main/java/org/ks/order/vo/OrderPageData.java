package org.ks.order.vo;

import java.util.ArrayList;

public class OrderPageData {
		private ArrayList<Order> Orderlist;
		private String pageNavi;
		public OrderPageData() {
			super();
			// TODO Auto-generated constructor stub
		}
		public OrderPageData(ArrayList<Order> orderlist, String pageNavi) {
			super();
			Orderlist = orderlist;
			this.pageNavi = pageNavi;
		}
		public ArrayList<Order> getOrderlist() {
			return Orderlist;
		}
		public void setOrderlist(ArrayList<Order> orderlist) {
			Orderlist = orderlist;
		}
		public String getPageNavi() {
			return pageNavi;
		}
		public void setPageNavi(String pageNavi) {
			this.pageNavi = pageNavi;
		}
		
		
		
}

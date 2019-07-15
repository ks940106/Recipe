package org.ks.order.vo;

import java.util.ArrayList;

public class OrderPageData2 {
		private ArrayList<Order> Orderlist1;
		private ArrayList<Order> Orderlist2;
		private ArrayList<Order> Orderlist3;
		private ArrayList<Order> Orderlist4;
		private String pageNavi1;
		private String pageNavi2;
		private String pageNavi3;
		private String pageNavi4;
		public OrderPageData2() {
			super();
			// TODO Auto-generated constructor stub
		}
		public OrderPageData2(ArrayList<Order> orderlist1, ArrayList<Order> orderlist2, ArrayList<Order> orderlist3,
				ArrayList<Order> orderlist4, String pageNavi1, String pageNavi2, String pageNavi3, String pageNavi4) {
			super();
			Orderlist1 = orderlist1;
			Orderlist2 = orderlist2;
			Orderlist3 = orderlist3;
			Orderlist4 = orderlist4;
			this.pageNavi1 = pageNavi1;
			this.pageNavi2 = pageNavi2;
			this.pageNavi3 = pageNavi3;
			this.pageNavi4 = pageNavi4;
		}
		public ArrayList<Order> getOrderlist1() {
			return Orderlist1;
		}
		public void setOrderlist1(ArrayList<Order> orderlist1) {
			Orderlist1 = orderlist1;
		}
		public ArrayList<Order> getOrderlist2() {
			return Orderlist2;
		}
		public void setOrderlist2(ArrayList<Order> orderlist2) {
			Orderlist2 = orderlist2;
		}
		public ArrayList<Order> getOrderlist3() {
			return Orderlist3;
		}
		public void setOrderlist3(ArrayList<Order> orderlist3) {
			Orderlist3 = orderlist3;
		}
		public ArrayList<Order> getOrderlist4() {
			return Orderlist4;
		}
		public void setOrderlist4(ArrayList<Order> orderlist4) {
			Orderlist4 = orderlist4;
		}
		public String getPageNavi1() {
			return pageNavi1;
		}
		public void setPageNavi1(String pageNavi1) {
			this.pageNavi1 = pageNavi1;
		}
		public String getPageNavi2() {
			return pageNavi2;
		}
		public void setPageNavi2(String pageNavi2) {
			this.pageNavi2 = pageNavi2;
		}
		public String getPageNavi3() {
			return pageNavi3;
		}
		public void setPageNavi3(String pageNavi3) {
			this.pageNavi3 = pageNavi3;
		}
		public String getPageNavi4() {
			return pageNavi4;
		}
		public void setPageNavi4(String pageNavi4) {
			this.pageNavi4 = pageNavi4;
		}
		
		
}

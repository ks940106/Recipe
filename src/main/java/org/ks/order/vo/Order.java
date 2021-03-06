package org.ks.order.vo;

public class Order {
	private int orderNo;
	private String orderCode;
	private String id;
	private String addr1;
	private String addr2;
	private int recipeNo;
	private int orderCount;
	private int orderPrice;
	private int orderState;
	private String zipCode;
	private String phone;
	private String recipeTitle;
	private String name;
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Order(int orderNo, String orderCode, String id, String addr1, String addr2, int recipeNo, int orderCount,
			int orderPrice, int orderState, String zipCode, String phone, String recipeTitle, String name) {
		super();
		this.orderNo = orderNo;
		this.orderCode = orderCode;
		this.id = id;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.recipeNo = recipeNo;
		this.orderCount = orderCount;
		this.orderPrice = orderPrice;
		this.orderState = orderState;
		this.zipCode = zipCode;
		this.phone = phone;
		this.recipeTitle = recipeTitle;
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getorderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getOrderState() {
		return orderState;
	}

	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getState() {
		if(orderState==1) {
			return "결제진행중";
		}else if(orderState==2) {
			return "결제완료";
		}else if(orderState==3) {
			return "결제취소대기중";
		}else if(orderState==4) {
			return "결제취소완료";
		}else {
			return "결제 실패";
		}
		
	}
	
}

package org.ks.cart.vo;

public class Cart {
	private int cartNo;
	private String id;
	private int recipeNo;
	private int recipePrice;
	private int recipeCount;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int cartNo, String id, int recipeNo, int recipePrice, int recipeCount) {
		super();
		this.cartNo = cartNo;
		this.id = id;
		this.recipeNo = recipeNo;
		this.recipePrice = recipePrice;
		this.recipeCount = recipeCount;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public int getRecipePrice() {
		return recipePrice;
	}
	public void setRecipePrice(int recipePrice) {
		this.recipePrice = recipePrice;
	}
	public int getRecipeCount() {
		return recipeCount;
	}
	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}
	
}

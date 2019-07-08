package org.ks.cart;

import java.util.ArrayList;

import org.ks.cart.vo.Cart;
import org.springframework.transaction.annotation.Transactional;

public interface CartService {
	public ArrayList<Cart> allListCart(String id);
	public int insertCart(Cart c);
	public ArrayList<Cart> orderListCart(String[] cartNo);
	public int deleteCart(String[] cartNo);
}

package org.ks.cart;

import java.util.ArrayList;
import java.util.List;

import org.ks.cart.vo.Cart;

public interface CartDAO {
	public List allListCart(String id);
	public int insertCart(Cart c);
	public List orderLisgCart(String[] cartNo);
}

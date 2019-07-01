package org.ks.cart;

import java.util.ArrayList;

import org.ks.cart.vo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("CartServiceImpl")
public class CartServiceImpl implements CartService {
	
	@Autowired
	@Qualifier("CartDAOImpl")
	private CartDAO CartDAOImpl;
	
	@Override
	public ArrayList<Cart> allListCart(String id) {
		
		return (ArrayList<Cart>)(CartDAOImpl.allListCart(id));
	}

	@Override
	public int insertCart(Cart c) {
		// TODO Auto-generated method stub
		return 0;
	}

}

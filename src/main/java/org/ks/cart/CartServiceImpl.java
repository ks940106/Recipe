package org.ks.cart;

import java.util.ArrayList;

import org.ks.cart.vo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("cartServiceImpl")
public class CartServiceImpl implements CartService {
	
	@Autowired
	@Qualifier(value="cartDAOImpl")
	private CartDAO cartDAOImpl;
	
	@Override
	public ArrayList<Cart> allListCart(String id) {
		
		return (ArrayList<Cart>)(cartDAOImpl.allListCart(id));
	}
	
	@Transactional
	@Override
	public int insertCart(Cart c) {
		int result=cartDAOImpl.insertCart(c);
		return result;
	}

}

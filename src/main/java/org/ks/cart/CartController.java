package org.ks.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {
	
	@RequestMapping(value="cart.do")
	public String cartView() {
		return "cart/cartList";
	}
}

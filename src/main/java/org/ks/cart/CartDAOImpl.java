package org.ks.cart;

import java.util.List;

import org.ks.cart.vo.Cart;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("cartDAOImpl")
public class CartDAOImpl implements CartDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public List allListCart(String id) {
		return sqlSession.selectList("cart.allCartList",id);
	}


	@Override
	public int insertCart(Cart c) {
		
		return sqlSession.update("cart.insertCart",c);
	}

}

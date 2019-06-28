package org.ks.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CartDAOImpl")
public class CartDAOImpl implements CartDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public List allListCart() {
		
		return sqlSession.selectList("cart.allCartList");
	}

	@Override
	public int insertCart() {
		// TODO Auto-generated method stub
		return 0;
	}

}

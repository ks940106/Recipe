package org.ks.caravan;

import java.util.List;

import org.ks.caravan.vo.Caravan;
import org.ks.caravan.vo.CaravanImg;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CaravanDaoImpl")
public class CaravanDaoImpl  implements CaravanDao{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//관리자
	@Override
	public List seleteAllCaravanList() {
		return sqlSession.selectList("caravan.selectAllCaravanList");
	}

	@Override
	public int insertCaravanList(Caravan c) {
		int result = sqlSession.insert("caravan.insertCaravanList",c);
		return result;
	}

	@Override
	public int deleteCaravanList(String[] caravanNo) {
		int result = sqlSession.delete("caravan.deleteCaravanList",caravanNo);
		return result;
	}

	@Override
	public Caravan updateCaravanList(String caravanNo) { //업데이트할 리스트조회
		
		return sqlSession.selectOne("caravan.updateCaravanList",caravanNo);
	}

	@Override
	public List selectRepresentationCaravan() { //대표카라반 조회
		
		return sqlSession.selectList("caravan.selectRepresentationCaravan");
	}

	@Override
	public CaravanImg updaterepresentationCaravan(String caravanNo) {//카라판 대표 수정 조회
		
		return sqlSession.selectOne("caravan.updaterepresentationCaravan",caravanNo);
	}

	@Override
	public int updateInsertCaravan(CaravanImg cImg) {
		int result = sqlSession.update("caravan.updateInsertCaravan",cImg);
		return result;
	}
	//사용자
	@Override
	public CaravanImg selectCaravanA() {
		
		return sqlSession.selectOne("caravan.selectCaravanA");
	}

	@Override
	public CaravanImg selectCaravanB() {
		return sqlSession.selectOne("caravan.selectCaravanB");
	}

	@Override
	public CaravanImg selectCaravanC() {
		return sqlSession.selectOne("caravan.selectCaravanC");
	}

}

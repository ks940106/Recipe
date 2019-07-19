package org.ks.caravan;

import java.util.ArrayList;

import org.ks.caravan.vo.Caravan;
import org.ks.caravan.vo.CaravanImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("CaravanServiceImpl")
public class CaravanServiceImpl implements CaravanService{
	
	@Autowired
	@Qualifier(value="CaravanDaoImpl")
	public CaravanDao CaravanDaoImpl;
	
	//관리자
	@Override
	public ArrayList<Caravan> seleteAllCaravanList() {
		
		return (ArrayList<Caravan>)(CaravanDaoImpl.seleteAllCaravanList());
	}
	@Override
	public int insertCaravanList(Caravan c) {
		int result = CaravanDaoImpl.insertCaravanList(c);
		return result;
	}
	@Override
	public int deleteCaravanList(String[] caravanNo) {
		int result = CaravanDaoImpl.deleteCaravanList(caravanNo);
		return result;
	}
	@Override
	public Caravan updateCaravanList(String caravanNo) {
		
		return 	CaravanDaoImpl.updateCaravanList(caravanNo);
	}
	@Override
	public ArrayList<Caravan> selectRepresentationCaravan() { //대표 카라반 조회
		
		return (ArrayList<Caravan>)(CaravanDaoImpl.selectRepresentationCaravan());
	}
	@Override
	public CaravanImg updaterepresentationCaravan(String caravanNo) { //카라반 대표 조회 수정
		
		return CaravanDaoImpl.updaterepresentationCaravan(caravanNo);
	}
	@Override
	public int updateInsertCaravan(CaravanImg cImg) {
		int result = CaravanDaoImpl.updateInsertCaravan(cImg);
		return result;
	}
	//사용자 
	@Override
	public CaravanImg selectCaravanA() {
		
		return CaravanDaoImpl.selectCaravanA();
	}
	@Override
	public CaravanImg selectCaravanB() {
		return CaravanDaoImpl.selectCaravanB();
	}
	@Override
	public CaravanImg selectCaravanC() {
		return CaravanDaoImpl.selectCaravanC();
	}

}

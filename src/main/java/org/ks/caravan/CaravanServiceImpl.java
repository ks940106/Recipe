package org.ks.caravan;

import java.util.ArrayList;

import org.ks.caravan.vo.Caravan;
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

}

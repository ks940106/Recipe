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
	@Override
	public ArrayList<Caravan> seleteAllCaravanList() {
		
		return (ArrayList<Caravan>)(CaravanDaoImpl.seleteAllCaravanList());
	}

}

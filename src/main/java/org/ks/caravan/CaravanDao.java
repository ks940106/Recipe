package org.ks.caravan;

import java.util.ArrayList;
import java.util.List;

import org.ks.caravan.vo.Caravan;
import org.ks.caravan.vo.CaravanImg;

public interface CaravanDao {
	public List seleteAllCaravanList();
	public List selectRepresentationCaravan();
	public int insertCaravanList(Caravan c);
	public int deleteCaravanList(String[] caravanNo);
	public Caravan updateCaravanList(String caravanNo);
	public CaravanImg updaterepresentationCaravan(String caravanNo);
	public int updateInsertCaravan(CaravanImg cImg);
}

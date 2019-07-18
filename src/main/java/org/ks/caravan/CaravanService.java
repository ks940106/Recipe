package org.ks.caravan;

import java.util.ArrayList;

import org.ks.caravan.vo.Caravan;
import org.ks.caravan.vo.CaravanImg;

public interface CaravanService {
	public ArrayList<Caravan> seleteAllCaravanList();
	public ArrayList<Caravan> selectRepresentationCaravan();
	public int insertCaravanList(Caravan c);
	public int deleteCaravanList(String[] caravanNo);
	public Caravan updateCaravanList(String caravanNo);
	public CaravanImg updaterepresentationCaravan(String caravanNo);
	public int updateInsertCaravan(CaravanImg cImg);
}

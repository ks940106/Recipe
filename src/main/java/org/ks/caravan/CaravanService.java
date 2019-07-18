package org.ks.caravan;

import java.util.ArrayList;

import org.ks.caravan.vo.Caravan;

public interface CaravanService {
	public ArrayList<Caravan> seleteAllCaravanList();
	public int insertCaravanList(Caravan c);
	public int deleteCaravanList(String[] caravanNo);
	public Caravan updateCaravanList(String caravanNo);
}

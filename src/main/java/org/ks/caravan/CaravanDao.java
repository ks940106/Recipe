package org.ks.caravan;

import java.util.List;

import org.ks.caravan.vo.Caravan;

public interface CaravanDao {
	public List seleteAllCaravanList();
	public int insertCaravanList(Caravan c);
	public int deleteCaravanList(String[] caravanNo);
	public Caravan updateCaravanList(String caravanNo);
}

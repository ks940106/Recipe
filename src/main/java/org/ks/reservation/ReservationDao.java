package org.ks.reservation;

import java.util.List;

import org.ks.reservation.vo.Reservation;

public interface ReservationDao {
	public List selectReservation(String[] reservationDate);
	public List selectOneCaravan(int caravanNo);
	public void insertReservation(Reservation r);
	public List selectMypageReservation(String id);
	public void cancelReservation(String reservationId);
	public List selectAllReservation();
	public void reservationUpdate(String reservationId,String reservationState);
}

package org.ks.reservation.vo;

import java.sql.Date;

public class Reservation {
	private int reservationNo;
	private int caravanNo;
	private String id;
	private int totalCost;
	private String reservationDate;
	private Date enrollDate;
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(int reservationNo, int caravanNo, String id, int totalCost, String reservationDate,
			Date enrollDate) {
		super();
		this.reservationNo = reservationNo;
		this.caravanNo = caravanNo;
		this.id = id;
		this.totalCost = totalCost;
		this.reservationDate = reservationDate;
		this.enrollDate = enrollDate;
	}
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public int getCaravanNo() {
		return caravanNo;
	}
	public void setCaravanNo(int caravanNo) {
		this.caravanNo = caravanNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
}

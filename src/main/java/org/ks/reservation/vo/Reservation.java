package org.ks.reservation.vo;

import java.sql.Date;

public class Reservation {
	private String reservationId;
	private int caravanNo;
	private String id;
	private int reservationPeople;
	private int totalCost;
	private String reservationDate;
	private String reservationName;
	private String reservationBirth;
	private String reservationPhone;
	private String reservationEmail;
	private String reservationRequest;
	private Date enrollDate;
	private int reservationState;
	
	
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Reservation(String reservationId, int caravanNo, String id, int reservationPeople, int totalCost,
			String reservationDate, String reservationName, String reservationBirth, String reservationPhone,
			String reservationEmail, String reservationRequest, Date enrollDate, int reservationState) {
		super();
		this.reservationId = reservationId;
		this.caravanNo = caravanNo;
		this.id = id;
		this.reservationPeople = reservationPeople;
		this.totalCost = totalCost;
		this.reservationDate = reservationDate;
		this.reservationName = reservationName;
		this.reservationBirth = reservationBirth;
		this.reservationPhone = reservationPhone;
		this.reservationEmail = reservationEmail;
		this.reservationRequest = reservationRequest;
		this.enrollDate = enrollDate;
		this.reservationState = reservationState;
	}

	
	public String getReservationId() {
		return reservationId;
	}


	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
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


	public int getReservationPeople() {
		return reservationPeople;
	}


	public void setReservationPeople(int reservationPeople) {
		this.reservationPeople = reservationPeople;
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


	public String getReservationName() {
		return reservationName;
	}


	public void setReservationName(String reservationName) {
		this.reservationName = reservationName;
	}


	public String getReservationBirth() {
		return reservationBirth;
	}


	public void setReservationBirth(String reservationBirth) {
		this.reservationBirth = reservationBirth;
	}


	public String getReservationPhone() {
		return reservationPhone;
	}


	public void setReservationPhone(String reservationPhone) {
		this.reservationPhone = reservationPhone;
	}


	public String getReservationEmail() {
		return reservationEmail;
	}


	public void setReservationEmail(String reservationEmail) {
		this.reservationEmail = reservationEmail;
	}


	public String getReservationRequest() {
		return reservationRequest;
	}


	public void setReservationRequest(String reservationRequest) {
		this.reservationRequest = reservationRequest;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public int getReservationState() {
		return reservationState;
	}


	public void setReservationState(int reservationState) {
		this.reservationState = reservationState;
	}


	public String[] getReservationDateArr(){
		String[] arr = reservationDate.split(",");
		return arr;
	}
}

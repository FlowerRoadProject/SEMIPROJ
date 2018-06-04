package com.fr.jsp.admin.model.vo;

import java.sql.Timestamp;

public class AdminOrder {
	
	private String orderNum;
	private String memberName;
	private String productName;
	private Timestamp orderedDate;
	private Timestamp reservationDate;
	private String receiverName;
	private String receiverAddress;
	private String receiverPhone;
	private String orderStateName;
	private int productAmount;
	private String deliveryMessage;
	private String anonymousDelivery;
	
	public AdminOrder() {
		super();
	}
	public AdminOrder(String orderNum, String memberName, String productName, Timestamp orderedDate,
			Timestamp reservationDate, String receiverName, String receiverAddress, String receiverPhone,
			String orderStateName, int productAmount, String deliveryMessage, String anonymousDelivery) {
		super();
		this.orderNum = orderNum;
		this.memberName = memberName;
		this.productName = productName;
		this.orderedDate = orderedDate;
		this.reservationDate = reservationDate;
		this.receiverName = receiverName;
		this.receiverAddress = receiverAddress;
		this.receiverPhone = receiverPhone;
		this.orderStateName = orderStateName;
		this.productAmount = productAmount;
		this.deliveryMessage = deliveryMessage;
		this.anonymousDelivery = anonymousDelivery;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Timestamp getOrderedDate() {
		return orderedDate;
	}
	public void setOrderedDate(Timestamp orderedDate) {
		this.orderedDate = orderedDate;
	}
	public Timestamp getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Timestamp reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getOrderStateName() {
		return orderStateName;
	}
	public void setOrderStateName(String orderStateName) {
		this.orderStateName = orderStateName;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public String getDeliveryMessage() {
		return deliveryMessage;
	}
	public void setDeliveryMessage(String deliveryMessage) {
		this.deliveryMessage = deliveryMessage;
	}
	public String getAnonymousDelivery() {
		return anonymousDelivery;
	}
	public void setAnonymousDelivery(String anonymousDelivery) {
		this.anonymousDelivery = anonymousDelivery;
	}
	
}

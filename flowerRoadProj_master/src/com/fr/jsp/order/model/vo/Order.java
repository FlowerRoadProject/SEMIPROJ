package com.fr.jsp.order.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class Order implements Serializable{



private static final long serialVersionUID = 98244587L;

private String order_num;
private String member_num;
private String product_num;	
private Timestamp ordered_date;
private Timestamp reservation_date;
private String receiver_name;
private String receiver_address;
private String receiver_phone;
private String order_state_code;
private String anonymous_delivery;
private String delivery_message;
private int quantity;


public Order(String order_num, String product_num, int quantity) {
	super();
	this.order_num = order_num;
	this.product_num = product_num;
	this.quantity = quantity;
}





public Order(String member_num, Timestamp reservation_date, String receiver_name, String receiver_address,
		String receiver_phone, String anonymous_delivery, String delivery_message) {
	super();
	this.member_num = member_num;
	this.reservation_date = reservation_date;
	this.receiver_name = receiver_name;
	this.receiver_address = receiver_address;
	this.receiver_phone = receiver_phone;
	this.anonymous_delivery = anonymous_delivery;
	this.delivery_message = delivery_message;
}





public Order(String order_num, String member_num, String product_num, Timestamp ordered_date,
		Timestamp reservation_date, String receiver_name, String receiver_address, String receiver_phone,
		String order_state_code, String anonymous_delivery, String delivery_message,int quantity) {
	
	super();
	this.order_num = order_num;
	this.member_num = member_num;
	this.product_num = product_num;
	this.ordered_date = ordered_date;
	this.reservation_date = reservation_date;
	this.receiver_name = receiver_name;
	this.receiver_address = receiver_address;
	this.receiver_phone = receiver_phone;
	this.order_state_code = order_state_code;
	this.anonymous_delivery = anonymous_delivery;
	this.delivery_message = delivery_message;
	this.quantity= quantity;
}

public Order(String member_num, String product_num, Timestamp reservation_date, String receiver_name,
		String receiver_address, String receiver_phone,String anonymous_delivery, String delivery_message, int quantity) {
	super();
	this.member_num = member_num;
	this.product_num = product_num;
	this.reservation_date = reservation_date;
	this.receiver_name = receiver_name;
	this.receiver_address = receiver_address;
	this.receiver_phone = receiver_phone;
	this.anonymous_delivery = anonymous_delivery;
	this.delivery_message = delivery_message;
	this.quantity = quantity;
}



public Order() {
	super();
	// TODO Auto-generated constructor stub
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}

public String getAnonymous_delivery() {
	return anonymous_delivery;
}

public void setAnonymous_delivery(String anonymous_delivery) {
	this.anonymous_delivery = anonymous_delivery;
}

public String getDelivery_message() {
	return delivery_message;
}

public void setDelivery_message(String delivery_message) {
	this.delivery_message = delivery_message;
}

public String getOrder_num() {
	return order_num;
}
public void setOrder_num(String order_num) {
	this.order_num = order_num;
}
public String getMember_num() {
	return member_num;
}
public void setMember_num(String member_num) {
	this.member_num = member_num;
}
public String getProduct_num() {
	return product_num;
}
public void setProduct_num(String product_num) {
	this.product_num = product_num;
}
public Timestamp getOrdered_date() {
	return ordered_date;
}
public void setOrdered_date(Timestamp ordered_date) {
	this.ordered_date = ordered_date;
}
public Timestamp getReservation_date() {
	return reservation_date;
}
public void setReservation_date(Timestamp reservation_date) {
	this.reservation_date = reservation_date;
}
public String getReceiver_name() {
	return receiver_name;
}
public void setReceiver_name(String receiver_name) {
	this.receiver_name = receiver_name;
}
public String getReceiver_address() {
	return receiver_address;
}
public void setReceiver_address(String receiver_address) {
	this.receiver_address = receiver_address;
}
public String getReceiver_phone() {
	return receiver_phone;
}
public void setReceiver_phone(String receiver_phone) {
	this.receiver_phone = receiver_phone;
}
public String getOrder_state_code() {
	return order_state_code;
}
public void setOrder_state_code(String order_state_code) {
	this.order_state_code = order_state_code;
}


/*this.member_num = member_num;
this.product_num = product_num;
this.reservation_date = reservation_date;
this.receiver_name = receiver_name;
this.receiver_address = receiver_address;
this.receiver_phone = receiver_phone;*/
	






}

package com.fr.jsp.order.model.vo;

import java.util.Date;

public class MyPage_Order {
	// 변수
	   private String order_num;
	   private String member_num;
	   private String product_num;
	   private String product_name;
	   private int product_cost;
	   private Date ordered_date;
	   private Date reservation_date;
	   private String receiver_name;
	   private String receiver_address;
	   private String receiver_phone;
	   private String order_state_code;
	   private String anonymous_delivery;
	   
	 // 생성자
	   public MyPage_Order(){}

	
	 // 메소드
	   
	   
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

		public int getProduct_cost() {
			return product_cost;
		}

		public void setProduct_cost(int product_cost) {
			this.product_cost = product_cost;
		}

		public Date getOrdered_date() {
			return ordered_date;
		}

		public void setOrdered_date(Date ordered_date) {
			this.ordered_date = ordered_date;
		}

		public Date getReservation_date() {
			return reservation_date;
		}

		public void setReservation_date(Date reservation_date) {
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


		public String getAnonymous_delivery() {
			return anonymous_delivery;
		}


		public void setAnonymous_delivery(String anonymous_delivery) {
			this.anonymous_delivery = anonymous_delivery;
		}


		public String getProduct_name() {
			return product_name;
		}


		public void setProduct_name(String product_name) {
			this.product_name = product_name;
		}

		
		
}

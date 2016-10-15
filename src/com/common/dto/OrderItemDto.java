package com.common.dto;

import com.common.domain.Medicine;
import com.common.domain.Order;

public class OrderItemDto {
	private String id;
	private Medicine medicine;
	private Order order;
	private Integer number;
	private double amount;
	@Override
	public String toString() {
		return "OrderItemDto [id=" + id + ", medicine=" + medicine + ", order="
				+ order + ", number=" + number + ", amount=" + amount + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Medicine getMedicine() {
		return medicine;
	}
	public void setMedicine(Medicine medicine) {
		this.medicine = medicine;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
}

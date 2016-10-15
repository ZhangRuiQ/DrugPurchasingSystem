package com.common.dto;

import java.util.Date;

import com.common.domain.Hospital;

public class OrderDto {
	private String id;
	private String hospitalId;
	private String order_Time;
	private double amount;
	private int status;
	private String return_Time;
	private String return_Reason;
	@Override
	public String toString() {
		return "OrderDto [id=" + id + ", hospitalId=" + hospitalId
				+ ", order_Time=" + order_Time + ", amount=" + amount
				+ ", status=" + status + ", return_Time=" + return_Time
				+ ", return_Reason=" + return_Reason + "]";
	}
	public String getId() {
		return id;
	}
	public String getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(String hospitalId) {
		this.hospitalId = hospitalId;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getOrder_Time() {
		return order_Time;
	}
	public void setOrder_Time(String order_Time) {
		this.order_Time = order_Time;
	}
	public String getReturn_Time() {
		return return_Time;
	}
	public void setReturn_Time(String return_Time) {
		this.return_Time = return_Time;
	}
	public String getReturn_Reason() {
		return return_Reason;
	}
	public void setReturn_Reason(String return_Reason) {
		this.return_Reason = return_Reason;
	}
	
}

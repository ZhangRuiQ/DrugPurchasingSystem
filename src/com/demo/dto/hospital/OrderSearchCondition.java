package com.demo.dto.hospital;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderSearchCondition {
	private String id;
	private String beginorder_Time;
	private String endorder_Time;
	public String getId() {
		return id;
	}
	public OrderSearchCondition(String id, String beginorder_Time,
			String endorder_Time, String pricesort, int status) {
		super();
		this.id = id;
		this.beginorder_Time = beginorder_Time;
		this.endorder_Time = endorder_Time;
		this.pricesort = pricesort;
		this.status = status;
	}
	public OrderSearchCondition() {
		super();
		String date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		this.id ="";
		this.beginorder_Time = date+" 00:00:00";
		this.endorder_Time = date+" 23:59:59";
		this.pricesort = "asc";
		this.status = -1;
	}
	

	
	public void setId(String id) {
		this.id = id;
	}
	public String getBeginorder_Time() {
		return beginorder_Time;
	}
	public void setBeginorder_Time(String beginorder_Time) throws ParseException {
		this.beginorder_Time = beginorder_Time+" 00:00:00";
	}
	public String getEndorder_Time() {
		return endorder_Time;
	}
	public void setEndorder_Time(String endorder_Time) throws ParseException {
		this.endorder_Time = endorder_Time+" 23:59:59";
	}
	public String getPricesort() {
		return pricesort;
	}
	public void setPricesort(String pricesort) {
		this.pricesort = pricesort;
	}
	@Override
	public String toString() {
		return "OrderSearchCondition [id=" +id+ ", beginorder_Time="
				+beginorder_Time+ ", endorder_Time=" +endorder_Time+ ", pricesort=" + pricesort + ", status=" + status + "]";
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	private String	pricesort;// 
	private int status;
}

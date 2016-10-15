package com.demo.dto.hospital;

public class MedicineSearchCondition {
	private String number;//
	private	String	name;//
	private String	pricesort;// 
	private String manufacturerName;//
	private String status;
	private	String	type;
	public MedicineSearchCondition() {
		// TODO Auto-generated constructor stub
	}
	
	public MedicineSearchCondition(String number, String name,
			String pricesort, String manufacturerName, String status,
			String type) {
		super();
		this.number = number;
		this.name = name;
		this.pricesort = pricesort;
		this.manufacturerName = manufacturerName;
		this.status = status;
		this.type = type;
	}

	public String getNumber() {
		return number;
	}
	public String getManufacturerName() {
		return manufacturerName;
	}
	public void setManufacturerName(String manufacturerName) {
		this.manufacturerName = manufacturerName;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPricesort() {
		return pricesort;
	}
	public void setPricesort(String pricesort) {
		this.pricesort = pricesort;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "MedicineSearchCondition [number=" + number + ", name=" + name
				+ ", pricesort=" + pricesort + ", manufacturerName="
				+ manufacturerName + ", status=" + status + ", type=" + type
				+ "]";
	}
	

}

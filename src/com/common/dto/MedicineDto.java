package com.common.dto;

import com.common.domain.Manufacturer;

public class MedicineDto {
	private String number;
	private Manufacturer manufacturer;
	private String name;
	private String type;
	private String standard;
	private String stock_Balance;
	private double price;
	private String status;
	@Override
	public String toString() {
		return "MedicineDto [number=" + number + ", manufacturer="
				+ manufacturer + ", name=" + name + ", type=" + type
				+ ", standard=" + standard + ", stock_Balance=" + stock_Balance
				+ ", price=" + price + ", status=" + status + "]";
	}
	public String getNumber() {
		return number;
	}
	public String getStock_Balance() {
		return stock_Balance;
	}
	public void setStock_Balance(String stock_Balance) {
		this.stock_Balance = stock_Balance;
	}
	public String getName() {
		return name;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Manufacturer getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}

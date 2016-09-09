package com.common.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * Medicine entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "medicine", catalog = "bcps")
public class Medicine implements java.io.Serializable {

	// Fields

	private Integer number;
	private OrderItem orderItem;
	private Manufacturer manufacturer;
	private String name;
	private String type;
	private String standard;
	private String stockBalance;
	private double price;
	private String status;

	// Constructors

	/** default constructor */
	public Medicine() {
	}

	/** full constructor */
	public Medicine(OrderItem orderItem, Manufacturer manufacturer,
			String name, String type, String standard, String stockBalance,
			double price, String status) {
		this.orderItem = orderItem;
		this.manufacturer = manufacturer;
		this.name = name;
		this.type = type;
		this.standard = standard;
		this.stockBalance = stockBalance;
		this.price = price;
		this.status = status;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "number", unique = true, nullable = false)
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public OrderItem getOrderItem() {
		return this.orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "manufacturerId", nullable = false)
	public Manufacturer getManufacturer() {
		return this.manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

	@Column(name = "name", nullable = false, length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "type", nullable = false, length = 45)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "standard", nullable = false, length = 45)
	public String getStandard() {
		return this.standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	@Column(name = "stock_balance", nullable = false, length = 45)
	public String getStockBalance() {
		return this.stockBalance;
	}

	public void setStockBalance(String stockBalance) {
		this.stockBalance = stockBalance;
	}

	@Column(name = "price", nullable = false, precision = 22, scale = 0)
	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Column(name = "status", nullable = false, length = 45)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
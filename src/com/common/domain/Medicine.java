package com.common.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * Medicine entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "medicine", catalog = "bcps")
public class Medicine implements java.io.Serializable {

	// Fields

	private String number;
	private Manufacturer manufacturer;
	private String name;
	private String type;
	private String standard;
	private String stockBalance;
	private double price;
	private String status;
	private Set<OrderItem> orderItems = new HashSet<OrderItem>(0);

	// Constructors

	/** default constructor */
	public Medicine() {
	}

	/** minimal constructor */
	public Medicine(Manufacturer manufacturer, String name, String type,
			String standard, String stockBalance, double price, String status) {
		this.manufacturer = manufacturer;
		this.name = name;
		this.type = type;
		this.standard = standard;
		this.stockBalance = stockBalance;
		this.price = price;
		this.status = status;
	}

	/** full constructor */
	public Medicine(Manufacturer manufacturer, String name, String type,
			String standard, String stockBalance, double price, String status,
			Set<OrderItem> orderItems) {
		this.manufacturer = manufacturer;
		this.name = name;
		this.type = type;
		this.standard = standard;
		this.stockBalance = stockBalance;
		this.price = price;
		this.status = status;
		this.orderItems = orderItems;
	}

	// Property accessors
	@Id
	@Column(name = "number", unique = true, nullable = false, length = 45)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
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

	@Column(name = "\"type\"", nullable = false, length = 45)
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "medicine")
	public Set<OrderItem> getOrderItems() {
		return this.orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

}
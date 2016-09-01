package com.common.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * Medicinal entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "medicinal", catalog = "bcps")
public class Medicinal implements java.io.Serializable {

	// Fields

	private Integer number;
	private OrderItem orderItem;
	private String name;
	private String type;
	private String standard;
	private String stockBalance;
	private Integer supplierId;
	private double price;
	private String status;
	private Integer manufacturerId;
	private Supplier supplier;
	private Manufacturer manufacturer;

	// Constructors

	/** default constructor */
	public Medicinal() {
	}

	/** minimal constructor */
	public Medicinal(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	/** full constructor */
	public Medicinal(OrderItem orderItem, String name, String type,
			String standard, String stockBalance, Integer supplierId,
			double price, String status, Integer manufacturerId,
			Supplier supplier, Manufacturer manufacturer) {
		this.orderItem = orderItem;
		this.name = name;
		this.type = type;
		this.standard = standard;
		this.stockBalance = stockBalance;
		this.supplierId = supplierId;
		this.price = price;
		this.status = status;
		this.manufacturerId = manufacturerId;
		this.supplier = supplier;
		this.manufacturer = manufacturer;
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

	@Column(name = "name", length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "type", length = 45)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "standard", length = 45)
	public String getStandard() {
		return this.standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	@Column(name = "stock_balance", length = 45)
	public String getStockBalance() {
		return this.stockBalance;
	}

	public void setStockBalance(String stockBalance) {
		this.stockBalance = stockBalance;
	}

	@Column(name = "supplierId")
	public Integer getSupplierId() {
		return this.supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	@Column(name = "price", precision = 22, scale = 0)
	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Column(name = "status", length = 45)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "manufacturerId")
	public Integer getManufacturerId() {
		return this.manufacturerId;
	}

	public void setManufacturerId(Integer manufacturerId) {
		this.manufacturerId = manufacturerId;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "medicinal")
	public Supplier getSupplier() {
		return this.supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "medicinal")
	public Manufacturer getManufacturer() {
		return this.manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

}
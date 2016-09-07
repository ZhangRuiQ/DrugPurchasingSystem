package com.common.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * OrderItem entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "order_item", catalog = "bcps")
public class OrderItem implements java.io.Serializable {

	// Fields

	private String id;
	private Order order;
	private Integer medicineId;
	private Integer number;
	private double amount;
	private Medicine medicine;

	// Constructors

	/** default constructor */
	public OrderItem() {
	}

	/** minimal constructor */
	public OrderItem(Order order, Integer medicineId, Integer number,
			double amount) {
		this.order = order;
		this.medicineId = medicineId;
		this.number = number;
		this.amount = amount;
	}

	/** full constructor */
	public OrderItem(Order order, Integer medicineId, Integer number,
			double amount, Medicine medicine) {
		this.order = order;
		this.medicineId = medicineId;
		this.number = number;
		this.amount = amount;
		this.medicine = medicine;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false, length = 45)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order", nullable = false)
	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Column(name = "medicineId", nullable = false)
	public Integer getMedicineId() {
		return this.medicineId;
	}

	public void setMedicineId(Integer medicineId) {
		this.medicineId = medicineId;
	}

	@Column(name = "number", nullable = false)
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "amount", nullable = false, precision = 22, scale = 0)
	public double getAmount() {
		return this.amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "orderItem")
	public Medicine getMedicine() {
		return this.medicine;
	}

	public void setMedicine(Medicine medicine) {
		this.medicine = medicine;
	}

}
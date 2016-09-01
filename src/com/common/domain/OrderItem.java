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
	private Integer mediumId;
	private Integer number;
	private double amount;
	private Medicinal medicinal;

	// Constructors

	/** default constructor */
	public OrderItem() {
	}

	/** full constructor */
	public OrderItem(Order order, Integer mediumId, Integer number,
			double amount, Medicinal medicinal) {
		this.order = order;
		this.mediumId = mediumId;
		this.number = number;
		this.amount = amount;
		this.medicinal = medicinal;
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
	@JoinColumn(name = "order")
	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Column(name = "mediumId")
	public Integer getMediumId() {
		return this.mediumId;
	}

	public void setMediumId(Integer mediumId) {
		this.mediumId = mediumId;
	}

	@Column(name = "number")
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Column(name = "amount", precision = 22, scale = 0)
	public double getAmount() {
		return this.amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "orderItem")
	public Medicinal getMedicinal() {
		return this.medicinal;
	}

	public void setMedicinal(Medicinal medicinal) {
		this.medicinal = medicinal;
	}

}
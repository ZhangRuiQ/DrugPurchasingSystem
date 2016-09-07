package com.common.domain;

import java.util.Date;
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

/**
 * Order entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "order", catalog = "bcps")
public class Order implements java.io.Serializable {

	// Fields

	private String id;
	private Hospital hospital;
	private Date orderTime;
	private double amount;
	private Integer status;
	private Date returnTime;
	private String returnReason;
	private Set<OrderItem> orderItems = new HashSet<OrderItem>(0);

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Hospital hospital, Date orderTime, double amount,
			Integer status) {
		this.hospital = hospital;
		this.orderTime = orderTime;
		this.amount = amount;
		this.status = status;
	}

	/** full constructor */
	public Order(Hospital hospital, Date orderTime, double amount,
			Integer status, Date returnTime, String returnReason,
			Set<OrderItem> orderItems) {
		this.hospital = hospital;
		this.orderTime = orderTime;
		this.amount = amount;
		this.status = status;
		this.returnTime = returnTime;
		this.returnReason = returnReason;
		this.orderItems = orderItems;
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
	@JoinColumn(name = "hospitalId", nullable = false)
	public Hospital getHospital() {
		return this.hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	@Column(name = "order_time", nullable = false, length = 19)
	public Date getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	@Column(name = "amount", nullable = false, precision = 22, scale = 0)
	public double getAmount() {
		return this.amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "return_time", length = 19)
	public Date getReturnTime() {
		return this.returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	@Column(name = "return_reason", length = 45)
	public String getReturnReason() {
		return this.returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "order")
	public Set<OrderItem> getOrderItems() {
		return this.orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

}
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
 * Manufacturer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "manufacturer", catalog = "bcps")
public class Manufacturer implements java.io.Serializable {

	// Fields

	private Integer number;
	private Medicinal medicinal;
	private String address;
	private String phone;

	// Constructors

	/** default constructor */
	public Manufacturer() {
	}

	/** minimal constructor */
	public Manufacturer(Medicinal medicinal) {
		this.medicinal = medicinal;
	}

	/** full constructor */
	public Manufacturer(Medicinal medicinal, String address, String phone) {
		this.medicinal = medicinal;
		this.address = address;
		this.phone = phone;
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
	public Medicinal getMedicinal() {
		return this.medicinal;
	}

	public void setMedicinal(Medicinal medicinal) {
		this.medicinal = medicinal;
	}

	@Column(name = "address", length = 45)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone", length = 45)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
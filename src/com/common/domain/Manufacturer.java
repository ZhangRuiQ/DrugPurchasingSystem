package com.common.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Manufacturer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "manufacturer", catalog = "bcps")
public class Manufacturer implements java.io.Serializable {

	// Fields

	private String number;
	private String address;
	private String phone;
	private String name;
	private Set<Medicine> medicines = new HashSet<Medicine>(0);

	// Constructors

	/** default constructor */
	public Manufacturer() {
	}

	/** minimal constructor */
	public Manufacturer(String address, String phone, String name) {
		this.address = address;
		this.phone = phone;
		this.name = name;
	}

	/** full constructor */
	public Manufacturer(String address, String phone, String name,
			Set<Medicine> medicines) {
		this.address = address;
		this.phone = phone;
		this.name = name;
		this.medicines = medicines;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "number", unique = true, nullable = false, length = 45)
	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Column(name = "address", nullable = false, length = 45)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone", nullable = false, length = 45)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "name", nullable = false, length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "manufacturer")
	public Set<Medicine> getMedicines() {
		return this.medicines;
	}

	public void setMedicines(Set<Medicine> medicines) {
		this.medicines = medicines;
	}

}
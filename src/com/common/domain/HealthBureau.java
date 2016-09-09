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
 * HealthBureau entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "health_bureau", catalog = "bcps")
public class HealthBureau implements java.io.Serializable {

	// Fields

	private String id;
	private String passwd;
	private String address;
	private String phone;
	private String name;
	private Set<Hospital> hospitals = new HashSet<Hospital>(0);

	// Constructors

	/** default constructor */
	public HealthBureau() {
	}

	/** minimal constructor */
	public HealthBureau(String passwd, String address, String phone, String name) {
		this.passwd = passwd;
		this.address = address;
		this.phone = phone;
		this.name = name;
	}

	/** full constructor */
	public HealthBureau(String passwd, String address, String phone,
			String name, Set<Hospital> hospitals) {
		this.passwd = passwd;
		this.address = address;
		this.phone = phone;
		this.name = name;
		this.hospitals = hospitals;
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

	@Column(name = "passwd", nullable = false, length = 45)
	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "healthBureau")
	public Set<Hospital> getHospitals() {
		return this.hospitals;
	}

	public void setHospitals(Set<Hospital> hospitals) {
		this.hospitals = hospitals;
	}

}
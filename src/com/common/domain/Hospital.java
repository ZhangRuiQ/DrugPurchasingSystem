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

/**
 * Hospital entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "hospital", catalog = "bcps")
public class Hospital implements java.io.Serializable {

	// Fields

	private String id;
	private HealthBureau healthBureau;
	private String name;
	private String passwd;
	private String address;
	private String phone;
	private String grade;
	private Set<Order> orders = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public Hospital() {
	}

	/** minimal constructor */
	public Hospital(HealthBureau healthBureau, String name, String passwd,
			String address, String phone, String grade) {
		this.healthBureau = healthBureau;
		this.name = name;
		this.passwd = passwd;
		this.address = address;
		this.phone = phone;
		this.grade = grade;
	}

	/** full constructor */
	public Hospital(HealthBureau healthBureau, String name, String passwd,
			String address, String phone, String grade, Set<Order> orders) {
		this.healthBureau = healthBureau;
		this.name = name;
		this.passwd = passwd;
		this.address = address;
		this.phone = phone;
		this.grade = grade;
		this.orders = orders;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 45)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "higher", nullable = false)
	public HealthBureau getHealthBureau() {
		return this.healthBureau;
	}

	public void setHealthBureau(HealthBureau healthBureau) {
		this.healthBureau = healthBureau;
	}

	@Column(name = "name", nullable = false, length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Column(name = "grade", nullable = false, length = 45)
	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "hospital")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}
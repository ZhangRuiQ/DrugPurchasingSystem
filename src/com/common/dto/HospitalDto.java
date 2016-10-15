package com.common.dto;

import java.util.HashSet;
import java.util.Set;

import com.common.domain.HealthBureau;
import com.common.domain.Order;

public class HospitalDto {
	private String id;
	private HealthBureauDto healthBureauDto;
	private String name;
	private String address;
	private String phone;
	private String grade;
	private Set<Order> orders = new HashSet<Order>(0);
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public HealthBureauDto getHealthBureauDto() {
		return healthBureauDto;
	}
	public void setHealthBureauDto(HealthBureauDto healthBureauDto) {
		this.healthBureauDto = healthBureauDto;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}

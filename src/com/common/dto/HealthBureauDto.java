package com.common.dto;

import java.util.HashSet;
import java.util.Set;

import com.common.domain.Hospital;

public class HealthBureauDto {
	private String id;
	private String address;
	private String phone;
	private String name;

	@Override
	public String toString() {
		return "HealthBureauDto [id=" + id + ", address=" + address
				+ ", phone=" + phone + ", name=" + name + "]";
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}

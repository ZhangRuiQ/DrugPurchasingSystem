package com.test;

import java.sql.Date;

import com.common.domain.Order;

public class Test {

	public static void main(String[] args) {
		Order order = new Order();
		String id = order.getId();
		System.out.println(id);
	}	

}

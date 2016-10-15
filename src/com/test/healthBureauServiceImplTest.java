package com.test;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import com.common.domain.Manufacturer;
import com.common.domain.Medicine;
import com.common.dto.MedicineDto;
import com.common.dto.OrderDto;
import com.demo.service.healthBureau.impl.healthBureauServiceImpl;

public class healthBureauServiceImplTest extends BaseJunit4Test{
	@Resource
	private healthBureauServiceImpl serviceImpl;
	
	@Test
	public void testSearchMedicine() {
		Manufacturer manufacturer = new Manufacturer();
		manufacturer.setNumber("1");
		MedicineDto medicine = new MedicineDto();
		medicine.setName("药品5");
		medicine.setPrice(8.0);
		medicine.setStandard("规格4");
		medicine.setStatus("1");
		medicine.setManufacturer(manufacturer);
		medicine.setStock_Balance("70");
		medicine.setType("类型4");
		serviceImpl.insertMedicine(medicine);
	}
	
	@Test
	public void test() {
		OrderDto orderDto = new OrderDto();
		orderDto.setId("11");
		serviceImpl.txupdateOrder_status(orderDto);
	}

}

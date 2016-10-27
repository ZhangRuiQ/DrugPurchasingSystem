package com.test;

import javax.annotation.Resource;

import org.junit.Test;

import com.common.domain.Manufacturer;
import com.common.dto.MedicineDto;
import com.demo.action.healthBureau.HealthBureauAction;

public class HealthBureauActionTest extends BaseJunit4Test{
	
	@Resource
	HealthBureauAction action ;
	
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
//		action.insertMedicine();
	}

}

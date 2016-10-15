package com.test;

import javax.annotation.Resource;

import org.junit.Test;

import com.common.domain.Medicine;
import com.demo.dao.healthBureau.impl.HealthBureauDaoImpl;

public class HealthBureauDaoImplTest extends BaseJunit4Test{
	@Resource
	HealthBureauDaoImpl healthBureauDaoImpl;
	
	
	@Test
	public void test() {
		Medicine medicine = healthBureauDaoImpl.searchSingleMedicineByNumber("5");
//		medicine.setName("haha1");
//		medicine.setStatus("0");
//		medicine.setPrice(45);
//		medicine.setStandard("规格2");
//		medicine.setType("类型2");
//		healthBureauDaoImpl.insertMedicine(medicine);
	}

}

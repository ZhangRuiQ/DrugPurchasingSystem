package com.demo.common.UserTest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.common.dao.IUserDao;
import com.common.domain.Hospital;
import com.common.domain.Order;
import com.common.domain.OrderItem;
import com.demo.dao.hospital.IHospitalDao;
import com.demo.dto.hospital.OrderSearchCondition;
import com.demo.service.hospital.IHospitalService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring-config.xml")
public class UserDaoTest {
	@Resource
	private IUserDao dto;
	@Resource
	private IHospitalDao hdao;
	@Resource 
	private IHospitalService hservice;
	
//	@Test
//	public void s(){
//	List<Medicine> li=	hdao.findAllMedicineWithOutPage();
//	System.out.println(li.size());
//	for(Medicine m: li){
//		System.out.println(m.getName());
//	}
//		
//	}
//	
//	
//	@Test
//	public void ffs() {
//		MedicineSearchCondition condition=new MedicineSearchCondition();
//		condition.setType("类型3");
//		condition.setManufacturerName(" ");
//		condition.setName("");
//		condition.setNumber("");
//		condition.setPricesort("asc");
//		condition.setStatus("0");
//		
//List<Medicine> li = hdao.findConditionMedicine(condition, 1);
//System.out.println(li.size());
//		// TODO Auto-generated method stub
//
//	}

	
}


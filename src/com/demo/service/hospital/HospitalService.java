package com.demo.service.hospital;

import java.util.List;

import com.common.domain.Medicine;
import com.common.dto.HospitalDto;
import com.demo.dao.hospital.IHospitalDao;

public class HospitalService implements IHospitalService {
	private IHospitalDao hospitalDao;

	@Override
	public String modifyPasswd(String id,String newPasswd) {
		// TODO Auto-generated method stub
		return hospitalDao.modifyPasswd(id, newPasswd);
	}

	public IHospitalDao getHospitalDao() {
		return hospitalDao;
	}

	public void setHospitalDao(IHospitalDao hospitalDao) {
		this.hospitalDao = hospitalDao;
	}

	
	//操作手册下载
	//药品目录加载
	public List<Medicine> loadMedicines(){
		return hospitalDao.findAllMedicine();
		}
	//退货单创建
	//退货单列表
	//采购单修改
	//采购单创建
	//采购单入库
	//采购单列表

	@Override
	public String help() {
		// TODO Auto-generated method stub
		return null;
	}
	
}

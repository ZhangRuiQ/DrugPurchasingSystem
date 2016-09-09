package com.demo.service.hospital;

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

}

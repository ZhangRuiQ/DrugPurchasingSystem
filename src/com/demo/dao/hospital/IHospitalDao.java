package com.demo.dao.hospital;

import java.util.List;

import com.common.domain.Medicine;

public interface IHospitalDao {
	public String modifyPasswd(String id,String newPasswd);
	public List<Medicine> findAllMedicine();
}

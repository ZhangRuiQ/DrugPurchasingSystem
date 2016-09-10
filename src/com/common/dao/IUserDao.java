package com.common.dao;

import com.common.domain.HealthBureau;
import com.common.domain.Hospital;

public interface  IUserDao {
	public Hospital findAtIDInHospital(String id);
	public HealthBureau findAtIDInHealthBureau(String id);

}

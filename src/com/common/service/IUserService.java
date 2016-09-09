package com.common.service;

import java.io.IOException;
import java.io.InputStream;

import com.common.domain.HealthBureau;
import com.common.domain.Hospital;
import com.common.dto.UserDto;

public interface IUserService {
	public  InputStream getImage() throws IOException;
	public Hospital loginAtHospital(UserDto dto);
	public HealthBureau loginAtHealthBureau(UserDto dto);

	public String getText();
}

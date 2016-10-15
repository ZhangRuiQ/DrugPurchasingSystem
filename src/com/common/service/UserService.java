package com.common.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.common.dao.IUserDao;
import com.common.domain.HealthBureau;
import com.common.domain.Hospital;
import com.common.dto.UserDto;
import com.common.util.VerifyCode;

public class UserService implements IUserService {
	private ByteArrayOutputStream out;
	private VerifyCode verity;
	private IUserDao userdao;

	@Override
	public InputStream getImage() throws IOException {
		verity = new VerifyCode();
		out = new ByteArrayOutputStream();
		VerifyCode.output(verity.getImage(), out);

		// TODO Auto-generated method stub
		return new ByteArrayInputStream(out.toByteArray());
	}

	@Override
	public String getText() {
		return verity.getText();

	}

	public IUserDao getUserdao() {
		return userdao;
	}

	public void setUserdao(IUserDao userdao) {
		this.userdao = userdao;
	}

	@Override
	public Hospital loginAtHospital(UserDto dto) {
		// 通过id寻找出对应的hospital，然后比较其密码是否正确
		Hospital h = userdao.findAtIDInHospital(dto.getUserId());
		// 无此账号
		if (h == null) {
			return null;
		} else {
			// 密码不正确
			if (!dto.getPasswd().equals(h.getPasswd())) {
				return null;
			}
			// 密码正确
			else {

				return h;
			}

		}

	}

	@Override
	public HealthBureau loginAtHealthBureau(UserDto dto) {
		// TODO Auto-generated method stub
		// 通过id寻找出对应的healthBureau，然后比较其密码是否正确
		HealthBureau h = userdao.findAtIDInHealthBureau(dto.getUserId());
		// 无此账号
		if (h == null) {
			return null;
		} else {
			// 密码不正确
			if (!dto.getPasswd().equals(h.getPasswd())) {
				return null;
			}
			// 密码正确
			else {

				return h;
			}

		}
	}

}

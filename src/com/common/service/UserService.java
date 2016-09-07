package com.common.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.common.dao.IUserDao;
import com.common.util.VerifyCode;

public class UserService implements IUserService {
	private	ByteArrayOutputStream out = new ByteArrayOutputStream(); 
	private VerifyCode verity=new VerifyCode();
	private String  text;
	private IUserDao userdao;
	@Override
	public InputStream getImage() throws IOException {
		VerifyCode.output(verity.getImage(), out);
		
	 text=	verity.getText();
		
		
		// TODO Auto-generated method stub
		return new ByteArrayInputStream(out.toByteArray());
	}
	
	@Override
	public String getText(){
		return text;
		
		
	}

	public IUserDao getUserdao() {
		return userdao;
	}

	public void setUserdao(IUserDao userdao) {
		this.userdao = userdao;
	}

}

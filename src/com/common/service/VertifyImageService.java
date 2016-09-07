package com.common.service;

import java.io.ByteArrayOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import com.common.util.VerifyCode;

public class VertifyImageService implements IVerfityImageService {

private	ByteArrayOutputStream out = new ByteArrayOutputStream(); 
	private VerifyCode verity=new VerifyCode();
	private String  text;
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
	

}

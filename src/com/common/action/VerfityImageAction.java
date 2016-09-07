package com.common.action;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import com.common.service.VertifyImageService;
import com.opensymphony.xwork2.ActionSupport;

public class VerfityImageAction extends ActionSupport {
	private InputStream imageStream;
	public String getImage(){
	
		try {
			imageStream= new VertifyImageService().getImage();
		
		} catch (IOException e) {
			//.ImageOutputStream TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return SUCCESS;
	}
	public InputStream getImageStream() {
		return imageStream;
	}
	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
	}

}

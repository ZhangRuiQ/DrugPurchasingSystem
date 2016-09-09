package com.common.action;

import java.io.IOException;
import java.io.InputStream;

import com.common.service.IUserService;
import com.common.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private InputStream imageStream;
	private IUserService userService;
	private String text;
	private String vertifyCodeText;
	
	//验证验证码
	public String verificationCode(){
		System.out.println("sdfjalkjl");
		return null;
		
	}
	
	//用户验证
	public String login(){
		return null;
	}
	
	//找回密码
	public String resetPasswd(){
		
		return null;
	}
	
	
	public String getImage(){
	
		try {
			imageStream=userService.getImage();
			text=userService.getText();
		
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
	public IUserService getUserService() {
		return userService;
	}
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public String getVertifyCodeText() {
		return vertifyCodeText;
	}
	public void setVertifyCodeText(String vertifyCodeText) {
		this.vertifyCodeText = vertifyCodeText;
	}
}

package com.common.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.common.domain.HealthBureau;
import com.common.domain.Hospital;
import com.common.dto.HealthBureauDto;
import com.common.dto.HospitalDto;
import com.common.dto.UserDto;
import com.common.service.IUserService;
import com.common.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements SessionAware,RequestAware,ApplicationAware {
	private Map<String,Object> request;
	private Map<String,Object> session;
	private Map<String,Object>  application;
	private UserDto userdto;
	
	private InputStream imageStream;
	private IUserService userService;
	private String vertifyCodeText;
	
	//验证验证码
	public String verificationCode() throws IOException{
		
		if(((String)session.get("text")).equalsIgnoreCase(vertifyCodeText))
		{
			
		}
		else{
			 ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			
			out.write("验证码错误");
			out.flush();
			out.close();
			}
	
		
		return null;
		
	}
	
	//用户验证
	public String login() throws IllegalAccessException, InvocationTargetException{
		
		session.remove("information");
		session.remove("failuser");
		if(!((String)session.get("text")).equalsIgnoreCase(vertifyCodeText)){
			session.put("failuser", userdto.getUserId());
			session.put("information", "验证码错误");
			
			return "fail";
		}
		int type= userdto.getType();
		//医院
		if(type==1)
		{
			Hospital h=userService.loginAtHospital(userdto);
			if(h!=null){
				
				HospitalDto dest=new HospitalDto();
				HealthBureauDto d=new HealthBureauDto();
				BeanUtils.copyProperties(dest, h);
				BeanUtils.copyProperties(d, h.getHealthBureau());
				dest.setHealthBureauDto(d);

				session.put("hospital", dest);
				return "success1";
			}
		}
		else if(type==2){
			HealthBureau h=userService.loginAtHealthBureau(userdto);
			if(h!=null)
				{
				HealthBureauDto dest=new HealthBureauDto();

				BeanUtils.copyProperties(dest, h);
				session.put("healthBureau", dest);
				return "success2";
				}
			
		}
		session.put("failuser", userdto.getUserId());
		session.put("information", "账号密码错误");
		
		return "fail";
	}
	public String logout(){
		session.remove("healthBureau");
		session.remove("hospital");
		
		return SUCCESS;
	}
	
	//获取验证码图片
	public String getImage(){
		
		try {
			imageStream=userService.getImage();
			session.put("text", userService.getText());
		
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

	@Override
	public void setApplication(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.application=arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
		
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=arg0;
	}

	public void setUserdto(UserDto userdto) {
		this.userdto = userdto;
	}

	public UserDto getUserdto() {
		return userdto;
	}
}

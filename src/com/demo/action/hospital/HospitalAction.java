package com.demo.action.hospital;

import com.common.dto.HospitalDto;
import com.opensymphony.xwork2.ActionSupport;

public class HospitalAction extends ActionSupport {
	
	private String oldPasswd;
	private String newPasswd;
	private String information;
	//修改密码
	public String modifyPasswd(){
		
		return null;
		
	}
	//操作手册下载
	public String DownloadBrochure(){
		return null;
		
	}
	//药品目录加载
	public String medicine_search(){
		return "forword";
	}
	//退货单创建
	public String back_new(){
		return "forword";
	}
	//退货单列表
	public String back_search(){
		return "forword";
	}
	//采购单修改
	public String purchase_maintain(){
		return "forword";
	}
	//采购单创建
	public String purchase_new(){
		return "forword";
	}
	//采购单入库
	public String purchase_put(){
		return "forword";
	}
	//采购单列表
	public String purchase_search(){
		return "forword";
	}
	
	public String getOldPasswd() {
		return oldPasswd;
	}
	public void setOldPasswd(String oldPasswd) {
		this.oldPasswd = oldPasswd;
	}
	public String getNewPasswd() {
		return newPasswd;
	}
	public void setNewPasswd(String newPasswd) {
		this.newPasswd = newPasswd;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}


}

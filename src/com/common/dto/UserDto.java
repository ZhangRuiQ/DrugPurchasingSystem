package com.common.dto;

public class UserDto {
	private String userId;
	private String passwd;
	// 用户类型 hospital为1 healthBureau 为2
	private int type;

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}

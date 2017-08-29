package com.tbox.model;

import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class User {

	public String userName;
	public String pwd;

	public String getUserName() { 
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\"userName\":\"");
		builder.append(userName);
		builder.append("\", \"pwd\":\"");
		builder.append(pwd);
		builder.append("\"}");
		return builder.toString();
	}
	
	

}

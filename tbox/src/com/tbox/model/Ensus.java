package com.tbox.model;

import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Ensus {
	public int prod;
	public int count;
	public String ctime;
	public String etime;
	public String obdmac;
	public String appid;
	public String unum;

	public int getProd() {
		return prod;
	}

	public void setProd(int prod) {
		this.prod = prod;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getObdmac() {
		return obdmac;
	}

	public void setObdmac(String obdmac) {
		this.obdmac = obdmac;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getUnum() {
		return unum;
	}

	public void setUnum(String unum) {
		this.unum = unum;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\"prod\":\"");
		builder.append(prod);
		builder.append("\", \"count\":\"");
		builder.append(count);
		builder.append("\", \"ctime\":\"");
		builder.append(ctime);
		builder.append("\", \"etime\":\"");
		builder.append(etime);
		builder.append("\", \"obdmac\":\"");
		builder.append(obdmac);
		builder.append("\", \"appid\":\"");
		builder.append(appid);
		builder.append("\", \"unum\":\"");
		builder.append(unum);
		builder.append("\"}");
		return builder.toString();
	}
}

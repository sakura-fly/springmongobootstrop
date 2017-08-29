package com.tbox.model;

public class SortPant {
	private String key;
	private int value;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\"key\":\"");
		builder.append(key);
		builder.append("\", \"value\":\"");
		builder.append(value);
		builder.append("\"}");
		return builder.toString();
	}
}

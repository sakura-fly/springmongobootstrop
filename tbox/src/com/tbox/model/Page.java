package com.tbox.model;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.tbox.util.Constont;

public class Page<T> {

	private int pageSize = Constont.PAGE_SIZE;
	private int pageNum = 1;
	private long pageTotal;
	private List<T> content;
	private Sort sort;

	public Page(int pageNum) {
		super();
		this.pageNum = pageNum;
	}

	public Page(int pageSize, int pageNum) {
		super();
		this.pageSize = pageSize;
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public long getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(long pageTotal) {
		this.pageTotal = pageTotal;
	}

	public List<T> getContent() {
		return content;
	}

	public void setContent(List<T> content) {
		this.content = content;
	}

	public Sort getSort() {
		return sort;
	}

	public void setSort(Sort sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\"pageSize\":\"");
		builder.append(pageSize);
		builder.append("\", \"pageNum\":\"");
		builder.append(pageNum);
		builder.append("\", \"pageTotal\":\"");
		builder.append(pageTotal);
		builder.append("\", \"content\":\"");
		builder.append(content);
		builder.append("\", \"sort\":\"");
		builder.append(sort);
		builder.append("\"}");
		return builder.toString();
	}

}

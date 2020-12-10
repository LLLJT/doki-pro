package com.ishang.doki.entity;

import java.io.Serializable;

public class Blogtype implements Serializable {
    private Integer id;

	private Integer blogtypeid;

	private String typename;

	private Byte delFlag;

	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBlogtypeid() {
		return blogtypeid;
	}

	public void setBlogtypeid(Integer blogtypeid) {
		this.blogtypeid = blogtypeid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename == null ? null : typename.trim();
	}

	public Byte getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Byte delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(id);
		sb.append(", blogtypeid=").append(blogtypeid);
		sb.append(", typename=").append(typename);
		sb.append(", delFlag=").append(delFlag);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}

}
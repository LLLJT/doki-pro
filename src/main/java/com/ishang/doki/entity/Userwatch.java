package com.ishang.doki.entity;

import java.io.Serializable;

public class Userwatch implements Serializable {
    private Integer id;

	private Integer userid1;

	private Integer userid2;
	
	private String username;
	
	private String signature;
	private String img;
	
	
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid1() {
		return userid1;
	}

	public void setUserid1(Integer userid1) {
		this.userid1 = userid1;
	}

	public Integer getUserid2() {
		return userid2;
	}

	public void setUserid2(Integer userid2) {
		this.userid2 = userid2;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", id=").append(id);
		sb.append(", userid1=").append(userid1);
		sb.append(", userid2=").append(userid2);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}

	
}
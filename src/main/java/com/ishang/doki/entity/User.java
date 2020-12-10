package com.ishang.doki.entity;

import java.io.Serializable;

public class User implements Serializable {
    private Integer id;

	private String username;

	private String password;

	private String sex;

	private String telephone;

	private Integer roleid;

	private String birthday;

	private String signature;

	private String img;

	private Byte delFlag;
	//added
	private Integer count;
	
	private String oldpassword;
	
	private int userid2;
	

	public int getUserid2() {
		return userid2;
	}

	public void setUserid2(int userid2) {
		this.userid2 = userid2;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone == null ? null : telephone.trim();
	}

	public Integer getRoleid() {
		return roleid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday == null ? null : birthday.trim();
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature == null ? null : signature.trim();
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img == null ? null : img.trim();
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
		sb.append(", username=").append(username);
		sb.append(", password=").append(password);
		sb.append(", sex=").append(sex);
		sb.append(", telephone=").append(telephone);
		sb.append(", roleid=").append(roleid);
		sb.append(", birthday=").append(birthday);
		sb.append(", signature=").append(signature);
		sb.append(", img=").append(img);
		sb.append(", delFlag=").append(delFlag);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}

	
}
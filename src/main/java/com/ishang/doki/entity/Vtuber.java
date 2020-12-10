package com.ishang.doki.entity;

import java.io.Serializable;
import java.util.Date;

public class Vtuber implements Serializable {
    private Integer id;

	private Integer pid;

	private String name;

	private String haircolor;

	private Double height;

	private Double weight;

	private Integer age;

	private String birth;

	private String xingzuo;

	private String group;

	private String mengpoint;

	private String intro;

	private String img1;

	private String address1;

	private String img2;

	private String address2;

	private String img3;

	private String address3;

	private Integer fannum;

	private Byte delFlag;

	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getHaircolor() {
		return haircolor;
	}

	public void setHaircolor(String haircolor) {
		this.haircolor = haircolor == null ? null : haircolor.trim();
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth ==null?null:birth.trim();
	}

	public String getXingzuo() {
		return xingzuo;
	}

	public void setXingzuo(String xingzuo) {
		this.xingzuo = xingzuo == null ? null : xingzuo.trim();
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group == null ? null : group.trim();
	}

	public String getMengpoint() {
		return mengpoint;
	}

	public void setMengpoint(String mengpoint) {
		this.mengpoint = mengpoint == null ? null : mengpoint.trim();
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro == null ? null : intro.trim();
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1 == null ? null : img1.trim();
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1 == null ? null : address1.trim();
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2 == null ? null : img2.trim();
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2 == null ? null : address2.trim();
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3 == null ? null : img3.trim();
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3 == null ? null : address3.trim();
	}

	public Integer getFannum() {
		return fannum;
	}

	public void setFannum(Integer fannum) {
		this.fannum = fannum;
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
		sb.append(", pid=").append(pid);
		sb.append(", name=").append(name);
		sb.append(", haircolor=").append(haircolor);
		sb.append(", height=").append(height);
		sb.append(", weight=").append(weight);
		sb.append(", age=").append(age);
		sb.append(", birth=").append(birth);
		sb.append(", xingzuo=").append(xingzuo);
		sb.append(", group=").append(group);
		sb.append(", mengpoint=").append(mengpoint);
		sb.append(", intro=").append(intro);
		sb.append(", img1=").append(img1);
		sb.append(", address1=").append(address1);
		sb.append(", img2=").append(img2);
		sb.append(", address2=").append(address2);
		sb.append(", img3=").append(img3);
		sb.append(", address3=").append(address3);
		sb.append(", fannum=").append(fannum);
		sb.append(", delFlag=").append(delFlag);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}

	
}
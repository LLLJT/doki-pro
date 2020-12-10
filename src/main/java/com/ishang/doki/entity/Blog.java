package com.ishang.doki.entity;

import java.io.Serializable;

public class Blog implements Serializable {
    private Integer id;

	private String blogtitle;

	private String blogcontent;

	private Integer blogtypeid;

	private String blogwatch;

	private Integer userid;

	private String pic;

	private Byte checkFlag;

	private Byte delFlag;
	//added
	private String username;
	private String typename;
    public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	private Integer count;
	

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
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

	public String getBlogtitle() {
		return blogtitle;
	}

	public void setBlogtitle(String blogtitle) {
		this.blogtitle = blogtitle == null ? null : blogtitle.trim();
	}

	public String getBlogcontent() {
		return blogcontent;
	}

	public void setBlogcontent(String blogcontent) {
		this.blogcontent = blogcontent == null ? null : blogcontent.trim();
	}

	public Integer getBlogtypeid() {
		return blogtypeid;
	}

	public void setBlogtypeid(Integer blogtypeid) {
		this.blogtypeid = blogtypeid;
	}

	public String getBlogwatch() {
		return blogwatch;
	}

	public void setBlogwatch(String blogwatch) {
		this.blogwatch = blogwatch == null ? null : blogwatch.trim();
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic == null ? null : pic.trim();
	}

	public Byte getCheckFlag() {
		return checkFlag;
	}

	public void setCheckFlag(Byte checkFlag) {
		this.checkFlag = checkFlag;
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
		sb.append(", blogtitle=").append(blogtitle);
		sb.append(", blogcontent=").append(blogcontent);
		sb.append(", blogtypeid=").append(blogtypeid);
		sb.append(", blogwatch=").append(blogwatch);
		sb.append(", userid=").append(userid);
		sb.append(", pic=").append(pic);
		sb.append(", checkFlag=").append(checkFlag);
		sb.append(", delFlag=").append(delFlag);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}

	
}
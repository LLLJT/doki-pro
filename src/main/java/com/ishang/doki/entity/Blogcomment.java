package com.ishang.doki.entity;

import java.io.Serializable;
import java.util.Date;

public class Blogcomment implements Serializable {
    private Integer id;

	private Integer blogid;

	private Integer userid;

	private String comment;

	private Date commentTime;

	private Integer userid2;

	private String comment2;

	private Date commentTime2;

	private Byte delFlag;
	//added
	private String username1;
	private String username2;
	public String getUsername1() {
		return username1;
	}

	public void setUsername1(String username1) {
		this.username1 = username1;
	}

	public String getUsername2() {
		return username2;
	}

	public void setUsername2(String username2) {
		this.username2 = username2;
	}

	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBlogid() {
		return blogid;
	}

	public void setBlogid(Integer blogid) {
		this.blogid = blogid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment == null ? null : comment.trim();
	}

	public Date getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public Integer getUserid2() {
		return userid2;
	}

	public void setUserid2(Integer userid2) {
		this.userid2 = userid2;
	}

	public String getComment2() {
		return comment2;
	}

	public void setComment2(String comment2) {
		this.comment2 = comment2 == null ? null : comment2.trim();
	}

	public Date getCommentTime2() {
		return commentTime2;
	}

	public void setCommentTime2(Date commentTime2) {
		this.commentTime2 = commentTime2;
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
		sb.append(", blogid=").append(blogid);
		sb.append(", userid=").append(userid);
		sb.append(", comment=").append(comment);
		sb.append(", commentTime=").append(commentTime);
		sb.append(", userid2=").append(userid2);
		sb.append(", comment2=").append(comment2);
		sb.append(", commentTime2=").append(commentTime2);
		sb.append(", delFlag=").append(delFlag);
		sb.append(", serialVersionUID=").append(serialVersionUID);
		sb.append("]");
		return sb.toString();
	}

	
}
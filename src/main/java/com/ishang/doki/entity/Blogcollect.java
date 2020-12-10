package com.ishang.doki.entity;

import java.io.Serializable;

public class Blogcollect implements Serializable {
    private Integer id;

    private Integer blogid;

    private Integer userid;
    
    //added by ljt
    private String blogtitle;
    
    private String username;
    
    private String blogwatch;
    
    private String pic;

    public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getBlogtitle() {
		return blogtitle;
	}

	public void setBlogtitle(String blogtitle) {
		this.blogtitle = blogtitle;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBlogwatch() {
		return blogwatch;
	}

	public void setBlogwatch(String blogwatch) {
		this.blogwatch = blogwatch;
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", blogid=").append(blogid);
        sb.append(", userid=").append(userid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}
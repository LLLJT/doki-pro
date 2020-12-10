package com.ishang.doki.entity;

import java.io.Serializable;

public class Notify implements Serializable {
    private Integer id;

    private String notifytitle;

    private Integer userid;

    private Integer checkflag;

    private String reason;
    
    private String username;
    
    
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

    public String getNotifytitle() {
        return notifytitle;
    }

    public void setNotifytitle(String notifytitle) {
        this.notifytitle = notifytitle == null ? null : notifytitle.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getCheckflag() {
        return checkflag;
    }

    public void setCheckflag(Integer checkflag) {
        this.checkflag = checkflag;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", notifytitle=").append(notifytitle);
        sb.append(", userid=").append(userid);
        sb.append(", checkflag=").append(checkflag);
        sb.append(", reason=").append(reason);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}
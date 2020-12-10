package com.ishang.doki.entity;

import java.io.Serializable;
import java.util.Date;

public class Searchresult implements Serializable {
    private Integer id;

    private String searchtitle;

    private String searchcontent;

    private Date searchtime;

    private Integer userid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSearchtitle() {
        return searchtitle;
    }

    public void setSearchtitle(String searchtitle) {
        this.searchtitle = searchtitle == null ? null : searchtitle.trim();
    }

    public String getSearchcontent() {
        return searchcontent;
    }

    public void setSearchcontent(String searchcontent) {
        this.searchcontent = searchcontent == null ? null : searchcontent.trim();
    }

    public Date getSearchtime() {
        return searchtime;
    }

    public void setSearchtime(Date searchtime) {
        this.searchtime = searchtime;
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
        sb.append(", searchtitle=").append(searchtitle);
        sb.append(", searchcontent=").append(searchcontent);
        sb.append(", searchtime=").append(searchtime);
        sb.append(", userid=").append(userid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}
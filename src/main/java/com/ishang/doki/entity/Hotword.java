package com.ishang.doki.entity;

import java.io.Serializable;

public class Hotword implements Serializable {
    private Integer id;

    private Integer userid;

    private String wordtitle;

    private String wordcontent;

    private Integer count;

    private Integer checkflag;

    private Integer typeid;

    private Byte delFlag;

    private String title1;

    private String content1;

    private String title2;

    private String content2;

    private String title3;

    private String content3;

    private String uptitle;

    private String upcontent;
//added
    private String typename;
    private String username;
    private int wordcount;
    
    public int getWordcount() {
		return wordcount;
	}

	public void setWordcount(int wordcount) {
		this.wordcount = wordcount;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getWordtitle() {
        return wordtitle;
    }

    public void setWordtitle(String wordtitle) {
        this.wordtitle = wordtitle == null ? null : wordtitle.trim();
    }

    public String getWordcontent() {
        return wordcontent;
    }

    public void setWordcontent(String wordcontent) {
        this.wordcontent = wordcontent == null ? null : wordcontent.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getCheckflag() {
        return checkflag;
    }

    public void setCheckflag(Integer checkflag) {
        this.checkflag = checkflag;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Byte getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Byte delFlag) {
        this.delFlag = delFlag;
    }

    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1 == null ? null : title1.trim();
    }

    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1 == null ? null : content1.trim();
    }

    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2 == null ? null : title2.trim();
    }

    public String getContent2() {
        return content2;
    }

    public void setContent2(String content2) {
        this.content2 = content2 == null ? null : content2.trim();
    }

    public String getTitle3() {
        return title3;
    }

    public void setTitle3(String title3) {
        this.title3 = title3 == null ? null : title3.trim();
    }

    public String getContent3() {
        return content3;
    }

    public void setContent3(String content3) {
        this.content3 = content3 == null ? null : content3.trim();
    }

    public String getUptitle() {
        return uptitle;
    }

    public void setUptitle(String uptitle) {
        this.uptitle = uptitle == null ? null : uptitle.trim();
    }

    public String getUpcontent() {
        return upcontent;
    }

    public void setUpcontent(String upcontent) {
        this.upcontent = upcontent == null ? null : upcontent.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userid=").append(userid);
        sb.append(", wordtitle=").append(wordtitle);
        sb.append(", wordcontent=").append(wordcontent);
        sb.append(", count=").append(count);
        sb.append(", checkflag=").append(checkflag);
        sb.append(", typeid=").append(typeid);
        sb.append(", delFlag=").append(delFlag);
        sb.append(", title1=").append(title1);
        sb.append(", content1=").append(content1);
        sb.append(", title2=").append(title2);
        sb.append(", content2=").append(content2);
        sb.append(", title3=").append(title3);
        sb.append(", content3=").append(content3);
        sb.append(", uptitle=").append(uptitle);
        sb.append(", upcontent=").append(upcontent);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}
package cn.yungou.commons.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class EasybuyNews implements Serializable {
    private Integer id;
    private String title;
    private String content;
    private Timestamp createTime;
    private Integer classid;

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public EasybuyNews() {
    }

    @Override
    public String toString() {
        return "EasybuyNews{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", classid=" + classid +
                '}';
    }

    public EasybuyNews(Integer id, String title, String content, Timestamp createTime, Integer classid) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createTime = createTime;
        this.classid = classid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EasybuyNews that = (EasybuyNews) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        return classid != null ? classid.equals(that.classid) : that.classid == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (classid != null ? classid.hashCode() : 0);
        return result;
    }
}

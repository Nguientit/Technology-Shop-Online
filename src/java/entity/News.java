/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author PC
 */
public class News {

    private int id;
    private String image;
    private NewsType newsType;
    private String title;
    private String content;
    private Date createdDate;
    private boolean status;

    public News() {
    }

    public News(int id, String image, NewsType newsType, String title, String content, Date createdDate, boolean status) {
        this.id = id;
        this.image = image;
        this.newsType = newsType;
        this.title = title;
        this.content = content;
        this.createdDate = createdDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public NewsType getNewsType() {
        return newsType;
    }

    public void setNewsType(NewsType newsType) {
        this.newsType = newsType;
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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "News{" + "id=" + id + ", image=" + image + ", newsType=" + newsType + ", title=" + title + ", content=" + content + ", createdDate=" + createdDate + ", status=" + status + '}';
    }
}

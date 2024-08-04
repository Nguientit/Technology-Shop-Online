/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;

/**
 *
 * @author PC
 */
public class NewsType {
    private int id;
    private String type;
    private List<News> news;

    public NewsType() {
    }

    public NewsType(int id, String type, List<News> news) {
        this.id = id;
        this.type = type;
        this.news = news;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<News> getNews() {
        return news;
    }

    public void setNews(List<News> news) {
        this.news = news;
    }

    @Override
    public String toString() {
        return "NewsType{" + "id=" + id + ", type=" + type + ", news=" + news + '}';
    }

}

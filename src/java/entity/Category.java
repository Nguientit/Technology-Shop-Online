/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author PC
 */
public class Category {
    private int id;
    private String name;
    private Map<Integer, Brand> brands = new LinkedHashMap<>();

    public Category() {
    }

    public Category(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Map<Integer, Brand> getBrands() {
        return brands;
    }

    public void setBrands(Map<Integer, Brand> brands) {
        this.brands = brands;
    }

    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", name=" + name + '}';
    }

}

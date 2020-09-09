/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.entities;


public class Category 
{
    private int cid;
    private String cname;
    private String description;
    
//    constructors...

    public Category(int cid, String cname, String description) {
        this.cid = cid;
        this.cname = cname;
        this.description = description;
    }

    public Category() {
    }

    public Category(String cname, String description) {
        this.cname = cname;
        this.description = description;
    }
    
//    getters and setters...

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
    
    
}

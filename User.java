/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.entities;

import java.sql.*;
public class User 
{
    private int id;
    private String username;
    private String email;
    private String epassword;
    private String gender;
    private String status;
    private Timestamp rdate;
    private String profile;
//    constructors

    public User(int id, String username, String email, String epassword, String gender, String status, Timestamp rdate) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.epassword = epassword;
        this.gender = gender;
        this.status = status;
        this.rdate = rdate;
    }

    public User() {
    }

    public User(String username, String email, String epassword, String gender, String status, Timestamp rdate) {
        this.username = username;
        this.email = email;
        this.epassword = epassword;
        this.gender = gender;
        this.status = status;
        this.rdate = rdate;
    }

    public User(String username, String email, String epassword, String gender, String status) {
        this.username = username;
        this.email = email;
        this.epassword = epassword;
        this.gender = gender;
        this.status = status;
    }
//    getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEpassword() {
        return epassword;
    }

    public void setEpassword(String epassword) {
        this.epassword = epassword;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getRdate() {
        return rdate;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    
}


package com.tech.dao;

import com.tech.entities.User;
import java.sql.*;

public class UserDao 
{
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
//    method to insert user to database..
    public boolean saveUser(User user)
    {
     boolean f=false;
        try{
            //user=db..
            String query="insert into user(username,email,epassword,gender,status) values(?,?,?,?,?)";
           PreparedStatement p= this.con.prepareStatement(query);
           p.setString(1,user.getUsername());
           p.setString(2,user.getEmail());
           p.setString(3,user.getEpassword());
           p.setString(4,user.getGender());
           p.setString(5,user.getStatus());
           
          p.executeUpdate();
           f=true; 
        }catch(Exception e){
            e.printStackTrace();
        }
      return f;  
    }
    //get user by email and password...
    public User getUserByEmailAndPassword(String email,String epassword)
    { 
        User user=null;
 try{
     String query="select * from user where email=? and epassword=?";
     PreparedStatement p=con.prepareStatement(query);
     p.setString(1,email);
     p.setString(2,epassword);
     
     ResultSet set=p.executeQuery();
     if(set.next()){
         user=new User();
//         data from db...
     user.setUsername(set.getString("username"));
     user.setId(set.getInt("id"));
     user.setEmail(set.getString("email"));
     user.setEpassword(set.getString("epassword"));
     user.setGender(set.getString("gender"));
     user.setStatus(set.getString("status"));
     user.setRdate(set.getTimestamp("rdate"));
     user.setProfile(set.getString("profile"));
     

     }
     
     
     
 }catch(Exception e){
     e.printStackTrace();
 }
        
     return user;   
    }
    
    //update user in db...
    public boolean updateUser(User user){
        boolean f=false;
        try{
 String query="update user set username=?,email=?,epassword=?,gender=?,profile=? where id=?";
 PreparedStatement p=con.prepareStatement(query);
 p.setString(1, user.getUsername());
 p.setString(2,user.getEmail());
 p.setString(3,user.getEpassword());
 p.setString(4, user.getGender());
// p.setString(5, user.getStatus());
p.setString(5, user.getProfile());
 p.setInt(6,user.getId());
 
 
 p.executeUpdate();
 f=true;
 
     }
        catch(Exception e){
         e.printStackTrace();
        }
        return f;
    }
    
     public User getUserByUserId(int userId)
   {
      User user=null; 
   try{
        String q="select * from user where id=?";
    PreparedStatement ps=this.con.prepareStatement(q);
     ps.setInt(1, userId);
     ResultSet set=ps.executeQuery();
     if(set.next())
     {
            user=new User();
//         data from db...
     user.setUsername(set.getString("username"));
     user.setId(set.getInt("id"));
     user.setEmail(set.getString("email"));
     user.setEpassword(set.getString("epassword"));
     user.setGender(set.getString("gender"));
     user.setStatus(set.getString("status"));
     user.setRdate(set.getTimestamp("rdate"));
     user.setProfile(set.getString("profile"));
     }
   }catch(Exception e){
       e.printStackTrace();
   }
     
    
   return user;
   }
    
}

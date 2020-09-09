package com.tech.dao;

import com.tech.entities.Category;
import com.tech.entities.Post;
import com.tech.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao
{
    Connection con;
   

    public PostDao(Connection con) {
        this.con = con;
    }

   public ArrayList<Category> getAllCategories(){
       ArrayList<Category> list=new ArrayList<>();
       try{
           String query="select * from categories";
           Statement st=con.createStatement();
           ResultSet set=st.executeQuery(query);
           
//           fetch data from set...
            while(set.next())
            {
                int cid=set.getInt("cid");
                String cname=set.getString("cname");
                String desciption =set.getString("desciption");
//                create a category class obj..
                  Category c=new Category(cid,cname,desciption);

                  list.add(c);
                  
            }
       }catch(Exception e){
           e.printStackTrace();
       }
      
       return list;
   }
    
    //save post...
   public boolean savePost(Post p){
       boolean f=false;
       try{
           String query="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
           PreparedStatement pstmt=con.prepareStatement(query);
           pstmt.setString(1,p.getpTitle());
           pstmt.setString(2,p.getpContent());
           pstmt.setString(3,p.getpCode());
           pstmt.setString(4,p.getpPic());
           pstmt.setInt(5,p.getCatId());
           pstmt.setInt(6,p.getUserId());
           
           pstmt.executeUpdate();
           f=true;
           
           
       }catch(Exception e){
           e.printStackTrace();
       }
       
       return f;
   }
    
   public List<Post> getAllPost()
   {
      List<Post> list=new ArrayList<>();
      //fetch all post...
      try{
          String q="select * from posts order by pid desc";
         PreparedStatement p=con.prepareStatement(q);
         ResultSet set=p.executeQuery();
         while(set.next())
         {
             
            int pid=set.getInt("pid");
            String pTitle=set.getString("pTitle");
            String pContent=set.getString("pContent");
            String pCode=set.getString("pCode");
            String pPic=set.getString("pPic");
            Timestamp pDate=set.getTimestamp("pDate");
            int catId=set.getInt("catId");
            int userId=set.getInt("userId");
            Post post=new Post(pid,pTitle,pContent,pCode,pPic,catId,userId);
            list.add(post);
         }
      }catch(Exception e){
       e.printStackTrace();
      }
      return list;
   }
   public List<Post> getPostByCatId(int catId)
   {
        List<Post> list=new ArrayList<>();
      //fetch all post by catid...
      try
      {
           String q="select * from posts where catId=?";
         PreparedStatement p=con.prepareStatement(q);
         p.setInt(1, catId);
         ResultSet set=p.executeQuery();
         while(set.next())
         {  
           int pid=set.getInt("pid");
           String pTitle=set.getString("pTitle");
           String pContent=set.getString("pContent");
           String pCode=set.getString("pCode");
           String pPic=set.getString("pPic");
           Timestamp pdate=set.getTimestamp("pDate");
              int userId=set.getInt("userId");
              Post post=new Post(pid,pTitle,pContent,pCode,pPic,pdate,catId,userId);

            list.add(post);
         }
      }catch(Exception e){
          e.printStackTrace();
      }
      return list;
   }
   
   public Post getPostByPostId(int postId)
   {
       Post post=null;
  try{
     String q="select * from posts where pid=?";
    PreparedStatement p=this.con.prepareStatement(q);
    p.setInt(1, postId);
    ResultSet set=p.executeQuery();
    if(set.next()){
       
         int pid=set.getInt("pid");
           String pTitle=set.getString("pTitle");
           String pContent=set.getString("pContent");
           String pCode=set.getString("pCode");
           String pPic=set.getString("pPic");
           Timestamp pdate=set.getTimestamp("pDate");
           int cid=set.getInt("catId");
              int userId=set.getInt("userId");
         post=new Post(pid,pTitle,pContent,pCode,pPic,pdate,cid,userId);
    }
    
  }catch(Exception e){
      e.printStackTrace();
  }
    return post;
   }
  
   
}

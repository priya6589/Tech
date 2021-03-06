<%@page import="com.tech.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.entities.Category"%>
<%@page import="com.tech.entities.Post"%>
<%@page import="com.tech.dao.PostDao"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page errorPage="error.jsp" %>
<%@page import="com.tech.entities.User"%>


<!--valid user-->
<%
User user=(User)session.getAttribute("currentUser");
if(user==null){
    response.sendRedirect("login.jsp");
}

%>
<%
int postId=Integer.parseInt(request.getParameter("post_id"));
PostDao d=new PostDao(ConnectionProvider.getConnection());

Post p=d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%>|| Tech Blog</title>
   <!--css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            background:url(img/pic0.jpg);
            background-size: cover;
            background-attachment: fixed;
        }
        .post-title{
            font-weight:60;
            font-size:30px;
        }
        .post-content{
            font-weight: 100;
            font-size:25px;
        }
        .post-date{
            font-style:italic;
            font-weight: bold;
        }
        .post-user-info{
            font-size:20px;
        }
        .row-user{
            border:1px solid #e2e2e2;
            padding-top: 15px;
        }
    </style>
    <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v7.0" nonce="aKn248uE"></script>

    </head>
    <body>
          <!--navbar-->
       <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="profile.jsp"><span class="fa fa-university"></span>TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
      </li>
   
        </li>
          <li class="nav-item">
          <a class="nav-link " href="#" data-toggle="modal" data-target="#add-post-modal"><span class="	fa fa-pencil-square"></span>Add Post</a>
      </li>
    
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-dedent"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Languages</a>
          <a class="dropdown-item" href="#">Data Structure</a>
          <a class="dropdown-item" href="#">Algorithms</a>
          
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Project Implementations</a>
        </div>
      </li>
      <li class="nav-item">
          <a class="nav-link " href="#"><span class="fa fa-volume-control-phone"></span>Contact us</a>
      </li>
      <li class="nav-item">
          <a class="nav-link " href="#"><span class="fa fa-share-alt"></span>More</a>
   
      
    </ul>
      <ul class="navbar-nav mr-right"> 
          <li class="nav-item">
              <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-address-card-o fa-2x"></span>
                  <%= user.getUsername()%></a>
          </li></ul>
          <ul class="navbar-nav mr-right">  
        <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-power-off fa-2x "></span>Logout</a>
      </li>
      </ul>
  </div>
</nav>
<!--end of navbar-->
<!--main content of body-->
<div class="container">
    <div class="row my-2">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header primary-background text-white">
                    <h3 class="post-title"><%=p.getpTitle()%></h3>
                    
                </div>
                
                <div class="card-body">
                    <img class="card-img-top my-2" src="post_pics/<%=p.getpPic()%>" alt="Card image cap">
                 
                    <div class="row my-3 row-user">
                        <div class="col-md-8">
                            <%
                            UserDao ud=new UserDao(ConnectionProvider.getConnection());
                            %>
             <p class="post-user-info"><a href="#"><%= ud.getUserByUserId(p.getUserId()).getUsername() %></a> has posted:</p>
                        </div>
                <div class="col-md-4">
                            <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getPdate())%></p>
                        </div>
                    </div>
                    
                   <p class="post-content"><%=p.getpContent()%></p>
                    <br>
                    <br>
                    <div class="post-code">
                        <pre><%= p.getpCode()%></pre>
                    </div>
                </div>
                <div class="card-footer bg-primary text-center">
                    <%
                     LikeDao l= new LikeDao(ConnectionProvider.getConnection());
                    %>
                    
 <a href="#" onclick="doLike(<%= p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm">
  <i class="fa fa-thumbs-o-up"></i><span><%=l.countLikeOnPost(p.getPid()) %></span></a>
               
        <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>25</span></a>
            
                </div>
  <div class="card-footer">
      <div class="fb-comments" data-href="http://localhost:9494/Tech/show_blog.jsp?post_id=<%=p.getPid()%>" data-numposts="5" data-width=""></div>
      
  </div>
            </div>
    </div>
</div> 
<!--*end of main*-->
<!-- start profile modal-->

<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header  primary-background text-white">
        <h3 class="modal-title" id="exampleModalLabel">Tech Blog</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
           <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width:150px;">
           <br>
                 <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getUsername()%></h5>
         
          <!--details-->
<div id="profile-details">
<table class="table">
 
  <tbody>
    <tr>
      <th scope="row">USER ID:</th>
      <td><%=user.getId()%></td>
     
    </tr>
    <tr>
      <th scope="row">EMAIL ADDRESS:</th>
      <td><%=user.getEmail()%></td>
    
    </tr>
   
     <tr>
      <th scope="row">GENDER:</th>
      <td><%=user.getGender()%></td>
     
    </tr>
      <tr>
      <th scope="row">STATUS:</th>
      <td><%=user.getStatus()%></td>
     
    </tr>
    
     </tr>
      <tr>
      <th scope="row">REGISTERED ON DATE:</th>
      <td><%=user.getRdate().toString()%></td>
     
    </tr>
    
  </tbody>
</table>
</div>
      <!--profile-edit-->
      <div id="profile-edit" style="display: none;">
          <h3 class="mt-3">Please Edit Carefully..!!</h3>
          <form action="EditServlet" method="POST" enctype="multipart/form-data">
              <table>
                  <tr>
                      <td>USER ID:</td>
                      <td><%= user.getId()%></td>
                  </tr>
                   <tr>
                      <td>USER NAME:</td>
                      <td><input type="text" name="user_name" class="form-control" value="<%= user.getUsername()%>"></td>
                  </tr>
                    <tr>
                      <td>EMAIL ADDRESS:</td>
                      <td><input type="email" name="e_mail" class="form-control" value="<%= user.getEmail()%>"></td>
                  </tr>
                    <tr>
                      <td>PASSWORD:</td>
 <td><input type="password" name="e_password" class="form-control" value="<%= user.getEpassword()%>"></td>
                  </tr>
                    <tr>
                      <td>GENDER:</td>
                      <td><%= user.getGender().toUpperCase()%></td>
                  </tr> 
                  
                    <tr>
                      <td>SELECT PIC:</td>
                      <td><input type="file" name="image" class="form-control"></td>
                  </tr> 
                    
                  <br>
                 
              </table>
                  <br>
                  <div class="container">
                      <button type="submit" class="btn btn-outline-primary">SAVE</button>
                  </div>
              
          </form>
          
      </div>
      
    
      
      <!---------->
 </div>
     </div>        
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
      </div>
    </div>
  </div>
</div>
<!--end of profile modal-->
<!--add post modal-->
<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form id="add-post-form" action="AddPostServlet" method="POST">
             <div class="form-group">
                  <label>Post Title:</label>
                  <input name="pTitle" type="text" placeholder="Enter Your Post Title" class="form-control"/>
             </div>
                <div class="form-group">
                  <label>Post Content:</label>
                  <textarea name="pContent" class="form-control" style="height:150px;" placeholder="Enter Your Post Content">
                      
                  </textarea>
              </div>
               <div class="form-group">
                  <label> Code:</label>
                  <textarea name="pCode" class="form-control" style="height:150px;" placeholder="Enter Your Program(if any)">
                      
                  </textarea>
              </div>
              <div class="form-group">
                  <label>Select Your Picture:</label>
                  <br>
                  <input name="pic" type="file"/>
               </div>
                      <div class="form-group">
              <select class="form-control" name="cid">
                  <option selected disabled>---Select your category---</option
                  <%
                  PostDao postd=new PostDao(ConnectionProvider.getConnection());
                  ArrayList<Category>list=postd.getAllCategories();
                  for(Category c:list)
                  {
                  %>
                  <option value="<%= c.getCid() %>"><%= c.getCname()%></option>
                
                  <%
                      }
                  %>
              </select>
              </div>
                  <div class="container text-center">
                  <button   type="submit" class="btn btn-outline-primary">POST</button>
              </div>
              
          </form>
      </div>
          
      </div>
   </div>
 
</div>

<!--end of addPost modal-->


     
    <!--javascript-->
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
    let editStatus=false;
$('#edit-profile-button').click(function(){
//    alert("button clicked")
if(editStatus==false)
{
     $('#profile-details').hide()
  $('#profile-edit').show();
  editStatus=true;
  $(this).text("BACK")
}
else{
     $('#profile-details').show()
  $('#profile-edit').hide();
  editStatus=false;
  $(this).text("EDIT")
}
       
});    
});    
</script>
  <!--now add post js-->
  <script>
    $(document).ready(function(e){
//        alert("loaded...!!!")
    $("#add-post-form").on("submit",function(event){
       
//        this code gets called when form is submitted..
      event.preventDefault();
      console.log("You have clicked on submit...!!!");
      let form=new FormData(this);
      
      //now requesting to server..
      $.ajax({
          url:"AddPostServlet",type:'POST',data:form,
          success:function(data,textStatus,jqXHR){
              //success..
              console.log(data);
              if(data.trim()=='done')
              {
               swal("Good job!", "Saved Successfully", "success");   
              }
              else{
                  swal("ERROR...Something went wrong!","Something went wrong!", "error");
              }
          },
          error:function(jqXHR,textStatus,errorThrown){
           //error..
            swal("ERROR...Something went wrong!","Something went wrong!", "error");
          },
          processData:false,
          contentType:false
      });
    });
    });
    
</script>      
        
       
    </body>
</html>

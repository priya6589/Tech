<%-- 
    Document   : login
    Created on : 10 Jul, 2020, 2:50:10 PM
    Author     : hp
--%>

<%@page import="com.tech.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    </head>
    <body>
        <!--navbar-->
        <%@include file="navbar.jsp" %>
        
        <main class="d-flex align-items-center primary-background" style="height: 80vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center" style="background: bisque;">
                             <span class="fa fa-user-circle fa-4x"></span> 
                             <br>
                             <h1> Login Here!</h1>
                            </div>
                            
                            <%
                       Message m=(Message)session.getAttribute("msg");
                       if(m!=null){
                           %>
                            <div class="alert <%=m.getCssClass()%>" role="alert">
                       <%= m.getContent()%>
                            </div>
                      <% 
                          session.removeAttribute("msg");
                          }
                            %>
                            
                            <div class="card-body">
                                <form action="LoginServlet" method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" required  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="epassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
 <br>
 <div class="container text-center">
  <button type="submit" class="btn btn-primary">Submit</button>
 </div>
</form>
                                
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </main>
 
        <!--javascript-->
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        
    </body>
</html>

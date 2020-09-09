

<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!--css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    </head>
    <body>
        
        <%@include file="navbar.jsp" %>
        <!--banner-->
        <div class="container-fluid  p-0 m-0 text-center">
            <div class="jumbotron primary-background  text-white">
                   <div class="container">
                       <h1>Learn Coding With Tech Blog</h1>
                    <h2>Welcome to Tech Blog..!!</h2>
                    <p>A programming language is a formal language comprising a set of instructions that produce various kinds of output.
                        Programming languages are used in computer programming to implement algorithms.
                        Most programming languages consist of instructions for computers. 
                    There are programmable machines that use a set of specific instructions, rather than general programming languages
                    </p>
                    <a href="register.jsp"  class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start! Its Free.</a>
                    <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login User</a>
                   </div>
            </div>
        </div>
          
        
        <!--cards-->
        <div class="container">
            <div class="row">
            <div class="col-md-4">
             <div class="card" >
             <div class="card-body">
             <h5 class="card-title">JAVA Programming</h5>
             <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
             <a href="#" class="btn btn-primary">Read More..!</a>
             </div>
            </div>
           </div>
                
            <div class="col-md-4">
             <div class="card" >
             <div class="card-body">
             <h5 class="card-title">C Programming</h5>
             <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
             <a href="#" class="btn btn-primary">Read More..!</a>
             </div>
            </div>
         </div>       
           
           <div class="col-md-4">
             <div class="card" >
             <div class="card-body">
             <h5 class="card-title">C# Programming</h5>
             <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
             <a href="#" class="btn btn-primary">Read More..!</a>
             </div>
            </div>
         </div>       
                
                
          
                
        </div>
            <br>   
        <!--second row cards-->
        <div class="row ">
            <div class="col-md-4">
             <div class="card" >
             <div class="card-body">
             <h5 class="card-title">C++ Programming</h5>
             <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
             <a href="#" class="btn btn-primary">Read More..!</a>
             </div>
            </div>
           </div>
                
            <div class="col-md-4">
             <div class="card" >
             <div class="card-body">
             <h5 class="card-title">PYTHON Programming</h5>
             <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
             <a href="#" class="btn btn-primary">Read More..!</a>
             </div>
            </div>
         </div>       
           
           <div class="col-md-4">
             <div class="card" >
             <div class="card-body">
             <h5 class="card-title">JAVASCRIPT Programming</h5>
             <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
             <a href="#" class="btn btn-primary">Read More..!</a>
             </div>
            </div>
         </div>       
        </div>
    </div>
 
        
        
        <!--javascript-->
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

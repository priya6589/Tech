

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
     <!--css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
     <body>
         <%@include file="navbar.jsp" %>
         <main class="primary-background " style="padding-bottom:80px;">
             <div class="container">
                 <div class="col-md-7 offset-md-3">
                     <div class="card">
                         <div class="card-header text-center text-white" style="background:#ff9933;">
                             <span class="fa fa-user-plus fa-4x"></span>
                            <br>
                             <h1>Register Here!</h1>
                         </div>
                         <div class="card-body">
<form action="RegisterServlet" method="POST" id="reg-form">
    <div class="form-group">
    <label for="username">UserName:</label>
    <input name="username" type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter Your Name">
    </div>
  <div class="form-group">
    <label for="email">Email address</label>
    <input name="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Your Email Address">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="epassword">Password</label>
    <input name="epassword" type="password" class="form-control" id="epassword" placeholder="Please Enter Your Password">
  </div>
   <div class="form-group">
       <label>Select Gender:</label>
       <br>
       <input type="radio" name="gender" id="gender" value="male"><span class="fa fa-male"></span>Male
       <input type="radio" name="gender" id="gender" value="female"><span class="fa fa-female"></span>Female
       
   </div>
    <div class="form-group">
        <label>Status:</label>
        <select name="status">
            <option selected disabled>---Select your status---</option>
            <option>Student</option>
            <option>Professional Programmer</option>
             <option>Doing Job</option>
            
        </select>
    </div>
  <div class="form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions:</label>
  </div>
    <br>
    <div class="container text-center" style="display: none;">
         <span class="fa fa-refresh fa-spin fa-3x  ">
    </span>
        <h5>Please wait....</h5>
    </div>
   <button id="summit-btn" type="submit" class="btn btn-primary">Submit</button>
</form>
                             
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
   
 $(document).ready(function(){
     console.log("data loaded....")
     
     $('#reg-form').on('submit',function(event){
       event.preventDefault();
       let form=new FormData(this);
       $("#summit-btn").hide();
       $("#loader").show();
       
       //send to RegisterServlet..
       $.ajax({
           url:"RegisterServlet",type:"POST",data:form,
           success:function(data,textStatus,jqXHR){
               console.log(data);
                $("#summit-btn").show();
                $("#loader").hide();
                if(data.trim()==='Done'){ 
                swal("Successfully Registered...User can directly access the Login!")
                .then((value) => {
                   window.location="login.jsp";
                });
                }
                else
                {
                 swal(data);   
                }
            },
           error:function(jqXHR,textStatus,errorThrown){
               console.log(jqXHR);
                $("#summit-btn").hide();
                $("#loader").show();
                
               swal("Not Successfully Registered...Something went wrong!Please Try Again...");
               
           },
           processData:false,
           contentType:false
       });
       
     });
 });   
 </script>
    </body>
</html>

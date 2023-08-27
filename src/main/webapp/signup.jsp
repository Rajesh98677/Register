<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
</head>
<body style="background:url(img/reg3.jpg); background-size:cover; background-attachment:fixed;">
<div class ="container">
<div class ="row">
<div class = "col m6 offset-m3">
<div class ="card">
<div class ="card-content">
<h4 style="margin-top:10px;" class="center-align">Register here!!!</h4>
<p  class="center-align" id="msg" ></p>
<div class="form center-align">
<!---//creating form--->
<form action="Register" method="post" id="myform">
<input type= "text" name="user_name" required placeholder="enter user name"/>
<input type= "password" name="user_password" required placeholder="enter user password"/>
<input type= "email" name="user_email" required placeholder="enter user email"/>
<div class="file-field input-field">
      <div  class="btn blue">
        <span  >File</span>
        <input name = "image" type="file">
      </div>
      <div  class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
<button type ="submit" class="btn sky" >Submit</button>
</form>


</div>

<div class="loader center-align" style="margin-top:20px; display: none;">
<div class="preloader-wrapper big active">
    <div class="spinner-layer spinner-blue-only">
      <div class="circle-clipper left">
        <div class="circle"></div>
      </div><div class="gap-patch">
        <div class="circle"></div>
      </div><div class="circle-clipper right">
        <div class="circle"></div>
      </div>
    </div>
 

  






</div>
<h5>please wait...</h5>
</div>




</div>



</div>




</div>


</div>
</div>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
  <script>
 
 
  $(document).ready(function(){
	
	$("#myform").on('submit',function(event){
		event.preventDefault();
		//var f = $(this).serialize();
		let f = new FormData(this);
		
		console.log(f);
		$(".loader").show();
		$("#myform").hide()
		
		$.ajax({
			url:"Register",
			data:f,
			type:'POST',
			success: function(data,textStatus,jqXHR){
				console.log(data);
				console.log("Success");
				$(".loader").hide();
				
				if(data.trim() ==='Done'){
					
					$("#msg").html("<h3>Succesfully Registered!!</h3>")
					$("#msg").addClass('green-text')
				}else{
					
					$("#msg").html("Something went wrong!!")
					$("#msg").addClass('red-text')
					
				}
			
			},
			error:function(jqXHR,textStatus,errorThrown){
				console.log(data);
				console.log("error")
				$("#msg").html("Something went wrong!!")
				$(".loader").hide();
				$("#myform").show()
			},
			processData:false,
			contentType:false,
		
		})
	}) 
	
	 
	  
  })
  

  </script>
  
  
</body>
</html>

 <%@page import="payslip.geons.dto.Employee"%>
<!doctype html>

<html lang="en">
  <head>
 
  <%Employee employee= (Employee)session.getAttribute("name"); %>
  	<link rel="icon" type="image/x-icon" href="image/geon.jpg">
  	<title>Geons</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
		
		
		<link rel="stylesheet" href="css/stylee.css">
		
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.top{
    margin-top:12%;
}



body {
	color: #000;
	overflow-x: hidden;
	height: 100%;
	background-image: url("image\skyblue.avif");
	background-repeat: no-repeat;
	background-size: 100% 100%
}

.card {
	padding: 30px 40px;
	margin-top: 10px;
	border: none !important;
	box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2);
}

.blue-text {
	color: #00BCD4
}

.form-control-label {
	margin-bottom: 0
}

input, textarea, button {
	padding: 8px 15px;
	border-radius: 5px !important;
	margin: 5px 0px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	font-size: 18px !important;
	font-weight: 300
}

input:focus, textarea:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #00BCD4;
	outline-width: 0;
	font-weight: 400
}

.btn-block {
	text-transform: uppercase;
	font-size: 15px !important;
	font-weight: 400;
	height: 43px;
	cursor: pointer
}

.btn-block:hover {
	color: #fff !important
}

button:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	outline-width: 0
}

.success-message{
            color:green
        }
        .error-message{
            color:red;
        }
</style>
         <link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="custom-menu">
					<button type="button" id="sidebarCollapse" class="btn btn-primary">
	          <i class="fa fa-bars"></i>
	          <span class="sr-only">Toggle Menu</span>
	        </button>
        </div>
				<div class="p-4">
		  		<h1><a href="index.html" class="logo"><img alt="logo" src="image/geons-dashboard.png"></a></h1>
	        <ul class="list-unstyled components mb-5">
	          <li >
	            <a href="user.jsp"><span class="fa fa-home mr-3"></span>Dashboard</a>
	          </li>
	          <li>
	              <a href="Paysliplist.jsp"><span class="fa fa-user mr-3"></span>payslip List</a>
	          </li>
	            <li class="active">
	              <a href="createpassword.jsp"><span class="fa fa-user mr-3"></span>Create Password</a>
	          </li>
	          <li>
              <a href=LogoutServlet><span class="fa fa-briefcase mr-3"></span>Signout</a>
	          </li>
	        </ul>

	         


	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">    
      
             <h1 class="text-center  font-weight-bold  text-secondary fs-3 top mt-0">Change Password</h1>
             
             <form action="changepassword" method="post"  class="needs-validation" novalidate>


    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-4">
                <div class="mb-3">
                <div class="form-group">
                    <label for="empid" class="form-label text-primary">Your email Id</label>
                   
                       <input type="text" class="form-control" name="emailid" id="empid" onblur="validate(1)" 
                    	 value="<%=employee.getEmail()%>" readonly required>  
                    	
                   <div class="valid-feedback"></div>
                     <div class="invalid-feedback">enter your emailid</div>
                  </div>   
                </div>
                <div class="mb-3">
                 <div class="form-group">
                    <label for="currentpassword" class="form-label text-primary">Current Password</label>
                    <input type="password" class="form-control" name="currentpass" id="currentpassword" onblur="validate(2)" 
                   required>
                    <div class="valid-feedback"></div>
                     <div class="invalid-feedback">enter your password</div>
                 </div>    
                </div>
                <div class="mb-3">
                <div class="form-group">
                    <label for="password" class="form-label text-primary">New Password</label>
                    <input type="password" class="form-control" name="newpass" id="password" onblur="validate(3)" 
                     required>
                    <div class="valid-feedback"></div>
                     <div class="invalid-feedback">enter your password</div>
                  </div>

                </div>
                <div class="mb-3">
                <div class="form-group">
                    <label for="confirmpassword" class="form-label text-primary">Confirm Password</label>
                    <input type="password" class="form-control" name="confirmpass" id="confirmpassword" onblur="validate(4)" 
                     required>
                   <div class="valid-feedback"></div>
                     <div class="invalid-feedback">enter your password</div>
                    <div class="form-text confirm-message"></div>
                    
                </div>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
                
                        	   <% if(null!=request.getAttribute("password")) 
								{
									%>
									<p class="text-danger text-center"><%= request.getAttribute("password")%></p>
									<%
								}
								%>
     </div>
            
        </div>
    </div>

</form>
             
          
</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $('#password, #confirmpassword').on('keyup', function(){

        $('.confirm-message').removeClass('success-message').removeClass('error-message');

        let password=$('#password').val();
        let confirm_password=$('#confirmpassword').val();

        if(password===""){
            $('.confirm-message').text("Password Field cannot be empty").addClass('error-message');
        }
        else if(confirm_password===""){
            $('.confirm-message').text("Confirm Password Field cannot be empty").addClass('error-message');
        }
        else if(confirm_password===password)
        {
            $('.confirm-message').text('Password Match!').addClass('success-message');
        }
        else{
            $('.confirm-message').text("Password Doesn't Match!").addClass('error-message');
        }

    });
</script>
               <!-- another validation2 -->
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
	       
			
<script type="text/javascript" src="js/changepass.js"></script>

		
		

    <script src="jquery.min.js"></script>
    <script src="popper.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src="main.js"></script>
    
    <script src="js/cpassword.js"></script>
  </body>
</html>

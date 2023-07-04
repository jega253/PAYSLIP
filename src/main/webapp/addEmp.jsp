<!doctype html>
<html lang="en">
<head>
<title>Admin Dash</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<style>
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
</style>
</head>
<body>
	
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="p-4 pt-3 ">
				<a href="#" class="img logo rounded-circle  mb-3"
					style="background-image: url(image/geon.jpg);"></a>
				<ul class="list-unstyled components ">
					<li><a href="admin.jsp">Home</a></li>
					<li class="active"><a href="addEmp.jsp" data-toggle="collapse"
						aria-expanded="false">Add Emp</a></li>
					<li><a href="Edit.jsp">Edit Emp</a></li>
					<li><a href="LogoutServlet">Signout</a></li>
				</ul>

				<div class="footer">
					<p>
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						,Geons Logix.com<i class="icon-heart" aria-hidden="true"></i> by <a
							href="https://Geonslogix.com" target="_blank">Geonslogix.com</a>
					</p>
				</div>

			</div>
		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-1">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-primary">
						<i class="fa fa-bars"></i> <span class="sr-only">Toggle
							Menu</span>
					</button>
					<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="nav navbar-nav ml-auto">
							
							<li class="nav-item"><a class="nav-link" href="LogoutServlet">Signout</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<!--    -------addEmp---   -->
			<div class="row d-flex justify-content-center body">
				<div class="text-center">

					<div class="card">
						<h5 class="text-center " style="color: #00BCD4;">Add Employee</h5>
						
						
						<form class="form-card" action="addemp" method="post"
							style="background-color: light-gray;">


							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Employee id<span
										class="text-danger"> *</span></label> <input type="text" name="empid"
										id="empid" placeholder="Enter employee id"
										onblur="validate(1)">
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Full Name<span
										class="text-danger"> *</span></label> <input type="text"
										name="fullname" id="fullname"
										placeholder="Enter employee name" onblur="validate(2)">
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Email<span
										class="text-danger"> *</span></label> <input type="text" name="email"
										id="email" placeholder="Enter email" onblur="validate(3)">
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Doj<span
										class="text-danger"> *</span></label> <input type="text" name="doj"
										id="doj" placeholder="Enter Doj" onblur="validate(4)">
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">PTax<span
										class="text-danger"> *</span></label> <input type="text" name="ptax"
										id="ptax" placeholder="Enter Ptax" onblur="validate(5)">
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">PF<span
										class="text-danger"> *</span></label> <input type="text" name="pf"
										id="pf" placeholder="Enter Pf" onblur="validate(6)">
								</div>
							</div>

							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Aadhar<span
										class="text-danger"> *</span></label> <input type="text" name="aadhar"
										id="aadhar" placeholder="Enter aadhar" onblur="validate(7)">
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Designation<span
										class="text-danger"> *</span></label>
										<select  name="designation" id="designation" onblur="validate(8)" style="height:50px; 
										margin-top:3px;">
										 <option value="" style="text-align:center;">--choose----</option>
                                         <option value="Training Developer" style="text-align:center;">Training Developer</option>
                                         <option value="Junior Developer" style="text-align:center;">Junior Developer</option>
                                         <option value="Senior Developer" style="text-align:center;">Senior Developer</option>
                                    </select>
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Department<span
										class="text-danger"> *</span></label> 
										<select  name="department" id="department" onblur="validate(9)" style="height:50px; 
										margin-top:3px;">
										 <option value="" style="text-align:center;">--choose----</option>
                                         <option value="CSE" style="text-align:center;">CSE</option>
                                         <option value="MECH" style="text-align:center;">MECH</option>
                                         <option value="MCA" style="text-align:center;">MCA</option>
                                    </select>
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">PAN<span
										class="text-danger"> *</span></label> <input type="text"
										name="pan" id="pan" placeholder="Enter Pan number"
										onblur="validate(10)">
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Casual Leave<span
										class="text-danger"> *</span></label> <input type="text" name="cLeave"
										id="cLeave" placeholder="Enter cLeave"
										onblur="validate(11)">
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Sick Leave<span
										class="text-danger"> *</span></label> <input type="text"
										name="sLeave" id="sLeave"
										placeholder="Enter sLeave" onblur="validate(12)">
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Privilege Leave<span
										class="text-danger"> *</span></label> <input type="text" name="pLeave"
										id="pLeave" placeholder="Enter pLeave"
										onblur="validate(13)">
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">CTC<span
										class="text-danger"> *</span></label> <input type="text"
										name="ctc" id="ctc"
										placeholder="Enter ctc" onblur="validate(14)">
								</div>
							</div>
							
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Password<span
										class="text-danger"> *</span></label> <input type="password" name="password"
										id="password" 
										onblur="validate(15)">
								</div>
							</div>
		                  
							
							<div class="row justify-content-end">
								<div class="form-group col-sm-6">
									<button type="submit" class="btn-block btn-primary" action="ctc.jsp">Next
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			
	</div>
		<script src="js/addemp.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
		
</body>

</html>

<!-- <div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Password<span
										class="text-danger"> *</span></label> <input type="password"
										name="password" id="password" placeholder="Enter Password"
										onblur="validate(12)">
								</div> -->
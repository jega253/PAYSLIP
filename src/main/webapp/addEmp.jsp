<%@page import="payslip.geons.dto.Ctc"%>
<%@page import="java.util.List"%>
 
 <%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import="payslip.geons.dto.Employee"%>
<!doctype html>
<html lang="en">
<head>
<% if(request.getSession().getAttribute("listofemployee") == null){%>
	<%response.sendRedirect("login.jsp"); %>
<% }%>
<%HttpSession httpSession = request.getSession();%>
 <% HttpSession mysession = request.getSession();%>
<%List <Employee> employees=(List)mysession.getAttribute("listofemployee"); 
int lastIndex=employees.size()-1;
Employee employee=(Employee)employees.get(lastIndex);
Employee addedemp=(Employee)request.getAttribute("checkEmp");
double ctc=0;
%>

<link rel="icon" type="image/x-icon" href="image/geon.jpg">
  	<title>Payroll</title>
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
	height: 40px;
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
#foot{
		  padding-top:95%;
		}
</style>
</head>
<body>
	
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="p-4 p-md-2 sticky-top">
				<a href="#" class="img logo rounded-circle  mb-3"
					style="background-image: url(image/logopra.jpg);"></a>
				<ul class="list-unstyled components ">
					<li><a href="admin.jsp">Home</a></li>
					<li class="active"><a href="addEmp.jsp" data-toggle="collapse"
						aria-expanded="false">Add Emp</a></li>
					<li><a href="Edit.jsp">Edit Emp</a></li>
					 <li>
              <a href="Gross.jsp">Payslips</a>
	          </li>
					<li><a href="LogoutServlet">Signout</a></li>
				</ul>

				<div class="footer" id="foot">
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
		 <div id="content" class="p-4 p-md-0">

        <nav class="navbar navbar-expand-lg navbar-light bg-light  sticky-top">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
              <ul class="nav navbar-nav ml-auto ">
                
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Signout</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
			<!--    -------addEmp---   -->
			<div class=" mt-0 justify-content-center body">
				<div class="text-center">

					<div class="card">
					 <span><img width="80" height="80"  src="image/add.png" alt="addemp logo" /></span>
						<h5 class="text-center" style="color: #00BCD4;">Add Employee</h5>
						
						
						<form class="form-card" action="addemp" method="post" name = "form1"
							style="background-color: light-gray;">
									

							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Employee id<span
										class="text-danger"> *</span></label> <input type="text" name="empid"
										id="empid" placeholder="Enter employee id" value=<%=employee.getNextnumber() %>  onblur="validate(1)">
										<% if(null!=request.getAttribute("empid")) 
										{
											%>
											<p class="text-danger"><%= request.getAttribute("empid")%></p>
											<%
										}
										%>
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Employee Name<span
										class="text-danger"> *</span></label> <input type="text"
										name="fullname" id="fullname"
										placeholder="Enter employee name" onblur="validate(2)" value=<%=(addedemp!=null)?(addedemp.getFullname()!=null)?addedemp.getFullname():" ":" " %>>
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Email<span
										class="text-danger"> *</span></label> <input type="text" name="email"
										id="email" placeholder="Enter email" onblur="validate(3)" name = 'text1' value=<%=(addedemp!=null)?(addedemp.getEmail()!=null)?addedemp.getEmail():"":"" %>>
										<% if(null!=request.getAttribute("email")) 
										{
											%>
											<p class="text-danger"><%= request.getAttribute("email")%></p>
											<%
										}
										%>
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Doj<span
										class="text-danger"> *</span></label> <input type="date" name="doj"
										id="doj" placeholder="Enter Doj" onblur="validate(4)"value=<%=(addedemp!=null)?(addedemp.getDoj()!=null)?addedemp.getDoj():"":"" %>>
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Role<span
										class="text-danger"> *</span></label>
										<select  name="role" id="role" style="height:50px; 
										margin-top:3px;">
										
                                         <option value="0" >Admin</option>
                                         <option value="1">User</option>
                                    </select>
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Gender<span
										class="text-danger"> *</span></label> 
										<select  name="gender" id="gender" style="height:50px; 
										margin-top:3px;">
                                         <option value="Male"><%=(addedemp!=null)?(addedemp.getGenter()!=null)?addedemp.getGenter():"Male":"Male" %></option>
                                         <option value="Female">Female</option>
                                    </select>
								</div>
							</div>

							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Aadhar<span
										class="text-danger"> *</span></label> <input type="text" name="aadhar"
										id="aadhar" placeholder="Enter aadhar"  onblur="validate(5)" value=<%=(addedemp!=null)?(addedemp.getAadhar()!=0)?addedemp.getAadhar():0:0 %>>
										<span id="messages"></span>
										<% if(null!=request.getAttribute("aadhar")) 
										{
											%>
											<p class="text-danger"><%= request.getAttribute("aadhar")%></p>
											<%
										}
										%>
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Designation<span
										class="text-danger"> *</span></label>
										<select  name="designation" id="designation"  style="height:50px; 
										margin-top:3px;">
                                         <option value="Training Developer" ><%=(addedemp!=null)?(addedemp.getDesignation()!=null)?addedemp.getDesignation():"Training Developer":"Training Developer" %></option>
                                         <option value="Junior Developer">Junior Developer</option>
                                         <option value="Senior Developer">Senior Developer</option>
                                    </select>
								</div>
							</div>
							<div class="row justify-content-between text-left form-group ">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Department<span
										class="text-danger"> *</span></label> 
										<select  name="department" id="department" style="height:50px; 
										margin-top:3px;">
                                         <option value="CSE" ><%=(addedemp!=null)?(addedemp.getDepartment()!=null)?addedemp.getDepartment():"CSE":"CSE" %></option>
                                         <option value="MECH">MECH</option>
                                         <option value="MCA">MCA</option>
                                    </select>
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">PAN<span
										class="text-danger"> *</span></label> <input type="text"
										name="pan" id="pan" placeholder="Enter Pan number"
										onblur="validate(6)"value=<%=(addedemp!=null)?(addedemp.getPan()!=null)?addedemp.getPan():"":"" %>>
										<% if(null!=request.getAttribute("pan")) 
										{
											%>
											<p class="text-danger"><%= request.getAttribute("pan")%></p>
											<%
										}
										%>
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Casual Leave<span
										class="text-danger"> *</span></label> <input type="text" name="cLeave"
										id="cLeave" placeholder="Enter cLeave"
										onblur="validate(7)" value=<%=(addedemp!=null)?(addedemp.getcLeave()!=0)?addedemp.getcLeave():0:0 %>>
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Sick Leave<span
										class="text-danger"> *</span></label> <input type="text"
										name="sLeave" id="sLeave"
										placeholder="Enter sLeave" onblur="validate(8)" value=<%=(addedemp!=null)?(addedemp.getsLeave()!=0)?addedemp.getsLeave():0:0%>>
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Privilege Leave<span
										class="text-danger"> *</span></label> <input type="text" name="pLeave"
										id="pLeave" placeholder="Enter pLeave"
										onblur="validate(9)" value=<%=(addedemp!=null)?(addedemp.getpLeave()!=0)?addedemp.getpLeave():0:0 %>>
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">CTC<span
										class="text-danger"> *</span></label> <input type="text"
										name="ctc" id="ctc"
										placeholder="Enter ctc" onblur="validate(10)" value=<%=(ctc!=0)?ctc:0 %>>
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">PF No<span
										class="text-danger"> *</span></label> <input type="text" name="pf"
										id="pf" placeholder="Enter pf no"
										onblur="validate(11)" value=<%=(addedemp!=null)?(addedemp.getPf()!=0)?addedemp.getPf():0:0 %>>
										<% if(null!=request.getAttribute("pf")) 
										{
											%>
											<p class="text-danger"><%= request.getAttribute("pf")%></p>
											<%
										}
										%>
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">UAN No<span
										class="text-danger"> *</span></label> <input type="text"
										name="uan" id="uan"
										placeholder="Enter uan no" onblur="validate(12)" value=<%=(addedemp!=null)?(addedemp.getUan()!=null)?addedemp.getUan():"":"" %>>
										<% if(null!=request.getAttribute("uan")) 
										{
											%>
											<p class="text-danger"><%= request.getAttribute("uan")%></p>
											<%
										}
										%>
								</div>
							</div>
							
							
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-1">Password<span
										class="text-danger"> *</span></label> <input type="password" name="password"
										id="password" value="welcome@123"
										onblur="validate(13)">
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
		                  <!-- Mail Format -->
  	
   
  
</body>

</html>

<!-- <div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Password<span
										class="text-danger"> *</span></label> <input type="password"
										name="password" id="password" placeholder="Enter Password"
										onblur="validate(12)">
								</div> -->
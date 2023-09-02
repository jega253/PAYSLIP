

 <%@page import="java.util.List"%>
 
 <%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%>
 <%@page import="java.util.ArrayList"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <% HttpSession mysession = request.getSession();
    %>

<!doctype html>
<%
    if (session.getAttribute("listofemployee") == null)  {
        response.sendRedirect("LogoutServlet"); 
    }
%>
<html lang="en">
  <head>
  <link rel="icon" type="image/x-icon" href="image/geon.jpg">
  	<title>Payroll</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style.css">
		 <style>
          body {
            color: #000;
            overflow-x: hidden;
          }

          .card {
            padding: 30px 40px;
            margin-top: 10px;
            margin-bottom: 60px;
            border: none !important;
            box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2);
          }

          .blue-text {
            color: #00bcd4;
          }

          .form-control-label {
            margin-bottom: 0;
          }

          input,
          textarea,
          button {
            padding: 8px 15px;
            border-radius: 5px !important;
            margin: 5px 0px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            font-size: 18px !important;
            font-weight: 300;
          }

          input:focus,
          textarea:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            border: 1px solid #00bcd4;
            outline-width: 0;
            font-weight: 400;
          }

          .btn-block {
            text-transform: uppercase;
            font-size: 15px !important;
            font-weight: 400;
            height: 43px;
            cursor: pointer;
          }

          .btn-block:hover {
            color: #fff !important;
          }

          button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0;
          }
          #foot{
		  padding-top:97%;
		}
        </style>
		
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 p-md-2 sticky-top">
		  		<a href="#" class="img logo rounded-circle   mb-3" style="background-image: url(image/logopra.jpg);"></a>
	        <ul class="list-unstyled components ">
	          <li>
	            <a href="admin.jsp">Home</a>
	          </li>
	          <li>
	              <a href="addEmp.jsp">Add Emp</a>
	          </li>
	          <li>
              <a href="Edit.jsp">Edit Emp</a>
	          </li>
	          <li>
              <a href="Gross.jsp">Payslips</a>
	          </li>
	          <li>
              <a href="LogoutServlet">Signout</a>
	          </li>
	        </ul>

	        <div class="footer" id="foot">
	        	<p>
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> ,Geons Logix.com<i class="icon-heart" aria-hidden="true"></i> by <a href="https://Geonslogix.com" target="_blank">Geonslogix.com</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
        
          <div class=" justify-content-center">
            <div class="text-center">
              <div class="card">
              <span><img width="80" height="80"  src="image/edit.png" alt="edit emp logo" /></span>
                 <h5 class="text-center" style="color: #00BCD4;">Edit Employee</h5> 
                <form class="form-card" action="Editemp" method="post">
                  <div class="row justify-content-between text-left">
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >Full Name<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="fullname"
                        id="fullname"
                        value="<%= ((Employee) session.getAttribute("editemp")).getFullname() %>"
                        onblur="validate(2)"
                      />
                    </div>
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >Email<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="email"
                        id="email"
                        value="<%= ((Employee) session.getAttribute("editemp")).getEmail() %>"
                        onblur="validate(3)"
                      />
                    </div>
                  </div>
                  <div class="row justify-content-between text-left">
                    
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >Doj<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="doj"
                        id="doj"
                        value="<%= ((Employee) session.getAttribute("editemp")).getDoj() %>"
                        onblur="validate(4)"
                      />
                    </div>
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >PF No<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="pf"
                        id="pf"
                        value="<%= ((Employee) session.getAttribute("editemp")).getPf() %>"
                        onblur="validate(6)"
                      />
                    </div>
                  </div>
    
                  <div class="row justify-content-between text-left">
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >PTax<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="ptax"
                        id="ptax"
                        value="<%= ((Employee) session.getAttribute("editemp")).getPtax() %>"
                        onblur="validate(7)"
                      />
                    </div>
                    <div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">UAN No<span
										class="text-danger"> *</span></label> <input type="text"
										name="uan" id="uan" value="<%= ((Employee) session.getAttribute("editemp")).getUan() %>"
										placeholder="Enter uan no" onblur="validate(2)">
								</div>
                   
                  </div>
                  <!-- <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3">Aadhar<span
                                class="text-danger"> *</span></label> <input type="text" id="email"
                                name="email" placeholder="Enter Aadhar" onblur="validate(3)">
                        </div>
                        <div class="form-group col-sm-6 flex-column d-flex">
                            <label class="form-control-label px-3">UAN<span
                                class="text-danger"> *</span></label> <input type="text" id="mob"
                                name="mob" placeholder="Enter Uan" onblur="validate(4)">
                        </div>
                    </div>-->
                  <div class="row justify-content-between text-left">
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >Aadhar<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="aadhar"
                        id="aadhar"
                        value="<%= ((Employee) session.getAttribute("editemp")).getAadhar() %>"
                        onblur="validate(9)"
                      />
                    </div>
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >Designation<span class="text-danger"> *</span></label
                      >
                      <select  name="designation" id="designation"  style="height:50px; 
										margin-top:3px;"  >
										 <option value="" ><%= ((Employee) session.getAttribute("editemp")).getDesignation() %></option>
                                         <option value="Training Developer" >Training Developer</option>
                                         <option value="Junior Developer">Junior Developer</option>
                                         <option value="Senior Developer">Senior Developer</option>
                                    </select>
                    </div>
                  </div>
                  <div class="row justify-content-between text-left">
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >Department<span class="text-danger"> *</span></label
                      >
                      <select  name="department" id="department"  style="height:50px; 
										margin-top:3px;">
										 <option value=""><%= ((Employee) session.getAttribute("editemp")).getDepartment() %></option>
                                         <option value="CSE" >CSE</option>
                                         <option value="MECH">MECH</option>
                                         <option value="MCA">MCA</option>
                                    </select>
                    </div>
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >Password<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="password"
                        id="password"
                        value="<%= ((Employee) session.getAttribute("editemp")).getPassword() %>"
                        onblur="validate(12)"
                      />
                    </div>
                  </div>
                  <div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Casual Leave<span
										class="text-danger"> *</span></label> <input type="text" name="cLeave"
										id="cLeave"  value="<%= ((Employee) session.getAttribute("editemp")).getcLeave()%>"
										onblur="validate(11)">
								</div>
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Sick Leave<span
										class="text-danger"> *</span></label> <input type="text"
										name="sLeave" id="sLeave" value="<%= ((Employee) session.getAttribute("editemp")).getsLeave() %>"
										 onblur="validate(12)">
								</div>
							</div>
							<div class="row justify-content-between text-left">
								<div class="form-group col-sm-6 flex-column d-flex">
									<label class="form-control-label px-3">Privilege Leave<span
										class="text-danger"> *</span></label> <input type="text" name="pLeave"
										id="pLeave"  value="<%= ((Employee) session.getAttribute("editemp")).getpLeave() %>"
										onblur="validate(13)">
								</div>
								
							</div>
                 
                 
                  <div class="row justify-content-end">
                    <div class="form-group col-sm-6">
                      <button type="submit" class="btn-block btn-primary"> Update
                       
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        </div>   
        </div>
        
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    
  </body>
</html>
        

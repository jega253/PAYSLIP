

 <%@page import="java.util.List"%>
 
 <%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%> 
 <%@page import="java.util.ArrayList"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <% HttpSession mysession = request.getSession();
    %>

<!doctype html>
<html lang="en">
  <head>
  	<title>Admin Dash</title>
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
        </style>
		
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 pt-3 ">
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
              <a href="LogoutServlet">Signout</a>
	          </li>
	        </ul>

	        <div class="footer">
	        	<p>
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> ,Geons Logix.com<i class="icon-heart" aria-hidden="true"></i> by <a href="https://Geonslogix.com" target="_blank">Geonslogix.com</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>

	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-1">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
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
                <li class="nav-item active">
                    <a class="nav-link" href="admin.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addEmp.jsp">Add Emp</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Edit.jsp">Edit Emp</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Signout</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        
          <div class="row d-flex justify-content-center">
            <div class="text-center">
              <div class="card">
                <h5 class="text-center mb-1" style="color: #00bcd4">
                  Edit Employee
                </h5>
                <form class="form-card" action="Editemp" method="post">
                  <div class="row justify-content-between text-left">
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >Employee id<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="empid"
                        id="empid"
                        value="<%= ((Employee) session.getAttribute("editemp")).getEmpid() %>"
                        onblur="validate(1)"
                      />
                    </div>
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
                  </div>
                  <div class="row justify-content-between text-left">
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
                  </div>
                  <div class="row justify-content-between text-left">
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >ESI<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="esi"
                        id="esi"
                        value="<%= ((Employee) session.getAttribute("editemp")).getEsi() %>"
                        onblur="validate(5)"
                      />
                    </div>
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >PF<span class="text-danger"> *</span></label
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
                      <label class="form-control-label px-3"
                        >Hra<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="hra"
                        id="hra"
                        value="<%= ((Employee) session.getAttribute("editemp")).getHra() %>"
                        onblur="validate(8)"
                      />
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
                      <input
                        type="text"
                        name="designation"
                        id="designation"
                        value="<%= ((Employee) session.getAttribute("editemp")).getDesignation() %>"
                        onblur="validate(10)"
                      />
                    </div>
                  </div>
                  <div class="row justify-content-between text-left">
                    <div class="form-group col-sm-6 flex-column d-flex">
                      <label class="form-control-label px-3"
                        >Department<span class="text-danger"> *</span></label
                      >
                      <input
                        type="text"
                        name="depatrment"
                        id="depatrment"
                        value="<%= ((Employee) session.getAttribute("editemp")).getDepartment() %>"
                        onblur="validate(11)"
                      />
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
        
